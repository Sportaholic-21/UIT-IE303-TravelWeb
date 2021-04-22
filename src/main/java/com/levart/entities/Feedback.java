package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "feedbackTable")
public class Feedback {
	
	@EmbeddedId FeedbackId feedbackID;
	@Column
	private String feedback;
	
	@Column
	private int starNumber;
}
