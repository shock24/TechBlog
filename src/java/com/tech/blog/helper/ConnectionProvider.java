
package com.tech.blog.helper;
import java.sql.*;


public class ConnectionProvider {
    private static Connection con;
    private static String url;
    private static String password;
    private static String username;
    public static Connection getConnection()
    {
        url="jdbc:mysql://localhost/techblog";
        password="";
        username="root";
        try{
            if(con==null)
            {
                //driver class load
                Class.forName("com.mysql.jdbc.Driver");

                //create a connection..
                con=DriverManager.getConnection(url, username, password); 
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
