package com.levart.form_entities;

import java.util.Calendar;

public class FormSearchPackage {
	private String destination;
	private Calendar day;
	private float maxPrice;

	public FormSearchPackage() {

	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public float getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(float maxPrice) {
		this.maxPrice = maxPrice;
	}

	public Calendar getDay() {
		return day;
	}

	public void setDay(Calendar day) {
		this.day = day;
	}
}
