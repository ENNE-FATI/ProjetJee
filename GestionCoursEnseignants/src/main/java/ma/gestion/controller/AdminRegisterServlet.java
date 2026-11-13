package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.entity.Administrateur;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.IOException;

@WebServlet("/admin/registerAdmin")
public class AdminRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            // 1. Vérifier si l'email existe déjà
            Query<Long> query = session.createQuery("SELECT COUNT(u) FROM Utilisateur u WHERE u.email = :email", Long.class);
            query.setParameter("email", email);
            if (query.uniqueResult() > 0) {
                request.setAttribute("erreur", "Cet email est déjà utilisé par un autre compte.");
                request.getRequestDispatcher("/admin/ajouterAdmin.jsp").forward(request, response);
                return;
            }

            // 2. Créer et enregistrer le nouvel Administrateur
            tx = session.beginTransaction();
            Administrateur admin = new Administrateur();
            admin.setNom(nom);
            admin.setPrenom(prenom);
            admin.setEmail(email);
            admin.setMotDePasse(password);

            session.persist(admin);
            tx.commit();

            // 3. Redirection vers la page de login avec succès
            response.sendRedirect(request.getContextPath() + "/public/login.jsp?success=admin");

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            request.setAttribute("erreur", "Une erreur est survenue lors de la création du compte.");
            request.getRequestDispatcher("/admin/ajouterAdmin.jsp").forward(request, response);
        } finally {
            session.close();
        }
    }
}