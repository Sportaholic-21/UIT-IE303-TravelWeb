package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "feedback")
public class Feedback {
	@Id
	@Column(name = "feedbackID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String feedbackID;
	
	// @OneToOne
	// @JoinColumn(name = "tourBookingID")
	@Column(name = "tourBookingID")
	private int tourBookingID;

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

	public int getTourBookingID() {
		return tourBookingID;
	}

	public void setTourBookingID(int tourBookingID) {
		this.tourBookingID = tourBookingID;
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
