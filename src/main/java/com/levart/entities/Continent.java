package com.levart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "continent")
public class Continent {
	@Id
	@Column(name = "continentID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int continentID;

	@Column(name = "continentName", length = 20)
	private String continentName;

	public int getContinentID() {
		return continentID;
	}

	public void setContinentID(int continentID) {
		this.continentID = continentID;
	}

	public String getContinentName() {
		return continentName;
	}

	public void setContinentName(String continentName) {
		this.continentName = continentName;
	}

	public Continent() {
		super();
	}
	
	
}
