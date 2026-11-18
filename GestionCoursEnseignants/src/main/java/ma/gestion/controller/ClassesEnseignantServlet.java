package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.gestion.entity.Affectation;
import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

@WebServlet("/enseignant/classes")
public class ClassesEnseignantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession(false);
        if (httpSession == null || httpSession.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/public/login.jsp");
            return;
        }

        Enseignant enseignant = (Enseignant) httpSession.getAttribute("user");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            // CORRECTION : On utilise HQL. On demande juste les Affectations du prof.
            // Hibernate fera les jointures tout seul avec Cours et AnneeUniversitaire.
            String hql = "FROM Affectation a WHERE a.enseignant.id = :idEns";
            Query<Affectation> query = session.createQuery(hql, Affectation.class);
            query.setParameter("idEns", enseignant.getId());

            List<Affectation> listeClasses = query.list();

            request.setAttribute("listeClasses", listeClasses);
            request.getRequestDispatcher("/enseignant/classes.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur : " + e.getMessage());
            request.getRequestDispatcher("/enseignant/classes.jsp").forward(request, response);
        }
    }
}