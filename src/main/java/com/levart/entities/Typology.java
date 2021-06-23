package com.levart.entities;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "typology")
public class Typology {
	@Override
	public String toString() {
		return "Typology [typologyID=" + typologyID + ", typologyName=" + typologyName + "]";
	}

	@Id
	@Column(name = "typologyID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int typologyID;

	@Column(name = "typologyName", length = 20)
	private String typologyName;
	
	@OneToMany(mappedBy = "typology", cascade = {
			CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	private List<Tour> tours;
	
	public List<Tour> getTours() {
		return tours;
	}

	public void setTours(List<Tour> tours) {
		this.tours = tours;
	}

	public int getTypologyID() {
		return typologyID;
	}

	public void setTypologyID(int typologyID) {
		this.typologyID = typologyID;
	}

	public String getTypologyName() {
		return typologyName;
	}

	public void setTypologyName(String typologyName) {
		this.typologyName = typologyName;
	}

	public Typology() {
		super();
	}

	public Typology(int typologyID, String typologyName) {
		super();
		this.typologyID = typologyID;
		this.typologyName = typologyName;
	}
	
}
