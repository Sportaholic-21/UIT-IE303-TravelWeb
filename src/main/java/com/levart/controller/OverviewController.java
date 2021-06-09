package com.levart.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Nation;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.utils.CRUDBookedTourOperation;

@Controller
public class OverviewController extends CRUDBookedTourOperation {
	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}
	
	@RequestMapping(value={"/{username}"})
	public String showPage(@PathVariable String username, Model model) {
		AccountDAO accountDAO = new AccountDAO();
		NationDAO nationDAO = new NationDAO();
		
		Account account = accountDAO.getAccountWithTourBooking(username);
		
			int totalFeedbacks = 0;
			int count = 0;
			
			List<TourBooking> endedTours = new ArrayList<TourBooking>();
			
			List<TourBooking> tourBookings = account.getTourBookings();
			List<String> coordinates = new ArrayList<String>();
			List<String> tourNames = new ArrayList<String>();
			List<Integer> isFeedbacks = new ArrayList<Integer>();
			List<Float> stars = new ArrayList<Float>();
			List<Date> dates = new ArrayList<Date>();

			List<Nation> nations = nationDAO.getListNationByEndedTour();
			
			Iterator<TourBooking> tourBookingItem = tourBookings
					.iterator();
			while (tourBookingItem.hasNext()) {
				TourBooking tourBKItem = tourBookingItem.next();
				if (tourBKItem.getBookStatus() == 3) {
					endedTours.add(tourBKItem);
					
					String coordinate = tourBKItem.getTour().getCoordinate();
					coordinates.add(coordinate);
					
					tourNames.add(tourBKItem.getTour().getTourName());
					dates.add(tourBKItem.getScheduleDate());
					
					if(tourBKItem.getFeedback() != null) {
						totalFeedbacks++;
						
						stars.add(count, tourBKItem.getFeedback().getStart());
					} else {
						isFeedbacks.add(0);
					}
					
					count++;
				}
			}
			
			model.addAttribute("account", account);
			model.addAttribute("totalFeedbacks", totalFeedbacks);
			model.addAttribute("coordinates", coordinates);
			model.addAttribute("tourNames", tourNames);
			model.addAttribute("totalNations", nations.size());
			model.addAttribute("dates", dates);
			model.addAttribute("stars", stars);
			model.addAttribute("endedTours", endedTours);
			
			return "overview";
	}
}
