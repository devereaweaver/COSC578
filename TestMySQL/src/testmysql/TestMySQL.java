/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package testmysql;

/**
 *
 * @author devere
 */
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Clock;
import java.time.ZoneId;

public class TestMySQL {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // check to make sure driver installed correctly 
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
        
        // set up db parameters 
        final String id = "root";
        final String pw = "password";
        final String server = "jdbc:mysql://localhost:3306/?serverTimezone=EST#/?user=root";
        String queries;
        
         
       try {
         // connect to MySQL server
         Connection con = DriverManager.getConnection(server, id, pw);
         Statement stmt = con.createStatement();
         
         // try out a prepared statement 
         PreparedStatement getTables = con.prepareStatement("show tables");
         
         
         // connect to the correct schema 
         stmt.executeQuery("use law_firm");
         
         // let's see the tables
         //ResultSet rs = stmt.executeQuery("show tables");
         ResultSet rs = getTables.executeQuery();
         
         // iterate over result set to see
         while (rs.next()) {
            String table = rs.getString("Tables_in_law_firm");
            System.out.println(table);
         }
         
         
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}  // Main
