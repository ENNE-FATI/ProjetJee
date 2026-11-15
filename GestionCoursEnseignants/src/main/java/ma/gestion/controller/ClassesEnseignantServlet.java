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
        Enseignant enseignant = (httpSession == null) ? null : (Enseignant) httpSession.getAttribute("enseignantConnecte");

        if (enseignant == null) {
            response.sendRedirect(request.getContextPath() + "/public/login.jsp");
            return;
        }

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // join fetch : évite la LazyInitializationException dans classes.jsp
            Query<Affectation> query = session.createQuery(
                    "select a from Affectation a join fetch a.cours join fetch a.anneeUniversitaire where a.enseignant.id = :id",
                    Affectation.class);
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