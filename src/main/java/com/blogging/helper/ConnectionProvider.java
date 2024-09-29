package com.blogging.helper;
import java.sql.*;
public class ConnectionProvider {

	private static Connection con;
	
	public static Connection getConnection(){
		
		String url = "jdbc:mysql://localhost:3306/Blogging";
		String uname = "----";
		String password = "---------";
		try {
			if(con==null) {
				//load driver
				Class.forName("com.mysql.cj.jdbc.Driver");
				//create connection 
				con = DriverManager.getConnection(url,uname,password);
				
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
