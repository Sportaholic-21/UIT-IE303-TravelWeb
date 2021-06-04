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

	@Column(name = "accountAddress")
	private String accountAddress;
	
	@Column(name = "socialMediaLink")
	private String socialMediaLink;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccountAddress() {
		return accountAddress;
	}

	public void setAccountAddress(String accountAddress) {
		this.accountAddress = accountAddress;
	}

	public String getSocialMediaLink() {
		return socialMediaLink;
	}

	public void setSocialMediaLink(String socialMediaLink) {
		this.socialMediaLink = socialMediaLink;
	}

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

	@Override
	public String toString() {
		return "Account [accountID=" + accountID + ", username="
				+ username + ", email=" + email + ", password="
				+ password + ", accountRole=" + accountRole + "Social Media: " + socialMediaLink
				+ "Address: = " + accountAddress+"]";
	}
}
