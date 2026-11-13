package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.Administrateur;
import ma.gestion.util.HibernateUtil;
import ma.gestion.util.PasswordUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // ==========================================================
    // ADMIN FIXE (Codé en dur)
    // ==========================================================
    private static final String ADMIN_EMAIL = "admin@test.edu";
    private static final String ADMIN_PASSWORD = "admin123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // ==========================================================
        // 1. VÉRIFICATION DE L'ADMIN FIXE
        // ==========================================================
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();

            // On crée un objet Administrateur en mémoire pour éviter l'erreur de conversion (ClassCastException)
            Administrateur admin = new Administrateur();
            admin.setNom("Super");
            admin.setPrenom("Admin");
            admin.setEmail(ADMIN_EMAIL);

            // On stocke cet objet en session
            session.setAttribute("adminConnecte", admin);

            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
            return;
        }

        // ==========================================================
        // 2. VÉRIFICATION DES ENSEIGNANTS (Base de données)
        // ==========================================================
        String hashedPassword = PasswordUtil.hashPassword(password);

        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        try {
            Query<Enseignant> query = hibernateSession.createQuery(
                    "FROM Enseignant e WHERE e.email = :email AND e.motDePasse = :mdp", Enseignant.class);
            query.setParameter("email", email);
            query.setParameter("mdp", hashedPassword);

            Enseignant enseignant = query.uniqueResult();

            if (enseignant != null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("enseignantConnecte", enseignant);
                response.sendRedirect(request.getContextPath() + "/enseignant/index.jsp");
            } else {
                request.setAttribute("erreur", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/public/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur technique lors de la connexion.");
            request.getRequestDispatcher("/public/login.jsp").forward(request, response);
        } finally {
            hibernateSession.close();
        }
    }
}