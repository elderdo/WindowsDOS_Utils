// vim:ts=2:sw=2:sts=2:autoindent:smartindent:expandtab:
/*
 * TestDBConnection.java
 * Author: Douglas S. Elder
 * Date: 7/17/2017
 * Description: accept a connection string,
 * a user id, a password and connect to Oracle
 */

import java.sql.SQLException;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

public class TestDBConnection {
    private static void usage() {
        System.out.println("java -cp ojdbc14.jar TestDBConnection.jar connectionString userid password");
    }

    private static void printConnectInfo(String uid, String connStr) {
      System.out.println();
      System.out.println("Oracle Id: " + uid) ;
      System.out.println("ConnectionString: " + connStr);
      System.out.println();
    }

    private static void failure() {
      System.out.println("Failed to connect to Oracle") ;
    }

    private static void useProperties() {
        Properties prop = new Properties();
        InputStream input = null;

        System.out.println("Using DBConnection.properties");
        // get the properties file info and display it
        try {
            input = new FileInputStream("DBConnection.properties");
            prop.load(input);
            printConnectInfo(prop.getProperty("UID"),
                  prop.getProperty("ConnectionString"));

        } catch (IOException e) {
            e.printStackTrace();
            failure() ;
            System.exit(4);
        } finally {
            if (input == null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    System.exit(8);
                }
            }
        }

        try {
            DBConnection dbconn = new DBConnection();
        } catch (SQLException e) {
            System.err.println("SQLException");
            System.out.println(e);
            e.printStackTrace();
            failure();
            System.exit(10);
        } catch (Exception e) {
            System.err.println("General Exception");
            System.out.println(e.getMessage());
            System.out.println(e);
            e.printStackTrace();
            failure();
            System.exit(11);
        }
    }

    private static void useCommandLineArgs(String connectionString,
        String uid, String pwd) {
        try {
            System.out.println("Using command line arguments");
            printConnectInfo(uid, connectionString) ;
            DBConnection dbconn = new DBConnection(connectionString, uid, pwd);
        } catch (SQLException e) {
            System.out.println("Unable to connect: " + e.getMessage());
            failure();
            System.exit(12);
        } catch (ClassNotFoundException e) {
            System.out.println("ClassNotFoundException: " + e.getMessage());
            failure();
            System.exit(16);
        } catch (Exception e) {
            System.out.println("General Exception" + e.getMessage());
            failure();
            System.exit(20);
        }
    }

    public static void main(String args[]) {


        System.out.println("Connecting to Oracle ...");

        if (args.length == 3) {

            String connectionString = args[0];
            String uid = args[1];
            String pwd = args[2];

            useCommandLineArgs(connectionString, uid, pwd);

        } else {

            try {
                useProperties();
            } catch (Exception e) {
                System.out.println("General Exception" + e.getMessage());
                System.exit(24);
            }

        }

        System.out.println("Successfully connected to Oracle");

    }
}

