package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import java.io.IOException;
import java.util.List;

@WebServlet("/listeEnseignants")
public class EnseignantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // ON UTILISE UNE REQUÊTE SQL NATIVE POUR CONTOURNER LE PROBLÈME D'HÉRITAGE
            String sql = "SELECT u.id, u.nom, u.prenom, u.email, e.specialite " +
                         "FROM utilisateurs u " +
                         "JOIN enseignants e ON u.id = e.id";
            
            NativeQuery<Object[]> query = session.createNativeQuery(sql);
            List<Object[]> results = query.list();
            
            // On envoie les résultats à la JSP
            request.setAttribute("listeEnseignants", results);
            request.getRequestDispatcher("/admin/listeEnseignants.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur SQL : " + e.getMessage());
            request.getRequestDispatcher("/admin/listeEnseignants.jsp").forward(request, response);
        } finally {
            session.close();
        }
    }
}