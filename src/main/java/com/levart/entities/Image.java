package com.levart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tourImage")
public class Image {
	@Id
	@Column(name = "tourImageID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tourImageID;
	
	@OneToOne
	@JoinColumn(name = "tourID")
	private Tour tourID; 
	
	@Column(name = "imageURL")
	private String imageURL;

	@Column(name = "tourImageName")
	private String tourImageName;
	
	@Column(name = "imageRole")
	private String imageRole;

	public Image() {
		super();
	}
	public int getTourImageID() {
		return tourImageID;
	}
	public void setTourImageID(int tourImageID) {
		this.tourImageID = tourImageID;
	}
	public Tour getTourID() {
		return tourID;
	}
	public void setTourID(Tour tourID) {
		this.tourID = tourID;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getTourImageName() {
		return tourImageName;
	}
	public void setTourImageName(String tourImageName) {
		this.tourImageName = tourImageName;
	}
	public String getImageRole() {
		return imageRole;
	}
	public void setImageRole(String imageRole) {
		this.imageRole = imageRole;
	}
	@Override
	public String toString() {
		return "Image [tourImageID=" + tourImageID + ", tourID=" + tourID + ", imageURL=" + imageURL
				+ ", tourImageName=" + tourImageName + ", imageRole=" + imageRole + "]";
	}
	
}
