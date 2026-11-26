package ma.gestion.dao;

import ma.gestion.entity.Cours;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class CoursDAO {

    public boolean ajouterCours(Cours cours) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.persist(cours);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public List<Cours> getAllCours() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("FROM Cours ORDER BY code", Cours.class).list();
        } finally {
            session.close();
        }
    }

    public Cours getCoursById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.get(Cours.class, id);
        } finally {
            session.close();
        }
    }

    // Récupérer les cours affectés à un enseignant spécifique
    public List<Cours> getCoursByEnseignant(int enseignantId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            // On passe par l'entité Affectation qui fait le lien entre Enseignant et Cours
            // Adaptez "a.enseignant.id" et "a.cours" selon les noms exacts de vos attributs dans Affectation
            String hql = "SELECT a.cours FROM Affectation a WHERE a.enseignant.id = :ensId";
            Query<Cours> query = session.createQuery(hql, Cours.class);
            query.setParameter("ensId", enseignantId);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null; // Ou une liste vide
        } finally {
            session.close();
        }
    }
    public boolean modifierCours(Cours cours) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Cours coursExistant = session.get(Cours.class, cours.getId());
            if (coursExistant != null) {
                coursExistant.setCode(cours.getCode());
                coursExistant.setIntitule(cours.getIntitule());
                coursExistant.setVolumeHoraire(cours.getVolumeHoraire());
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public boolean supprimerCours(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Cours cours = session.get(Cours.class, id);
            if (cours != null) {
                session.remove(cours);
            }
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public boolean codeExiste(String code) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Query<Long> query = session.createQuery(
                    "SELECT COUNT(c) FROM Cours c WHERE c.code = :code", Long.class);
            query.setParameter("code", code);
            Long count = query.uniqueResult();
            return count != null && count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
}