package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import ma.gestion.entity.Cours;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.Ressource;
import ma.gestion.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

@WebServlet("/enseignant/ressources")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 12 * 1024 * 1024
)
public class RessourceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final long MAX_FILE_SIZE = 10 * 1024 * 1024;

    private static final Set<String> EXTENSIONS_AUTORISEES =
            new HashSet<>(Arrays.asList("pdf", "doc", "docx", "ppt", "pptx"));

    private Enseignant getEnseignantConnecte(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/public/login.jsp");
            return null;
        }
        Object user = session.getAttribute("user");
        if (!(user instanceof Enseignant)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Accès réservé aux enseignants.");
            return null;
        }
        return (Enseignant) user;
    }

    // ===================== GET =====================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Enseignant enseignant = getEnseignantConnecte(request, response);
        if (enseignant == null) return;

        List<Cours> mesCours = new ArrayList<>();
        List<Ressource> listeRessources = new ArrayList<>();

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            int idEns = enseignant.getId();
            System.out.println("=== DEBUG RESSOURCES ===");
            System.out.println("ID Enseignant : " + idEns);

            // 1. Cours affectés à l'enseignant (HQL, même logique que les autres servlets)
            mesCours = session.createQuery(
                            "SELECT DISTINCT a.cours FROM Affectation a " +
                                    "WHERE a.enseignant.id = :idEns",
                            Cours.class)
                    .setParameter("idEns", idEns)
                    .list();

            System.out.println("Nombre de cours trouvés : " + mesCours.size());

            // 2. Ressources de l'enseignant
            listeRessources = session.createQuery(
                            "SELECT r FROM Ressource r " +
                                    "LEFT JOIN FETCH r.cours " +
                                    "WHERE r.enseignant.id = :idEns " +
                                    "ORDER BY r.datePublication DESC",
                            Ressource.class)
                    .setParameter("idEns", idEns)
                    .getResultList();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur lors du chargement : " + e.getMessage());
        }

        // Toujours définir les attributs (jamais null pour la JSP)
        request.setAttribute("mesCours", mesCours);
        request.setAttribute("nombreCours", mesCours.size());
        request.setAttribute("listeRessources", listeRessources);

        request.getRequestDispatcher("/enseignant/ressources.jsp").forward(request, response);
    }

    // ===================== POST =====================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        Enseignant enseignant = getEnseignantConnecte(request, response);
        if (enseignant == null) return;

        String titre = request.getParameter("titre");
        String type = request.getParameter("type");
        String coursIdStr = request.getParameter("cours_id");
        Part fichier = request.getPart("fichier");

        if (titre == null || titre.trim().isEmpty()
                || type == null || type.trim().isEmpty()
                || coursIdStr == null || coursIdStr.trim().isEmpty()
                || fichier == null || fichier.getSize() == 0) {
            redirect(request, response, "champs");
            return;
        }

        if (fichier.getSize() > MAX_FILE_SIZE) {
            redirect(request, response, "taille");
            return;
        }

        String nomOriginal = Paths.get(fichier.getSubmittedFileName()).getFileName().toString();
        int point = nomOriginal.lastIndexOf('.');

        if (point < 0) {
            redirect(request, response, "extension");
            return;
        }

        String extension = nomOriginal.substring(point + 1).toLowerCase(Locale.ROOT);

        if (!EXTENSIONS_AUTORISEES.contains(extension)) {
            redirect(request, response, "extension");
            return;
        }

        int coursId;
        try {
            coursId = Integer.parseInt(coursIdStr.trim());
            if (coursId <= 0) throw new NumberFormatException();
        } catch (NumberFormatException e) {
            redirect(request, response, "cours");
            return;
        }

        Transaction transaction = null;
        Path cheminFichier = null;
        boolean fichierEnregistre = false;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();

            Enseignant enseignantBD = session.get(Enseignant.class, enseignant.getId());
            if (enseignantBD == null) throw new Exception("Enseignant introuvable.");

            // Vérifier que le cours est bien affecté à cet enseignant (HQL)
            Long count = session.createQuery(
                            "SELECT COUNT(a) FROM Affectation a " +
                                    "WHERE a.enseignant.id = :idEns AND a.cours.id = :idCours",
                            Long.class)
                    .setParameter("idEns", enseignantBD.getId())
                    .setParameter("idCours", coursId)
                    .uniqueResult();

            if (count == null || count == 0) {
                transaction.rollback();
                redirect(request, response, "cours");
                return;
            }

            Cours cours = session.get(Cours.class, coursId);
            if (cours == null) throw new Exception("Cours introuvable.");

            String nouveauNom = UUID.randomUUID() + "." + extension;
            String dossier = getServletContext().getRealPath("/uploads/ressources");

            if (dossier == null) throw new IOException("Impossible de trouver le dossier de stockage.");

            Path dossierPath = Paths.get(dossier);
            Files.createDirectories(dossierPath);
            cheminFichier = dossierPath.resolve(nouveauNom);

            try (InputStream input = fichier.getInputStream()) {
                Files.copy(input, cheminFichier, StandardCopyOption.REPLACE_EXISTING);
            }
            fichierEnregistre = true;

            Ressource ressource = new Ressource();
            ressource.setTitre(titre.trim());
            ressource.setType(type);
            ressource.setChemin("uploads/ressources/" + nouveauNom);
            ressource.setCours(cours);
            ressource.setEnseignant(enseignantBD);
            ressource.setDatePublication(LocalDateTime.now());

            session.persist(ressource);
            transaction.commit();

            redirect(request, response, "ajoute");

        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null && transaction.isActive()) transaction.rollback();
            if (fichierEnregistre && cheminFichier != null) {
                try {
                    Files.deleteIfExists(cheminFichier);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
            }
            redirect(request, response, "erreur");
        }
    }

    private void redirect(HttpServletRequest request, HttpServletResponse response, String message)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/enseignant/ressources?msg=" + message);
    }
}