package com.levart.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "nation")
public class Nation {
	@Id
	@Column(name = "nationID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int nationID;

	@Column(name = "nationName", length = 20)
	private String nationName;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	@JoinColumn(name = "continentID")
	private Continent continent;
	
	
	@OneToMany(mappedBy = "nation", fetch = FetchType.LAZY, cascade = {
			CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH, CascadeType.REFRESH })
	private List<Tour> tours;

	public int getNationID() {
		return nationID;
	}

	public void setNationID(int nationID) {
		this.nationID = nationID;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public Continent getContinent() {
		return continent;
	}

	public void setContinent(Continent continent) {
		this.continent = continent;
	}

	public List<Tour> getTours() {
		return tours;
	}

	public void setTours(List<Tour> tours) {
		this.tours = tours;
	}
	
	
}
