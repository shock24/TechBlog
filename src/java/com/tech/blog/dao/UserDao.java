
package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.*;


public class UserDao {
    Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    //method to insert user to database
    public boolean saveUser(User user)
    {
        boolean f=false;
        try{
            String query="INSERT INTO user(name, email, password, gender, about) VALUES(?,?,?,?,?)";
            PreparedStatement st=con.prepareStatement(query);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getGender());
            st.setString(5, user.getAbout());
            
            st.executeUpdate();
            f=true;
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    
    //get user by userEmail and userPassword
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try{
            String query="SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement st=con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            
            
            if(rs.next())
            {
                user=new User();
                String name=rs.getString("name");
                user.setName(name);
                
                int id=rs.getInt("id");
                user.setId(id);
                
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        try
        {
            String query="UPDATE user SET name=?, email=?, password=?, gender=?, about=?, profile=? WHERE id=?";
            PreparedStatement st=con.prepareCall(query);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getGender());
            st.setString(5, user.getAbout());
            st.setString(6, user.getProfile());
            st.setInt(7, user.getId());
            st.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId)
    {
        User user=null;
        try 
        {
            String query="SELECT * FROM user WHERE id=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet rs=pstmt.executeQuery();
            
            if(rs.next())
            {
                user=new User();
                String name=rs.getString("name");
                user.setName(name);
                
                int id=rs.getInt("id");
                user.setId(id);
                
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
}
