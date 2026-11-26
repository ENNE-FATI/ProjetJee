
package ma.gestion.controller;

import ma.gestion.entity.Affectation;
import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.hibernate.Session;

import java.io.IOException;
import java.util.List;

@WebServlet("/enseignant/classes")
public class ClassesEnseignantServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession httpSession = request.getSession(false);

        // Vérifier la connexion
        if (httpSession == null
                || httpSession.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/public/login.jsp"
            );
            return;
        }

        Enseignant enseignant =
                (Enseignant) httpSession.getAttribute("user");

        try (Session session =
                     HibernateUtil.getSessionFactory().openSession()) {

            // Récupérer les affectations de l'enseignant
            // et charger directement les cours associés.
            String hql =
                    "SELECT DISTINCT a " +
                            "FROM Affectation a " +
                            "JOIN FETCH a.cours " +
                            "WHERE a.enseignant.id = :idEns " +
                            "ORDER BY a.cours.code";

            List<Affectation> listeClasses =
                    session.createQuery(hql, Affectation.class)
                            .setParameter("idEns", enseignant.getId())
                            .getResultList();

            System.out.println(
                    "Enseignant ID : " + enseignant.getId()
            );

            System.out.println(
                    "Nombre d'affectations : " + listeClasses.size()
            );

            // Envoyer la liste vers la JSP
            request.setAttribute("listeClasses", listeClasses);

            request.getRequestDispatcher(
                    "/enseignant/classes.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "erreur",
                    "Erreur lors du chargement des cours : " + e.getMessage()
            );

            request.getRequestDispatcher(
                    "/enseignant/classes.jsp"
            ).forward(request, response);
        }
    }
}
