package ma.gestion.controller;

import ma.gestion.entity.Cours;
import ma.gestion.service.CoursService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/cours")
public class CoursServlet extends HttpServlet {

    private CoursService coursService;

    @Override
    public void init() {
        coursService = new CoursService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "liste";

        switch (action) {
            case "ajouter":
                request.getRequestDispatcher("/admin/ajouterCours.jsp").forward(request, response);
                break;

            case "modifier":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Cours cours = coursService.getCoursParId(id);
                    if (cours != null) {
                        request.setAttribute("cours", cours);
                        request.getRequestDispatcher("/admin/ajouterCours.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/cours?msg=erreur");
                    }
                } catch (Exception e) {
                    response.sendRedirect(request.getContextPath() + "/admin/cours?msg=erreur");
                }
                break;

            case "supprimer":
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    coursService.supprimerCours(id);
                    response.sendRedirect(request.getContextPath() + "/admin/cours?msg=supprime");
                } catch (Exception e) {
                    response.sendRedirect(request.getContextPath() + "/admin/cours?msg=erreur");
                }
                break;

            case "liste":
            default:
                List<Cours> liste = coursService.getAllCours();
                request.setAttribute("cours", liste);
                request.getRequestDispatcher("/admin/listeCours.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        String code = request.getParameter("code");
        String intitule = request.getParameter("intitule");
        int volumeHoraire = parseSafe(request.getParameter("volumeHoraire"));

        if ("enregistrer".equals(action)) {
            String erreur = coursService.ajouterCours(code, intitule, volumeHoraire);

            if (erreur == null) {
                response.sendRedirect(request.getContextPath() + "/admin/cours?msg=ajoute");
            } else {
                request.setAttribute("erreur", erreur);
                request.getRequestDispatcher("/admin/ajouterCours.jsp").forward(request, response);
            }

        } else if ("mettreAJour".equals(action)) {
            int id = parseSafe(request.getParameter("id"));
            String erreur = coursService.modifierCours(id, code, intitule, volumeHoraire);

            if (erreur == null) {
                response.sendRedirect(request.getContextPath() + "/admin/cours?msg=modifie");
            } else {
                request.setAttribute("erreur", erreur);
                request.getRequestDispatcher("/admin/ajouterCours.jsp").forward(request, response);
            }
        }
    }

    private int parseSafe(String val) {
        try { return Integer.parseInt(val); } catch (Exception e) { return 0; }
    }
}