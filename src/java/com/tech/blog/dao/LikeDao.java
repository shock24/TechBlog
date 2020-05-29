package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid, int uid)
    {
        boolean f=false;
        try 
        {
            String query="INSERT INTO likes(pid, uid) VALUES(?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            
            pstmt.executeUpdate();
            f=true;
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public int countLikeOnPost(int pid)
    {
        int count=0;
        try 
        {
            String query="SELECT COUNT(*) FROM likes WHERE pid=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, pid);
            
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                //first column of result will contain total count
              count=rs.getInt("count(*)");
            }
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean isLikedByUser(int pid, int uid)
    {
        boolean f=false;
        try 
        {
            String query="SELECT * FROM likes WHERE pid=? AND uid=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                f=true;
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
    public boolean deleteLike(int pid, int uid)
    {
        boolean f=false;
        try 
        {
            String query="DELETE FROM likes WHERE pid=? AND uid=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeQuery();
            f=true;
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        
        return f;
    }
}
