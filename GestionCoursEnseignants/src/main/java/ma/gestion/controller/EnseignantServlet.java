package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.gestion.dao.EnseignantDAO; // IMPORTANT
import ma.gestion.dao.NotificationDAO;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.Notification;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

@WebServlet({"/listeEnseignants", "/enseignant/dashboard"})
public class EnseignantServlet extends HttpServlet {

    private NotificationDAO notificationDAO;
    private EnseignantDAO enseignantDAO; // On déclare le DAO

    @Override
    public void init() throws ServletException {
        notificationDAO = new NotificationDAO();
        enseignantDAO = new EnseignantDAO(); // On l'initialise
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/listeEnseignants".equals(path)) {
            listerTousLesEnseignants(request, response);
        } else if ("/enseignant/dashboard".equals(path)) {
            afficherDashboardEnseignant(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void listerTousLesEnseignants(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // On récupère la liste via le DAO
            List<Enseignant> liste = enseignantDAO.getAllEnseignants();

            // On l'envoie à la JSP
            request.setAttribute("listeEnseignants", liste);

            // On redirige vers la page admin (vérifiez que le chemin est exact)
            request.getRequestDispatcher("/admin/listeEnseignants.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur lors du chargement : " + e.getMessage());
            request.getRequestDispatcher("/admin/listeEnseignants.jsp").forward(request, response);
        }
    }

    private void afficherDashboardEnseignant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession(false);
        if (httpSession == null || httpSession.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/public/login.jsp");
            return;
        }

        Enseignant enseignant = (Enseignant) httpSession.getAttribute("user");
        int idEnseignant = enseignant.getId();

        request.setAttribute("nomEnseignant", enseignant.getNom());
        request.setAttribute("prenomEnseignant", enseignant.getPrenom());

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            // --- COURS ---
            String hqlCours = "SELECT a.cours.id, a.cours.code, a.cours.intitule " +
                    "FROM Affectation a " +
                    "WHERE a.enseignant.id = :idEns " +
                    "ORDER BY a.cours.code";

            Query<Object[]> qCours = session.createQuery(hqlCours, Object[].class);
            qCours.setParameter("idEns", idEnseignant);
            List<Object[]> mesCours = qCours.list();

            request.setAttribute("nbCours", mesCours.size());
            request.setAttribute("mesCours", mesCours);

            // --- NOTIFICATIONS ---
            List<Notification> notifications = notificationDAO.getNotificationsByUtilisateur(idEnseignant);

            long nbNonLues = 0;
            if (notifications != null) {
                nbNonLues = notifications.stream().filter(n -> !n.isLue()).count();
            } else {
                notifications = List.of();
            }

            request.setAttribute("notifications", notifications);
            request.setAttribute("nbNotifications", nbNonLues);

            // --- ZOOM ---
            String sqlZoom = "SELECT s.id, s.date_heure, s.lien_zoom, c.intitule FROM seance_zoom s JOIN cours c ON s.cours_id = c.id WHERE c.enseignant_id = :idEns AND s.date_heure > NOW() ORDER BY s.date_heure ASC LIMIT 5";
            Query<Object[]> qZoom = session.createNativeQuery(sqlZoom, Object[].class);
            qZoom.setParameter("idEns", idEnseignant);
            List<Object[]> prochainesSeances = qZoom.list();
            request.setAttribute("prochainesSeances", prochainesSeances);

            request.getRequestDispatcher("/enseignant/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur : " + e.getMessage());
            request.getRequestDispatcher("/enseignant/index.jsp").forward(request, response);
        }
    }
}