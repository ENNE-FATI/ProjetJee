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

@WebServlet("/ajouterEnseignant")
public class AjouterEnseignantServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String specialite = request.getParameter("specialite");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            // 1. Insérer l'utilisateur (mot de passe hashé, comme le fait le login)
            String sqlUser = "INSERT INTO utilisateurs (nom, prenom, email, motDePasse) VALUES (:nom, :prenom, :email, :password)";
            session.createNativeQuery(sqlUser)
                    .setParameter("nom", nom)
                    .setParameter("prenom", prenom)
                    .setParameter("email", email)
                    .setParameter("password", PasswordUtil.hashPassword(password))
                    .executeUpdate();

            // 2. Récupérer l'ID
            Long newId = ((Number) session.createNativeQuery("SELECT LAST_INSERT_ID()").uniqueResult()).longValue();

            // 3. Insérer l'enseignant
            String sqlEns = "INSERT INTO enseignants (id, specialite) VALUES (:id, :specialite)";
            session.createNativeQuery(sqlEns)
                    .setParameter("id", newId)
                    .setParameter("specialite", specialite)
                    .executeUpdate();

            tx.commit();
            response.sendRedirect(request.getContextPath() + "/listeEnseignants");

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            response.sendError(500, "Erreur lors de l'ajout.");
        } finally {
            session.close();
        }
    }
}