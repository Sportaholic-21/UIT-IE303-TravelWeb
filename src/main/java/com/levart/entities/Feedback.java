package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "feedback")
public class Feedback {
	@Id
	@Column(name = "feedbackID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int feedbackID;
	
	@OneToOne
	@JoinColumn(name = "tourBookingID")
	private TourBooking tourBooking;

	@Column(name = "feedbackMessage")
	private String feedbackMessage;
	
	@Column(name="star")
	private float start;
	
	@Column(name="sentimentStatus")
	private int sentimentStatus;
	
	public TourBooking getTourBooking() {
		return tourBooking;
	}

	public void setTourBooking(TourBooking tourBooking) {
		this.tourBooking = tourBooking;
	}

	public int getSentimentStatus() {
		return sentimentStatus;
	}

	public void setSentimentStatus(int sentimentStatus) {
		this.sentimentStatus = sentimentStatus;
	}

	public Feedback() {
		super();
	}

	public int getFeedbackID() {
		return feedbackID;
	}

	public void setFeedbackID(int feedbackID) {
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

	@Override
	public String toString() {
		return "Feedback [feedbackID=" + feedbackID + ", tourBooking=" + tourBooking + ", feedbackMessage="
				+ feedbackMessage + ", start=" + start + "]";
	}
	
	
}
