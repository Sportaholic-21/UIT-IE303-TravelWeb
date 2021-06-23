package com.levart.form_entities;

public class FormSearchPackage {
	private String destination;
	private float maxPrice;
	private String continent;
	private String nation;
	private String typology;
	
	
	public String getTypology() {
		return typology;
	}
	public void setTypology(String typology) {
		this.typology = typology;
	}
	public FormSearchPackage() {
		super();
	}
	@Override
	public String toString() {
		return "FormSearchPackage [destination=" + destination + ", maxPrice=" + maxPrice + ", continent=" + continent
				+ ", nation=" + nation + ", typology=" + typology + "]";
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public float getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(float maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getContinent() {
		return continent;
	}
	public void setContinent(String continent) {
		this.continent = continent;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}

	

}
