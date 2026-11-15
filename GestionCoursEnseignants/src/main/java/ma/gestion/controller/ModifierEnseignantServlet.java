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

@WebServlet("/modifierEnseignant")
public class ModifierEnseignantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            Long id = Long.parseLong(idParam);
            Session session = HibernateUtil.getSessionFactory().openSession();
            try {
                Object[] data = (Object[]) session.createNativeQuery(
                        "SELECT u.id, u.nom, u.prenom, u.email, e.specialite " +
                        "FROM utilisateurs u JOIN enseignants e ON u.id = e.id WHERE u.id = :id")
                        .setParameter("id", id).uniqueResult();

                request.setAttribute("enseignant", data);
                request.getRequestDispatcher("/admin/ajouterEnseignant.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                session.close();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Long id = Long.parseLong(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String specialite = request.getParameter("specialite");
        String password = request.getParameter("password");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            session.createNativeQuery("UPDATE utilisateurs SET nom=:nom, prenom=:prenom, email=:email WHERE id=:id")
                   .setParameter("nom", nom).setParameter("prenom", prenom).setParameter("email", email).setParameter("id", id).executeUpdate();

            // Le mot de passe n'est modifié que s'il est rempli
            if (password != null && !password.trim().isEmpty()) {
                session.createNativeQuery("UPDATE utilisateurs SET motDePasse=:mdp WHERE id=:id")
                       .setParameter("mdp", PasswordUtil.hashPassword(password)).setParameter("id", id).executeUpdate();
            }

            session.createNativeQuery("UPDATE enseignants SET specialite=:specialite WHERE id=:id")
                   .setParameter("specialite", specialite).setParameter("id", id).executeUpdate();

            tx.commit();
            response.sendRedirect(request.getContextPath() + "/listeEnseignants");
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            response.sendError(500, "Erreur lors de la modification : " + e.getMessage());
        } finally {
            session.close();
        }
    }
}