package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;

import java.io.IOException;
import java.util.List;

@WebServlet("/affectations")
public class AffectationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // Requête SQL qui ramène exactement les 6 colonnes qu'on veut
            String sql = "SELECT a.id, c.code, c.intitule, u.nom, u.prenom, a.dateAffectation " +
                         "FROM affectations a " +
                         "JOIN cours c ON a.cours_id = c.id " +
                         "JOIN utilisateurs u ON a.enseignant_id = u.id";

            List<Object[]> listeAffectations = session.createNativeQuery(sql).list();
            
            request.setAttribute("listeAffectations", listeAffectations);
            request.getRequestDispatcher("/admin/affectations.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(500, "Erreur SQL : " + e.getMessage());
        } finally {
            session.close();
        }
    }
}