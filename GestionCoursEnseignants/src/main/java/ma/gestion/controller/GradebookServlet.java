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

@WebServlet("/gradebook")
public class GradebookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Vérifier si l'enseignant est connecté
        HttpSession httpSession = request.getSession(false);
        if (httpSession == null || httpSession.getAttribute("enseignantConnecte") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Enseignant enseignant = (Enseignant) httpSession.getAttribute("enseignantConnecte");

        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try {
            // 2. Récupérer les affectations (cours) de cet enseignant
            // Cela permettra d'afficher la liste de ses classes dans le gradebook
            Query<Affectation> query = session.createQuery("from Affectation where enseignant.id = :idEns", Affectation.class);
            query.setParameter("idEns", enseignant.getId());
            List<Affectation> listeClasses = query.list();

            // 3. Envoyer la liste à la JSP
            request.setAttribute("listeClasses", listeClasses);
            
            // 4. Rediriger vers la page JSP du gradebook
            request.getRequestDispatcher("/enseignant/gradebook.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors du chargement des classes.");
        } finally {
            session.close();
        }
    }
}