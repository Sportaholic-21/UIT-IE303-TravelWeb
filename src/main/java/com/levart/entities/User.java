package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "userTable")
public class User {
	@Id
	@Column(name = "userID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userID;
	
	@Column(name = "username", length = 20)
	private String username;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "pass")
	private String pass;
	
	@Column(name = "userRole")
	private int userRole;

	public User() {
		super();
	}

	public User(int userID, String username, String email, String pass, int userRole) {
		super();
		this.userID = userID;
		this.username = username;
		this.email = email;
		this.pass = pass;
		this.userRole = userRole;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getUserRole() {
		return userRole;
	}

	public void setUserRole(int userRole) {
		this.userRole = userRole;
	}
	
	
	
}
