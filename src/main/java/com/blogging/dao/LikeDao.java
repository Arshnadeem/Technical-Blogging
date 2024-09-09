package com.blogging.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	
	Connection con;
	
	
	
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}




	public boolean insertLike(int pId,int uId) {

		boolean f = false;
		try {
			String q = " insert into UserLikes(uId,pId) values(?,?)";
			PreparedStatement ps = this.con.prepareStatement(q);
			
			ps.setInt(1, uId);
			ps.setInt(2, pId);
			ps.executeUpdate();
			f= true;

			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return f;
		
	}
	
	
	public int countLikeonPost(int pId) {
		int count = 0;
		
		String q = "select count(*) from UserLikes where pId=? ";
		
		try {
			PreparedStatement pst = this.con.prepareStatement(q);
			pst.setInt(1,pId);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
			    count = rs.getInt(1);  // fetches the count directly
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int postId,int userId ) {
	    boolean isLiked = false;
	    try {
	        String query = "SELECT * FROM UserLikes WHERE uId=? AND pId=?";
	        PreparedStatement pstmt = this.con.prepareStatement(query);
	        pstmt.setInt(1, userId);
	        pstmt.setInt(2, postId );
	        ResultSet set = pstmt.executeQuery();
	        if (set.next()) {
	            isLiked = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isLiked;
	}

	public boolean removeLike(int postId, int userId) {
	    boolean f = false;
	    try {
	        String q = "DELETE FROM UserLikes WHERE uId=? AND pId=?";
	        PreparedStatement pstmt = con.prepareStatement(q);
	        pstmt.setInt(1, userId);  // Set userId first
	        pstmt.setInt(2, postId);  // Set postId second
	        pstmt.executeUpdate();
	        f = true;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}


	
	
}
