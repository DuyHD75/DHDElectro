package dao;

import java.sql.*;

/**
 *
 * @author This PC
 */
public class ConnectionDB {

    public ConnectionDB() {
    }

    public static Connection getConnection() {
        Connection connection = null;

        String DB_USER = "sa";
        String DB_PASS = "123123";

        String SERVER_NAME = "DESKTOP-SAVDU8T\\SQLEXPRESS";

        String DB_NAME = "DHD_Shop";

        String DB_URL = "jdbc:sqlserver://" + SERVER_NAME + ";databaseName=" + DB_NAME + ";encrypt=false;"
                + "trustServerCertificate=false;loginTimeout=30";

        try {
            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return connection;
    }

    
}
