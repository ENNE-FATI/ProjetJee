
package ma.gestion.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.io.InputStream;
import java.util.Properties;

import ma.gestion.entity.*;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        try {
            // Lire db.properties
            Properties properties = new Properties();

            InputStream input = HibernateUtil.class
                    .getClassLoader()
                    .getResourceAsStream("db.properties");

            if (input == null) {
                throw new RuntimeException(
                        "Fichier db.properties introuvable"
                );
            }

            properties.load(input);
            input.close();

            // Charger Hibernate
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");

            // Informations de connexion MySQL
            configuration.setProperty(
                    "hibernate.connection.driver_class",
                    properties.getProperty("db.driver")
            );

            configuration.setProperty(
                    "hibernate.connection.url",
                    properties.getProperty("db.url")
            );

            configuration.setProperty(
                    "hibernate.connection.username",
                    properties.getProperty("db.username")
            );

            configuration.setProperty(
                    "hibernate.connection.password",
                    properties.getProperty("db.password")
            );

            // Enregistrer les classes Entity
            configuration.addAnnotatedClass(Utilisateur.class);
            configuration.addAnnotatedClass(Administrateur.class);
            configuration.addAnnotatedClass(Enseignant.class);
            configuration.addAnnotatedClass(Cours.class);
            configuration.addAnnotatedClass(Affectation.class);
            configuration.addAnnotatedClass(AnneeUniversitaire.class);
            configuration.addAnnotatedClass(Notification.class);
            configuration.addAnnotatedClass(SeanceZoom.class);
            configuration.addAnnotatedClass(Ressource.class);

            // Créer SessionFactory
            sessionFactory = configuration.buildSessionFactory();

            System.out.println("Hibernate initialisé avec succès !");

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}
