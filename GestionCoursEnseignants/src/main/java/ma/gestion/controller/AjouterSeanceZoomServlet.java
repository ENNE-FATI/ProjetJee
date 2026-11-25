package ma.gestion.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ma.gestion.entity.Cours;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.SeanceZoom;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/ajouterSeanceZoom")
public class AjouterSeanceZoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Récupération des données du formulaire
        String coursIdStr = request.getParameter("cours_id");
        String dateHeureStr = request.getParameter("dateHeure");
        String dureeStr = request.getParameter("duree");
        String lienZoom = request.getParameter("lienZoom");
        
        // On récupère l'ID de l'enseignant caché dans le formulaire (Plan B)
        String enseignantIdStr = request.getParameter("enseignant_id");

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();

            // 2. Conversion des types
            int coursId = Integer.parseInt(coursIdStr);
            int duree = Integer.parseInt(dureeStr);
            LocalDateTime dateHeure = LocalDateTime.parse(dateHeureStr);

            // 3. Récupération de l'enseignant
            Enseignant enseignant = null;
            
            // D'abord on tente via le formulaire (le plus fiable)
            if (enseignantIdStr != null && !enseignantIdStr.isEmpty()) {
                int enseignantId = Integer.parseInt(enseignantIdStr);
                enseignant = session.get(Enseignant.class, enseignantId);
            } 
            
            // Si ça n'a pas marché, on tente via la session classique
            if (enseignant == null) {
                HttpSession httpSession = request.getSession();
                enseignant = (Enseignant) httpSession.getAttribute("user");
            }

            if (enseignant == null) {
                throw new Exception("Erreur fatale : Impossible de trouver l'enseignant (ni par ID, ni par Session).");
            }

            // 4. Récupération du cours
            Cours cours = session.get(Cours.class, coursId);
            if (cours == null) {
                throw new Exception("Erreur : Le cours sélectionné n'existe pas.");
            }

            // 5. Création et enregistrement de la séance
            SeanceZoom nouvelleSeance = new SeanceZoom();
            nouvelleSeance.setCours(cours);
            nouvelleSeance.setEnseignant(enseignant);
            nouvelleSeance.setDateHeure(dateHeure);
            nouvelleSeance.setDuree(duree);
            nouvelleSeance.setLienZoom(lienZoom);

            session.persist(nouvelleSeance);
            tx.commit();

            // 6. Redirection vers le Dashboard
            response.sendRedirect(request.getContextPath() + "/enseignant/dashboard");

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            // En cas d'erreur, on affiche le message sur la page d'accueil
            request.setAttribute("erreur", "Erreur lors de l'ajout : " + e.getMessage());
            request.getRequestDispatcher("/enseignant/index.jsp").forward(request, response);
        } finally {
            session.close();
        }
    }
}