package com.blogging.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.blogging.entities.Category;
import com.blogging.entities.Posts;
import com.blogging.entities.User;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			String query = "select * from categories";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int cid = rs.getInt("cId");
				String name = rs.getString("cname");
				String description = rs.getString("cDescription");
				Category c = new Category(cid,name,description);
				list.add(c);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public boolean savePost(Posts p) {
		boolean f = false;
		
		try {
			String query = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCatId());
			pstmt.setInt(6, p.getUserId());
			
			pstmt.executeUpdate();
			
			f = true;

			
		} catch (Exception e) {
			e.printStackTrace();
}
		return f;
		
	}
	
	public List<Posts> getAllPost(){
		
		List<Posts> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts order by pId desc");
			ResultSet rs = pstmt.executeQuery();
			
		
			
			while(rs.next()) {
				int pid = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp date = rs.getTimestamp("pDate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");

				
				
				Posts pPost = new Posts(pid, pTitle, pContent, pCode, pPic, null, catId, userId);

				list.add(pPost);
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
public List<Posts> getAllPostById(int catId){
		
		List<Posts> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from posts where catId=?");
			pstmt.setInt(1, catId);
			ResultSet rs = pstmt.executeQuery();
			
		
			
			while(rs.next()) {
				int pid = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp date = rs.getTimestamp("pDate");
				int userId = rs.getInt("userId");

				
				
				Posts pPost = new Posts(pid, pTitle, pContent, pCode, pPic, null, catId, userId);

				list.add(pPost);
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

public Posts getPostById(int postId) {
	Posts pPost = null;
	String q = "select * from posts where pId=?";
	
	try {
		PreparedStatement pstmt = con.prepareStatement(q);
		pstmt.setInt(1, postId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int pid = rs.getInt("pId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			String pCode = rs.getString("pCode");
			String pPic = rs.getString("pPic");
			Timestamp date = rs.getTimestamp("pDate");
			int catId = rs.getInt("catId");
			int userId = rs.getInt("userId");

			
			 pPost = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return pPost;
	
}
	

}
