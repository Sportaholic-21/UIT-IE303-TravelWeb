package com.levart.form_entities;

public class FormMessage {
	private int tourBookingID;
	private String name;
	private String email;
	private String message;
	private String phone;
	private Float start;

	public FormMessage() {
		// TODO Auto-generated constructor stub
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Float getStart() {
		return start;
	}

	public void setStart(Float start) {
		this.start = start;
	}

	public int getTourBookingID() {
		return tourBookingID;
	}

	public void setTourBookingID(int tourBookingID) {
		this.tourBookingID = tourBookingID;
	}
	
}
