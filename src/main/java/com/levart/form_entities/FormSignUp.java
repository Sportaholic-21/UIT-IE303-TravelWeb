package com.levart.form_entities;

public class FormSignUp {
	private String name;
	private String phone;
	private String email;
	private String pass;
	private int rememberme;
	public FormSignUp() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public int getRememberme() {
		return rememberme;
	}

	public void setRememberme(int rememberme) {
		this.rememberme = rememberme;
	}

}
