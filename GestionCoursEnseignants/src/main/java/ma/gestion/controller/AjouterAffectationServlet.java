package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.util.List;

@WebServlet("/ajouterAffectation")
public class AjouterAffectationServlet extends HttpServlet {

    // 1. Afficher le formulaire avec les listes
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // Récupérer les cours (ID, Code, Intitulé)
            List<Object[]> listeCours = session.createNativeQuery("SELECT id, code, intitule FROM cours").list();
            // Récupérer les enseignants (ID, Nom, Prénom)
            List<Object[]> listeEnseignants = session.createNativeQuery(
                "SELECT u.id, u.nom, u.prenom FROM utilisateurs u JOIN enseignants e ON u.id = e.id"
            ).list();

            request.setAttribute("listeCours", listeCours);
            request.setAttribute("listeEnseignants", listeEnseignants);
            
            request.getRequestDispatcher("/admin/ajouterAffectation.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    // 2. Enregistrer l'affectation
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String coursId = request.getParameter("cours_id");
        String enseignantId = request.getParameter("enseignant_id");
        String dateAff = request.getParameter("dateAffectation");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            
            // Insertion SQL native
            // On met des IDs par défaut pour l'admin (3) et l'année (1) pour éviter les erreurs de clé étrangère
            String sql = "INSERT INTO affectations (cours_id, enseignant_id, dateAffectation, administrateur_id, annee_universitaire_id) " +
                         "VALUES (:cours_id, :enseignant_id, :dateAff, 3, 1)";
            
            session.createNativeQuery(sql)
                    .setParameter("cours_id", coursId)
                    .setParameter("enseignant_id", enseignantId)
                    .setParameter("dateAff", dateAff)
                    .executeUpdate();
            
            tx.commit();
            response.sendRedirect(request.getContextPath() + "/affectations");
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            response.sendError(500, "Erreur d'ajout de l'affectation.");
        } finally {
            session.close();
        }
    }
}