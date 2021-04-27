package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "feedbackTable")
public class Feedback {
	
	@EmbeddedId FeedbackId feedbackID;
	@Column(name = "feedback")
	private String feedback;
	
	@Column(name = "starNumber")
	private int starNumber;

	public FeedbackId getFeedbackID() {
		return feedbackID;
	}

	public void setFeedbackID(FeedbackId feedbackID) {
		this.feedbackID = feedbackID;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public int getStarNumber() {
		return starNumber;
	}

	public void setStarNumber(int starNumber) {
		this.starNumber = starNumber;
	}

	public Feedback(FeedbackId feedbackID, String feedback, int starNumber) {
		super();
		this.feedbackID = feedbackID;
		this.feedback = feedback;
		this.starNumber = starNumber;
	}

	public Feedback() {
		super();
	}
	
}
