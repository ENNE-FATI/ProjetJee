package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // 1. Nombre total d'enseignants
            Number totalEnseignants = (Number) session
                    .createNativeQuery("SELECT COUNT(*) FROM enseignants").uniqueResult();
            request.setAttribute("totalEnseignants", totalEnseignants.intValue());

            // 2. Les 3 derniers enseignants ajoutés
            List<Enseignant> derniers = session
                    .createQuery("from Enseignant e order by e.id desc", Enseignant.class)
                    .setMaxResults(3)
                    .list();
            request.setAttribute("derniersEnseignants", derniers);

            // 3. Nombre total de cours
            Number totalCours = (Number) session
                    .createNativeQuery("SELECT COUNT(*) FROM cours").uniqueResult();
            request.setAttribute("totalCours", totalCours.intValue());

            // 4. Nombre total d'affectations
            Number totalAffectations = (Number) session
                    .createNativeQuery("SELECT COUNT(*) FROM affectations").uniqueResult();
            request.setAttribute("totalAffectations", totalAffectations.intValue());

            // 5. Volume horaire total affecté
            Number totalHeures = (Number) session.createNativeQuery(
                    "SELECT COALESCE(SUM(c.volumeHoraire), 0) " +
                    "FROM affectations a JOIN cours c ON a.cours_id = c.id").uniqueResult();
            request.setAttribute("totalHeures", totalHeures.intValue());

            // 6. Les 3 dernières affectations (code, intitulé, nom, prénom)
            List<Object[]> dernieresAffectations = session.createNativeQuery(
                    "SELECT c.code, c.intitule, u.nom, u.prenom " +
                    "FROM affectations a " +
                    "JOIN cours c ON a.cours_id = c.id " +
                    "JOIN utilisateurs u ON a.enseignant_id = u.id " +
                    "ORDER BY a.id DESC LIMIT 3").list();
            request.setAttribute("derniersAffectations", dernieresAffectations);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }
}
