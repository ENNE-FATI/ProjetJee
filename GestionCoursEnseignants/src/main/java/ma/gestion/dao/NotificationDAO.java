package ma.gestion.dao;

import ma.gestion.entity.Notification;
import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;

public class NotificationDAO {

    // Sauvegarder une notification
    public void save(Notification notification) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(notification);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Récupérer les notifications d'un utilisateur spécifique (pour l'enseignant)
    public List<Notification> getNotificationsByUtilisateur(int utilisateurId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Notification where utilisateur.id = :uid order by dateEnvoi desc", Notification.class)
                    .setParameter("uid", utilisateurId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Récupérer TOUTES les notifications (pour l'admin)
    public List<Notification> getAllNotifications() {
        // On utilise ta classe HibernateUtil pour ouvrir la session proprement
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            // On fait un "LEFT JOIN FETCH" pour charger l'utilisateur en même temps
            // et éviter l'erreur "LazyInitializationException" lors de l'affichage du nom dans le JSP
            String hql = "SELECT n FROM Notification n LEFT JOIN FETCH n.utilisateur ORDER BY n.dateEnvoi DESC";
            return session.createQuery(hql, Notification.class).list();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}