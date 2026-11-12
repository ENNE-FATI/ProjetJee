package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil;
import ma.gestion.util.PasswordUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.IOException;

@WebServlet("/inscriptionEnseignant")
public class InscriptionEnseignantServlet extends HttpServlet {

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
            // 1. Vérifier si l'email est déjà pris
            Query<Long> query = session.createQuery("SELECT COUNT(e) FROM Enseignant e WHERE e.email = :email", Long.class);
            query.setParameter("email", email);
            if (query.uniqueResult() > 0) {
                request.setAttribute("erreur", "Cet email est déjà utilisé.");
                request.getRequestDispatcher("/public/inscriptionEnseignant.jsp").forward(request, response);
                return;
            }

            // 2. Créer l'enseignant avec mot de passe crypté
            tx = session.beginTransaction();
            Enseignant enseignant = new Enseignant();
            enseignant.setNom(nom);
            enseignant.setPrenom(prenom);
            enseignant.setEmail(email);
            enseignant.setMotDePasse(PasswordUtil.hashPassword(password));
            if (specialite != null) enseignant.setSpecialite(specialite);

            session.persist(enseignant);
            tx.commit();

            response.sendRedirect(request.getContextPath() + "/public/login.jsp?msg=inscrit");

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur lors de l'inscription.");
            request.getRequestDispatcher("/public/inscriptionEnseignant.jsp").forward(request, response);
        } finally {
            session.close();
        }
    }
}