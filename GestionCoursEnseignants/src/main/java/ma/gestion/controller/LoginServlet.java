package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.gestion.entity.Utilisateur;
import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Query<Utilisateur> query = session.createQuery("from Utilisateur where email = :email and motDePasse = :mdp", Utilisateur.class);
            query.setParameter("email", email);
            query.setParameter("mdp", password);
            Utilisateur utilisateur = query.uniqueResult();

            if (utilisateur != null) {
                HttpSession httpSession = request.getSession();
                Enseignant enseignant = session.get(Enseignant.class, utilisateur.getId());
                
                if (enseignant != null) {
                    // C'est un ENSEIGNANT
                    httpSession.setAttribute("enseignantConnecte", enseignant);
                    response.sendRedirect(request.getContextPath() + "/enseignant/index.jsp");
                } else {
                    // C'est un ADMIN
                    httpSession.setAttribute("utilisateurConnecte", utilisateur);
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                }
            } else {
                request.setAttribute("erreur", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/public/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Erreur lors de la connexion.");
        } finally {
            session.close();
        }
    }
}