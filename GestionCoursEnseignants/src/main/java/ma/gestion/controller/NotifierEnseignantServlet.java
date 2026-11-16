package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ma.gestion.dao.NotificationDAO;
import ma.gestion.dao.EnseignantDAO;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.Notification;

import java.io.IOException;
import java.util.List;

@WebServlet("/NotifierEnseignantServlet")
public class NotifierEnseignantServlet extends HttpServlet {

    private EnseignantDAO enseignantDAO;
    private NotificationDAO notificationDAO;

    @Override
    public void init() throws ServletException {
        enseignantDAO = new EnseignantDAO();
        notificationDAO = new NotificationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Enseignant> listeEnseignants = enseignantDAO.getAllEnseignants();
            // C'est ce nom qui est utilisé dans le JSP avec items="${listeEnseignants}"
            request.setAttribute("listeEnseignants", listeEnseignants);

            // Redirection vers le JSP
            request.getRequestDispatcher("/admin/notifyTeacher.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading teachers.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Récupération des données du formulaire (avec les bons names)
            String enseignantIdStr = request.getParameter("enseignantId");
            String message = request.getParameter("message");

            if (enseignantIdStr != null && !enseignantIdStr.isEmpty() && message != null && !message.isEmpty()) {
                int enseignantId = Integer.parseInt(enseignantIdStr);

                Enseignant enseignant = enseignantDAO.getEnseignantById(enseignantId);

                if (enseignant != null) {
                    Notification notif = new Notification(message, enseignant);
                    notificationDAO.save(notif);

                    // Message de succès
                    request.getSession().setAttribute("successMessage", "Notification sent successfully!");
                }
            }

            // Redirection vers le dashboard (attention à l'URL exacte de ton dashboard)
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while sending the notification.");
            doGet(request, response); // Recharge le formulaire avec l'erreur
        }
    }
}