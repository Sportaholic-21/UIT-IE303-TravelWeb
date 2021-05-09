package com.levart.entities;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Embeddable
public class FeedbackId implements Serializable {
		/**
	 * 
	 */
	private static final long serialVersionUID = -5170911781473706540L;

		// Biểu diễn quan hệ 1-1 giữa feedback và user
		@OneToOne
		@JoinColumn(name = "user_id") // Liên kết với nhau qua khóa ngoại user_id
		private User userID; 
				
			//Biểu diễn quan hệ giữa feedback và tour
		@OneToOne
		@JoinColumn(name = "tour_id")
		private Tour tourID;
}
