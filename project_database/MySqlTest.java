/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysqltest;

/**
 *
 * @author S
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import java.time.Clock;
import java.time.ZoneId;

public class MySqlTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }

        final String ID = "dweave8";
        final String PW = "COSC*c447q";
        final String SERVER = "jdbc:mysql://triton.towson.edu:3360/?serverTimezone=EST#/dweave8db";
        String querys;
        try {
            Connection con = DriverManager.getConnection(SERVER, ID, PW);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("use dweave8db");
            rs = stmt.executeQuery("show tables");
            //ResultSet rs = stmt.executeQuery("show schemas");
            PreparedStatement updateStaff = null;

            while (rs.next()) {
               String database = rs.getString("Tables_in_dweave8db");
               System.out.println(database);
            }
            //querys = "UPDATE dweave8db.Branch SET city = 'Baltimore' WHERE branchNo = 'B002';";
            querys = "show schemas;";

            updateStaff = con.prepareStatement(querys);
            updateStaff.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }//Main

}
