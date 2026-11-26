
package ma.gestion.dao;

import ma.gestion.entity.Affectation;
import ma.gestion.entity.Cours;
import ma.gestion.entity.Enseignant;
import ma.gestion.entity.Ressource;
import ma.gestion.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.time.LocalDateTime;
import java.util.List;

public class RessourceDAO {

    // Récupérer les ressources d'un enseignant
    public List<Ressource> getRessourcesByEnseignant(int enseignantId) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            String hql =
                    "SELECT r FROM Ressource r " +
                            "JOIN FETCH r.cours " +
                            "WHERE r.enseignant.id = :id " +
                            "ORDER BY r.datePublication DESC";

            return session.createQuery(hql, Ressource.class)
                    .setParameter("id", enseignantId)
                    .list();

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(
                    "Erreur lors de la récupération des ressources", e
            );
        }
    }

    // Récupérer les cours affectés à un enseignant
    public List<Cours> getCoursByEnseignant(int enseignantId) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            String hql =
                    "SELECT DISTINCT a.cours " +
                            "FROM Affectation a " +
                            "WHERE a.enseignant.id = :id " +
                            "ORDER BY a.cours.code";

            List<Cours> cours = session.createQuery(hql, Cours.class)
                    .setParameter("id", enseignantId)
                    .list();

            System.out.println(
                    "DEBUG DAO : Enseignant = " + enseignantId
            );

            System.out.println(
                    "DEBUG DAO : Nombre de cours = " + cours.size()
            );

            return cours;

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(
                    "Erreur lors de la récupération des cours", e
            );
        }
    }

    // Vérifier qu'un cours est affecté à cet enseignant
    public boolean estCoursAffecte(int coursId, int enseignantId) {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            Long nombre = session.createQuery(
                            "SELECT COUNT(a) FROM Affectation a " +
                                    "WHERE a.cours.id = :coursId " +
                                    "AND a.enseignant.id = :enseignantId",
                            Long.class
                    )
                    .setParameter("coursId", coursId)
                    .setParameter("enseignantId", enseignantId)
                    .uniqueResult();

            return nombre != null && nombre > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Ajouter une ressource
    public boolean ajouterRessource(
            String titre,
            String type,
            String chemin,
            int coursId,
            int enseignantId) {

        Transaction tx = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            tx = session.beginTransaction();

            // Vérifier l'affectation du cours
            Long nombre = session.createQuery(
                            "SELECT COUNT(a) FROM Affectation a " +
                                    "WHERE a.cours.id = :coursId " +
                                    "AND a.enseignant.id = :enseignantId",
                            Long.class
                    )
                    .setParameter("coursId", coursId)
                    .setParameter("enseignantId", enseignantId)
                    .uniqueResult();

            if (nombre == null || nombre == 0) {
                tx.rollback();
                return false;
            }

            Cours cours = session.get(Cours.class, coursId);
            Enseignant enseignant =
                    session.get(Enseignant.class, enseignantId);

            if (cours == null || enseignant == null) {
                tx.rollback();
                return false;
            }

            Ressource ressource = new Ressource();

            ressource.setTitre(titre);
            ressource.setType(type);
            ressource.setChemin(chemin);
            ressource.setCours(cours);
            ressource.setEnseignant(enseignant);
            ressource.setDatePublication(LocalDateTime.now());

            session.persist(ressource);

            tx.commit();

            return true;

        } catch (Exception e) {

            if (tx != null && tx.isActive()) {
                tx.rollback();
            }

            e.printStackTrace();
            return false;
        }
    }
}
