package com.levart.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "account")
public class Account {
	@Id
	@Column(name = "accountID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountID;
	
	@Column(name = "username", length = 20)
	private String username;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "fullName")
	private String fullName;
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "pass")
	private String password;
	
	@Column(name = "accountRole")
	private int accountRole;

	@Column(name = "accountAddress")
	private String accountAddress;
	
	@Column(name = "socialMediaLink")
	private String socialMediaLink;
	
	@Column(name = "point")
	private int point;
	
	@OneToMany(mappedBy = "account", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<TourBooking> tourBookings;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccountAddress() {
		return accountAddress;
	}

	public void setAccountAddress(String accountAddress) {
		this.accountAddress = accountAddress;
	}

	public String getSocialMediaLink() {
		return socialMediaLink;
	}

	public void setSocialMediaLink(String socialMediaLink) {
		this.socialMediaLink = socialMediaLink;
	}

	public Account() {
		super();
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return password;
	}

	public void setPass(String password) {
		this.password = password;
	}

	public int getAccountRole() {
		return accountRole;
	}

	public void setAccountRole(int accountRole) {
		this.accountRole = accountRole;
	}

	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public List<TourBooking> getTourBookings() {
		return tourBookings;
	}

	public void setTourBookings(List<TourBooking> tourBookings) {
		this.tourBookings = tourBookings;
	}
	
	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

		// add convenience methods for bi-directional relationship
		public void add(TourBooking tourBooking) {
			if (this.tourBookings == null) {
				this.tourBookings = new ArrayList<TourBooking>();
			}
			
			this.tourBookings.add(tourBooking);
			
			tourBooking.setAccount(this);
		}

		@Override
		public String toString() {
			return "Account [accountID=" + accountID + ", username="
					+ username + ", email=" + email + ", fullName="
					+ fullName + ", avatar=" + avatar + ", password="
					+ password + ", accountRole=" + accountRole
					+ ", accountAddress=" + accountAddress
					+ ", socialMediaLink=" + socialMediaLink
					+ ", tourBookings=" + tourBookings + "]";
		}
}
