package ma.gestion.test;

import ma.gestion.util.HibernateUtil;
import org.hibernate.Session;

import java.sql.Connection;

public class TestConnexion {

    public static void main(String[] args) {

        try {
            Session session = HibernateUtil
                    .getSessionFactory()
                    .openSession();

            session.doWork(connection -> {
                System.out.println("Connexion réussie !");
                System.out.println("Base : "
                        + connection.getCatalog());
                System.out.println("Version MySQL : "
                        + connection.getMetaData().getDatabaseProductVersion());
            });

            session.close();

        } catch (Exception e) {
            System.out.println("Erreur de connexion !");
            e.printStackTrace();

        } finally {
            HibernateUtil.shutdown();
        }
    }
}