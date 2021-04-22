package com.levart.entities;

import javax.persistence.*;

@Entity
@Table(name = "typologyTable")
public class Typology {
	@Id
	@Column(name = "typologyID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int typologyID;

	@Column(name = "typologyName")
	private String typologyName;
	
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
