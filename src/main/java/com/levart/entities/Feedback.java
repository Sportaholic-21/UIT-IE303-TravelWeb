package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "feedback")
public class Feedback {
	@Id
	@Column(name = "feedbackID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String feedbackID;
	
	@OneToOne
	@JoinColumn(name = "tourBookingID")
	private TourBooking tourBooking;

	@Column(name = "feedbackMessage")
	private String feedbackMessage;
	
	@Column(name="star")
	private float start;
	
	public Feedback() {
		super();
	}

	public String getFeedbackID() {
		return feedbackID;
	}

	public void setFeedbackID(String feedbackID) {
		this.feedbackID = feedbackID;
	}

	public TourBooking getTourBookingID() {
		return tourBooking;
	}

	public void setTourBookingID(TourBooking tourBooking) {
		this.tourBooking = tourBooking;
	}

	public String getFeedbackMessage() {
		return feedbackMessage;
	}

	public void setFeedbackMessage(String feedbackMessage) {
		this.feedbackMessage = feedbackMessage;
	}

	public float getStart() {
		return start;
	}

	public void setStart(float start) {
		this.start = start;
	}
	
	
}
