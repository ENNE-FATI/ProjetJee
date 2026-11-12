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

@WebServlet("/supprimerEnseignant")
public class SupprimerEnseignantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            Long id = Long.parseLong(idParam);
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                
                // 1. Supprimer d'abord les dépendances (affectations, séances, ressources)
                session.createNativeQuery("DELETE FROM affectations WHERE enseignant_id = :id").setParameter("id", id).executeUpdate();
                session.createNativeQuery("DELETE FROM seances_zoom WHERE enseignant_id = :id").setParameter("id", id).executeUpdate();
                session.createNativeQuery("DELETE FROM ressources WHERE enseignant_id = :id").setParameter("id", id).executeUpdate();
                
                // 2. Supprimer l'enseignant
                session.createNativeQuery("DELETE FROM enseignants WHERE id = :id").setParameter("id", id).executeUpdate();
                
                // 3. Supprimer l'utilisateur lié
                session.createNativeQuery("DELETE FROM utilisateurs WHERE id = :id").setParameter("id", id).executeUpdate();
                
                tx.commit();
                response.sendRedirect(request.getContextPath() + "/listeEnseignants");
                
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                e.printStackTrace();
                response.sendError(500, "Erreur de suppression : " + e.getMessage());
            } finally {
                session.close();
            }
        }
    }
}