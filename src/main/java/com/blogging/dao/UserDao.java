//for data base interaction
package com.blogging.dao;
import java.sql.*;

import com.blogging.entities.User;
public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
//	method to insert user data
	
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			
			String query = "insert into user(name, email, password, about, gender) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAbout());
			pstmt.setString(5, user.getGender());
			
			pstmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return f;
	}
	
	//get user by email and password
	
	public User getEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
			
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				
//				data from database
				String name = rs.getString("name");
//				set to user object
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAbout(rs.getString("about"));
				user.setGender(rs.getString("gender"));
				user.setRdate(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean userUpdate(User u) {
		boolean f = false;
		try {
			String query = "UPDATE USER SET name=?, email=?, password=?, about=?, gender=?, profile=? WHERE id=?";
			PreparedStatement ps= con.prepareStatement(query);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getAbout());
			ps.setString(5, u.getGender());
			ps.setString(6, u.getProfile());
			ps.setInt(7, u.getId());
			
			ps.executeUpdate();
			f=true;


			
		} catch (Exception e) {
				e.printStackTrace();	
		}
		return f;
	}
	
	public User getUserByUserid(int UserId) {
		User user = null;
		String q ="select * from user where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(q);
			ps.setInt(1, UserId);
			
			ResultSet rs  = ps.executeQuery();
			
			if(rs.next()) {
user = new User();
				
//				data from database
				String name = rs.getString("name");
//				set to user object
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setAbout(rs.getString("about"));
				user.setGender(rs.getString("gender"));
				user.setRdate(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
