package com.blogging.entities;

import java.sql.*;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String about;
	private String gender;
	private Timestamp rdate;
	private String profile;
	
	

	public User(int id, String name, String email, String password, String about, String gender, Timestamp rdate, String profile) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.about = about;
		this.gender = gender;
		this.rdate = rdate;
		this.profile = profile;
	}

	public User() {
		super();
	}

	public User(String name, String email, String password, String about, String gender) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.about = about;
		this.gender = gender;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Timestamp getRdate() {
		return rdate;
	}

	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	


}
