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
@Table(name = "image")
public class Image {
	@Id
	@Column(name = "imageID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int imageID;
	
	@OneToOne
	@JoinColumn(name = "tourID")
	private int tourID; 
	
	@Column(name = "url")
	private String url;

	@Column(name = "imageName")
	private String imageName;
	
	@Column(name = "imageRole")
	private String imageRole;
	public Image() {
		super();
	}
	public int getImageID() {
		return imageID;
	}
	public void setImageID(int imageID) {
		this.imageID = imageID;
	}
	
	public int getTourID() {
		return tourID;
	}
	public void setTourID(int tourID) {
		this.tourID = tourID;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageRole() {
		return imageRole;
	}
	public void setImageRole(String imageRole) {
		this.imageRole = imageRole;
	}

	
}
