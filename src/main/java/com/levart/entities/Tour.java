package com.levart.entities;

import java.util.Currency;

import javax.persistence.*;

@Entity
@Table(name = "tour")
public class Tour {
	@Id
	@Column(name = "tourID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourID;

	@OneToOne
	@JoinColumn(name = "typologyID")
	private Typology typologyID;

	@OneToOne
	@JoinColumn(name = "continentID")
	private Typology continentID;

	@Column(name = "tourName")
	private String tourName;

	@Column(name = "nation")
	private String nation;

	@Column(name = "shortDesc")
	private String shortDesc;

	@Column(name = "desc")
	private String desc;

	@Column(name = "schedule")
	private String schedule;

	@Column(name = "price")
	private Currency price;

	@Column(name = "discount")
	private String discount;

	@Column(name = "cycle")
	private String cycle;

	@Column(name = "duration")
	private int duration;

	@Column(name = "rating")
	private float rating;

	public int getTourID() {
		return tourID;
	}

	public void setTourID(int tourID) {
		this.tourID = tourID;
	}

	public Typology getTypologyID() {
		return typologyID;
	}

	public void setTypologyID(Typology typologyID) {
		this.typologyID = typologyID;
	}

	public Typology getContinentID() {
		return continentID;
	}

	public void setContinentID(Typology continentID) {
		this.continentID = continentID;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
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

	public Currency getPrice() {
		return price;
	}

	public void setPrice(Currency price) {
		this.price = price;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getCycle() {
		return cycle;
	}

	public void setCycle(String cycle) {
		this.cycle = cycle;
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

}
