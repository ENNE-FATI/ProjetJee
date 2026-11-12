package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.entity.Enseignant; // On utilise l'entité
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // 1. On charge TOUS les enseignants (comme pour la liste)
            Query<Enseignant> query = session.createQuery("from Enseignant", Enseignant.class);
            List<Enseignant> tousLesEnseignants = query.list();
            
            // 2. On compte la taille de la liste
            int totalEnseignants = tousLesEnseignants.size();
            request.setAttribute("totalEnseignants", totalEnseignants);

            // 3. On prépare les 3 derniers (les 3 premiers de la liste si triée par ID)
            // (On peut juste prendre les 3 premiers pour l'affichage)
            request.setAttribute("derniersEnseignants", tousLesEnseignants);

            // 4. Pour les cours, on met 0 pour l'instant (on fera pareil plus tard)
            request.setAttribute("totalCours", 0);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        
        // On envoie tout à la page JSP
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}