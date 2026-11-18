package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            // On supprime explicitement les deux types de connexion (Enseignant et Admin)
            session.removeAttribute("user");
            session.removeAttribute("adminConnecte");

            // On détruit la session (ce qui supprime tout le reste)
            session.invalidate();
        }

        // --- LE BOUCLIER ANTI-CACHE (INDISPENSABLE POUR ADMIN ET ENSEIGNANT) ---
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        // Redirection vers la page de login
        response.sendRedirect(request.getContextPath() + "/public/login.jsp");
    }
}