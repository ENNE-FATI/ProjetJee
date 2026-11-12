package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.Affectation;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

@WebServlet("/classesEnseignant")
public class ClassesEnseignantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        Enseignant enseignant = (Enseignant) httpSession.getAttribute("enseignantConnecte");

        // Sécurité : si pas connecté, on renvoie au login
        if (enseignant == null) {
            response.sendRedirect(request.getContextPath() + "/public/login.jsp");
            return;
        }

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // Requête pour trouver les cours affectés à cet enseignant
            Query<Affectation> query = session.createQuery("from Affectation where enseignant.id = :id", Affectation.class);
            query.setParameter("id", enseignant.getId());
            List<Affectation> listeClasses = query.list();

            request.setAttribute("listeClasses", listeClasses);
            request.getRequestDispatcher("/enseignant/classes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Erreur lors du chargement des classes");
        } finally {
            session.close();
        }
    }
}