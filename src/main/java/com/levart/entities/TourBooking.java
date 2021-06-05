package com.levart.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tourBooking")
public class TourBooking {
	@Id
	@Column(name = "tourBookingID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourBookingID;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH,
			CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "accountID")
	private Account account;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH,
	CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "tourID")
	private Tour tour;
	
	@OneToOne(mappedBy = "tourBooking", cascade = CascadeType.ALL)
	private Feedback Feedback;

	@Column(name = "bookDate")
	private String bookDate;
	
	@Column(name = "scheduleDate")
	private String scheduleDate;

	@Column(name = "bookStatus")
	private int bookStatus;
	
	public String getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public int getTourBookingID() {
		return tourBookingID;
	}

	public void setTourBookingID(int tourBookingID) {
		this.tourBookingID = tourBookingID;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

		public Tour getTour() {
			return tour;
		}
	
		public void setTour(Tour tour) {
			this.tour = tour;
		}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public int getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(int bookStatus) {
		this.bookStatus = bookStatus;
	}

	public TourBooking() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback getFeedback() {
		return Feedback;
	}

	public void setFeedback(Feedback feedback) {
		Feedback = feedback;
	}

	@Override
	public String toString() {
		return "TourBooking [tourBookingID=" + tourBookingID
				 + ", tour=" + tour
				+ ", bookDate=" + bookDate + ", bookStatus="
				+ bookStatus + "]";
	}
}
