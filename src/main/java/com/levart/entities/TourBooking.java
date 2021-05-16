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
@Table(name = "tourBooking")
public class TourBooking {
	@Id
	@Column(name = "tourBookingID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourBookingID;

	@OneToOne
	@JoinColumn(name = "accountID")
	private String accountID;

	@OneToOne
	@JoinColumn(name = "tourID")
	private String tourID;

	@Column(name = "bookDate")
	private String bookDate;

	@Column(name = "bookStatus")
	private String bookStatus;

	public int getTourBookingID() {
		return tourBookingID;
	}

	public void setTourBookingID(int tourBookingID) {
		this.tourBookingID = tourBookingID;
	}

	public String getAccountID() {
		return accountID;
	}

	public void setAccountID(String accountID) {
		this.accountID = accountID;
	}

	public String getTourID() {
		return tourID;
	}

	public void setTourID(String tourID) {
		this.tourID = tourID;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}

	public TourBooking() {
		super();
		// TODO Auto-generated constructor stub
	}

}
