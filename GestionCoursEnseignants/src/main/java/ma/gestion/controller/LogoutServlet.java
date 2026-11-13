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

        // 1. Récupérer la session existante
        HttpSession session = request.getSession(false);

        // 2. Si la session existe, on détruit TOUS ses attributs
        if (session != null) {
            session.removeAttribute("adminConnecte");
            session.removeAttribute("enseignantConnecte");
            session.invalidate(); // Détruit complètement la session
        }

        // 3. On force le navigateur à ne rien mettre en cache
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // 4. Redirection vers la page de login
        response.sendRedirect(request.getContextPath() + "/public/login.jsp");
    }
}