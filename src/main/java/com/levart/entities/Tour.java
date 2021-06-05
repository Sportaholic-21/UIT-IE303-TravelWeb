package com.levart.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tour")
public class Tour {
	@Id
	@Column(name = "tourID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourID;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	@JoinColumn(name = "typologyID")
	private Typology typology;

	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	@JoinColumn(name = "nationID")
	private Nation nation;

	@Column(name = "tourName")
	private String tourName;


	@Column(name = "shortDesc")
	private String shortDesc;

	public Nation getNation() {
		return nation;
	}

	public void setNation(Nation nation) {
		this.nation = nation;
	}

	@Column(name = "descr")
	private String desc;

	@Column(name = "schedule")
	private String schedule;

	@Column(name = "price")
	private String price;

	@Column(name = "discount")
	private String discount;

	@Column(name = "duration")
	private int duration;

	@Column(name = "rating")
	private float rating;
	
	@Column(name = "numberFeedback")
	private float numberFeedback;
	
	@Column(name = "numberBooking")
	private float numberBooking;
	
	@Column(name = "priceDiscount")
	private String priceDiscount;
	
	public String getPriceDiscount() {
		return priceDiscount;
	}

	public void setPriceDiscount(String priceDiscount) {
		this.priceDiscount = priceDiscount;
	}

	public float getNumberFeedback() {
		return numberFeedback;
	}

	public void setNumberFeedback(float numberFeedback) {
		this.numberFeedback = numberFeedback;
	}

	public float getNumberBooking() {
		return numberBooking;
	}

	public void setNumberBooking(float numberBooking) {
		this.numberBooking = numberBooking;
	}

	public int getTourID() {
		return tourID;
	}

	public void setTourID(int tourID) {
		this.tourID = tourID;
	}

	public Typology getTypology() {
		return typology;
	}

	public void setTypology(Typology typology) {
		this.typology = typology;
	}


	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	
	public String getShortDesc() {
		return shortDesc;
	}

	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public Tour() {
		super();
	}

	@Override
	public String toString() {
		return "Tour [tourID=" + tourID + ", typology=" + typology
				+ ", continent=" + nation.getContinent().getContinentID() + ", tourName="
				+ tourName + ", nation=" + nation + ", shortDesc="
				+ shortDesc + ", desc=" + desc + ", schedule="
				+ schedule + ", price=" + price + ", discount="
				+ discount + "price after discount= " + priceDiscount + ", duration=" + duration + ", rating="
				+ rating + "]";
	}
	

}
