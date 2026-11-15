package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.util.HibernateUtil;
import ma.gestion.util.PasswordUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/ajouterAffectation")
public class AjouterAffectationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            List<Object[]> listeCours = session.createNativeQuery("SELECT id, code, intitule FROM cours").list();
            List<Object[]> listeEnseignants = session.createNativeQuery(
                "SELECT u.id, u.nom, u.prenom FROM utilisateurs u JOIN enseignants e ON u.id = e.id"
            ).list();

            request.setAttribute("listeCours", listeCours);
            request.setAttribute("listeEnseignants", listeEnseignants);

            // le fichier s'appelle ajouterAffectations.jsp (avec un "s")
            request.getRequestDispatcher("/admin/ajouterAffectations.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Erreur lors du chargement du formulaire : " + e.getMessage());
        } finally {
            session.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String coursId = request.getParameter("cours_id");
        String enseignantId = request.getParameter("enseignant_id");
        String dateAff = request.getParameter("dateAffectation");
        if (dateAff == null || dateAff.trim().isEmpty()) {
            dateAff = LocalDate.now().toString();
        }

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            long administrateurId = getOuCreerAdministrateur(session);
            long anneeId = getOuCreerAnnee(session);

            String sql = "INSERT INTO affectations (cours_id, enseignant_id, dateAffectation, administrateur_id, annee_universitaire_id) " +
                         "VALUES (:cours_id, :enseignant_id, :dateAff, :admin_id, :annee_id)";

            session.createNativeQuery(sql)
                    .setParameter("cours_id", Integer.parseInt(coursId))
                    .setParameter("enseignant_id", Integer.parseInt(enseignantId))
                    .setParameter("dateAff", dateAff)
                    .setParameter("admin_id", administrateurId)
                    .setParameter("annee_id", anneeId)
                    .executeUpdate();

            tx.commit();
            response.sendRedirect(request.getContextPath() + "/affectations");
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            response.sendError(500, "Erreur d'ajout de l'affectation : " + e.getMessage());
        } finally {
            session.close();
        }
    }

    private long getOuCreerAdministrateur(Session session) {
        Number id = (Number) session.createNativeQuery("SELECT MIN(id) FROM administrateurs").uniqueResult();
        if (id != null) {
            return id.longValue();
        }
        session.createNativeQuery(
                "INSERT INTO utilisateurs (nom, prenom, email, motDePasse) VALUES (:nom, :prenom, :email, :mdp)")
                .setParameter("nom", "Super")
                .setParameter("prenom", "Admin")
                .setParameter("email", "admin@test.edu")
                .setParameter("mdp", PasswordUtil.hashPassword("admin123"))
                .executeUpdate();
        Number newId = (Number) session.createNativeQuery("SELECT LAST_INSERT_ID()").uniqueResult();
        session.createNativeQuery("INSERT INTO administrateurs (id) VALUES (:id)")
                .setParameter("id", newId.longValue())
                .executeUpdate();
        return newId.longValue();
    }

    private long getOuCreerAnnee(Session session) {
        Number id = (Number) session.createNativeQuery("SELECT MIN(id) FROM annees_universitaires").uniqueResult();
        if (id != null) {
            return id.longValue();
        }
        session.createNativeQuery("INSERT INTO annees_universitaires (libelle) VALUES (:libelle)")
                .setParameter("libelle", "2026/2027")
                .executeUpdate();
        Number newId = (Number) session.createNativeQuery("SELECT LAST_INSERT_ID()").uniqueResult();
        return newId.longValue();
    }
}