package ma.gestion.dao;

import ma.gestion.entity.Enseignant;
import ma.gestion.util.HibernateUtil; // Assure-toi d'avoir cette classe, sinon utilise ta config
import org.hibernate.Session;
import java.util.List;

public class EnseignantDAO {

    // 1. Récupérer tous les enseignants (pour la liste déroulante du formulaire)
    public List<Enseignant> getAllEnseignants() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Enseignant", Enseignant.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 2. Récupérer un enseignant par son ID
    public Enseignant getEnseignantById(int id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Enseignant.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}