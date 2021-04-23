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
@Table(name = "imageTable")
public class Image {
	@Id
	@Column(name = "imageID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int imageID;
	
	// Biểu diễn quan hệ 1-1 giữa image và package
	
	@Column(name = "packageID")
	@OneToOne
	@JoinColumn(name = "package_id") // Liên kết với nhau qua khóa ngoại package_id
	private Package packageID; 
	
	@Column(name = "imageName")
	private String imageName;

	public Image() {
		super();
	}

	public Image(int imageID, Package packageID, String imageName) {
		super();
		this.imageID = imageID;
		this.packageID = packageID;
		this.imageName = imageName;
	}

	public int getImageID() {
		return imageID;
	}

	public void setImageID(int imageID) {
		this.imageID = imageID;
	}

	public Package getPackageID() {
		return packageID;
	}

	public void setPackageID(Package packageID) {
		this.packageID = packageID;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
}
