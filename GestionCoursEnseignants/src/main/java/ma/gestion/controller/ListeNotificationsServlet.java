package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.dao.NotificationDAO;
import ma.gestion.entity.Notification;

import java.io.IOException;
import java.util.List;

@WebServlet("/ListeNotificationsServlet")
public class ListeNotificationsServlet extends HttpServlet {

    private NotificationDAO notificationDAO;

    @Override
    public void init() throws ServletException {
        notificationDAO = new NotificationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // On utilise la méthode de ton DAO pour récupérer la liste
            List<Notification> listeNotifs = notificationDAO.getAllNotifications();

            // On envoie la liste à la JSP
            request.setAttribute("listeNotifications", listeNotifs);

            // Redirection vers la page JSP (tu dois créer ce fichier)
            request.getRequestDispatcher("/admin/listeNotifications.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // Affiche l'erreur dans la console Tomcat pour comprendre
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading notifications.");
        }
    }
}