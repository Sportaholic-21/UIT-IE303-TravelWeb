package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "packageTable")
public class TourPackage  {
	@Id
	@Column(name = "packageID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int packageID;

	@Column(name = "nation", length = 20)
	private String nation;

	@Column(name = "continent", length = 20)
	private String continent;

	public int getPackageID() {
		return packageID;
	}

	public void setPackageID(int packageID) {
		this.packageID = packageID;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	
	public TourPackage() {
		super();
	}

	public TourPackage(int packageID, String nation, String continent) {
		super();
		this.packageID = packageID;
		this.nation = nation;
		this.continent = continent;
	}
	
}
