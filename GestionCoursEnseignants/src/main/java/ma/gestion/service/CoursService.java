package ma.gestion.service;

import ma.gestion.dao.CoursDAO;
import ma.gestion.entity.Cours;
import java.util.List;

public class CoursService {

    private CoursDAO coursDAO;

    public CoursService() {
        this.coursDAO = new CoursDAO();
    }

    // Retourne null si succès, ou un String contenant le message d'erreur
    public String ajouterCours(String code, String intitule, int volumeHoraire) {
        if (code == null || code.trim().isEmpty() || intitule == null || intitule.trim().isEmpty()) {
            return "Le code et l'intitulé sont obligatoires.";
        }
        if (volumeHoraire <= 0) {
            return "Le volume horaire doit être strictement supérieur à 0.";
        }
        if (coursDAO.codeExiste(code.trim())) {
            return "Le code « " + code + " » existe déjà dans la base de données.";
        }

        Cours nouveauCours = new Cours(code.trim(), intitule.trim(), volumeHoraire);
        boolean succes = coursDAO.ajouterCours(nouveauCours);

        return succes ? null : "Erreur technique lors de l'enregistrement.";
    }

    public String modifierCours(int id, String code, String intitule, int volumeHoraire) {
        Cours existant = coursDAO.getCoursById(id);
        if (existant == null) {
            return "Le cours à modifier n'existe pas.";
        }
        if (code == null || code.trim().isEmpty() || intitule == null || intitule.trim().isEmpty()) {
            return "Le code et l'intitulé sont obligatoires.";
        }

        existant.setCode(code.trim());
        existant.setIntitule(intitule.trim());
        existant.setVolumeHoraire(volumeHoraire);

        boolean succes = coursDAO.modifierCours(existant);
        return succes ? null : "Erreur technique lors de la modification.";
    }

    public List<Cours> getAllCours() {
        return coursDAO.getAllCours();
    }

    public Cours getCoursParId(int id) {
        return coursDAO.getCoursById(id);
    }

    public boolean supprimerCours(int id) {
        return coursDAO.supprimerCours(id);
    }
}