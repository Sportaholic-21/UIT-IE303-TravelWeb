package com.levart.entities;

import java.time.LocalDateTime;
import java.util.Currency;

import javax.persistence.*;

@Entity
@Table(name = "tourTable")
public class Tour {
	@Id
	@Column(name = "tourID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourID;
		
	// Biểu diễn quan hệ 1-1 giữa tour và package
	// 1 tour có 1 và chỉ 1 package
//	@Column
	@OneToOne
	@JoinColumn(name = "package_id") // Liên kết với nhau qua khóa ngoại package_id
    private TourPackage packageID; 
	
	//Biểu diễn quan hệ giữa tour và typology
//	@Column
	@OneToOne
	@JoinColumn(name = "typology_id")
	private Typology typologyID;
	
	@Column(name = "descriptions")
	private String descriptions;
	
	@Column(name = "detail")
	private String detail;
	
	@Column(name = "price")
	private Currency price;
	
	@Column(name = "startDate")
	private LocalDateTime startDate;
	
	@Column(name = "duration")
	private int duration;
	
	@Column(name = "rating")
	private int rating;

	public int getTourID() {
		return tourID;
	}

	public void setTourID(int tourID) {
		this.tourID = tourID;
	}

	public TourPackage getPackageID() {
		return packageID;
	}

	public void setPackageID(TourPackage packageID) {
		this.packageID = packageID;
	}

	public Typology getTypologyID() {
		return typologyID;
	}

	public void setTypologyID(Typology typologyID) {
		this.typologyID = typologyID;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Currency getPrice() {
		return price;
	}

	public void setPrice(Currency price) {
		this.price = price;
	}

	public LocalDateTime getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Tour(int tourID, TourPackage packageID, Typology typologyID, String descriptions, String detail, Currency price,
			LocalDateTime startDate, int duration, int rating) {
		super();
		this.tourID = tourID;
		this.packageID = packageID;
		this.typologyID = typologyID;
		this.descriptions = descriptions;
		this.detail = detail;
		this.price = price;
		this.startDate = startDate;
		this.duration = duration;
		this.rating = rating;
	}

	public Tour() {
		super();
	}
	
	
}
