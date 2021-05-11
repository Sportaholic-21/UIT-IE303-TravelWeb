package com.levart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "contactTable")
public class Contact {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int contactID;
	

	@OneToOne
	@JoinColumn(name = "user_id") // Liên kết với nhau qua khóa ngoại user_id
    private User userID; 
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "messenger")
	private String messenger;
	
	
	public Contact() {
		super();
	}

	public Contact(int contactID, User userID, String phone, String messenger) {
		super();
		this.contactID = contactID;
		this.userID = userID;
		this.phone = phone;
		this.messenger = messenger;
	}

	public int getContactID() {
		return contactID;
	}

	public void setContactID(int contactID) {
		this.contactID = contactID;
	}

	public User getUserID() {
		return userID;
	}

	public void setUserID(User userID) {
		this.userID = userID;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessenger() {
		return messenger;
	}

	public void setMessenger(String messenger) {
		this.messenger = messenger;
	}
	
}
