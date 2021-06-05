package com.levart.hibernate.utils;

import java.util.Date;

import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

public class CRUDBookedTourOperation {
	public void updateStatus(int id, int status) {
				TourBookingDAO tourBookingDAO = new TourBookingDAO();
				TourBooking updatedTour = tourBookingDAO.getTourBooking(id);
				
				updatedTour.setBookStatus(status);	

				tourBookingDAO.updateTourBooking(updatedTour);
	}
}
