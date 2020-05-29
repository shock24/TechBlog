/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM categories";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean flag = false;
        try {
            String query = "INSERT INTO posts(pTitle, pContent, pCode, pPic, catId, userId) VALUES (?,?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, p.getpTitle());
            st.setString(2, p.getpContent());
            st.setString(3, p.getpCode());
            st.setString(4, p.getpPic());
            st.setInt(5, p.getCatId());
            st.setInt(6, p.getUserId());

            st.executeUpdate();
            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    //get all the posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        //fetch all posts from database
        try {
            //ordering because we need to show recent post first
            String query = "SELECT * FROM posts order by pid desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp pDate = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userId");

                Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                list.add(post);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //get all post by particular category-id
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //get all post by particular post-id
    public Post getPostByPostId(int postId) {
        Post post = null;
        try 
        {
            String query = "SELECT * FROM posts WHERE pid=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);

            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int cid=rs.getInt("catId");
                int userId = rs.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
            }
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return post;
    }

}
