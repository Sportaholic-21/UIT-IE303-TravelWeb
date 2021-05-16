package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "account")
public class Account {
	@Id
	@Column(name = "accountID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountID;
	
	@Column(name = "username", length = 20)
	private String username;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "pass")
	private String password;
	
	@Column(name = "accountRole")
	private int accountRole;

	public Account() {
		super();
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
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
		return password;
	}

	public void setPass(String password) {
		this.password = password;
	}

	public int getAccountRole() {
		return accountRole;
	}

	public void setAccountRole(int accountRole) {
		this.accountRole = accountRole;
	}
}
