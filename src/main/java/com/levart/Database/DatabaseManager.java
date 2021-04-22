package com.levart.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    protected Connection conn;
    //Kết nối Database
    public Connection Connect() throws SQLException 
    {
        conn = DriverManager.getConnection(DatabaseInfo.url, DatabaseInfo.user, DatabaseInfo.pass);
        if (conn != null)
            System.out.println("Connected");
        return conn;
    }
    public static void main() throws SQLException {
    	DatabaseManager db=new DatabaseManager();
    	db.Connect();
    }
}
