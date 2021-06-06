package com.levart.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.levart.entities.Account;
import com.levart.entities.Nation;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.utils.CRUDBookedTourOperation;

@Controller
@RequestMapping(value="/user/{username}")
public class UserController extends CRUDBookedTourOperation {
	@RequestMapping(value={"", "/"})
	public String showPage(@PathVariable String username, org.springframework.web.context.request.WebRequest webRequest, Model model) {
		AccountDAO accountDAO = new AccountDAO();
		NationDAO nationDAO = new NationDAO();
		
		String tab = webRequest.getParameter("tab");
		
		if (tab == null) {
			Account account = accountDAO.getAccountWithTourBooking(username);
			int totalFeedbacks = 0;
			int count = 0;
			
			List<TourBooking> endedTours = new ArrayList<TourBooking>();
			
			List<TourBooking> tourBookings = account.getTourBookings();
			List<String> coordinates = new ArrayList<String>();
			List<String> tourNames = new ArrayList<String>();
			List<Integer> isFeedbacks = new ArrayList<Integer>();
			List<Float> stars = new ArrayList<Float>();
			List<String> dates = new ArrayList<String>();
			
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
			
			return "/user/guest-profile";
		}
		
		if (tab.equals("profile")) {
			Account account = accountDAO.getAccount(username);
			
			model.addAttribute("account", account);
			
			model.addAttribute("active", "profile");
			
			return "/user/profile";	
		}
		
		if (tab.equals("booked-tours")) {
			Account account = accountDAO.getAccountWithTourBooking(username);
			
			model.addAttribute("account", account);
			model.addAttribute("active", "profile");

			List<TourBooking> tourNotStarts = new ArrayList<TourBooking>();
			List<TourBooking> tourEnds = new ArrayList<TourBooking>();
			List<TourBooking> tourCancels = new ArrayList<TourBooking>();
			
			List<TourBooking> tourBookings = account.getTourBookings();
			Iterator<TourBooking> tourBookingItem = tourBookings
					.iterator();
			while (tourBookingItem.hasNext()) {
				TourBooking tourBKItem = tourBookingItem.next();
				
				if (tourBKItem.getBookStatus() == 1) {
					tourNotStarts.add(tourBKItem);
				}
				
				if (tourBKItem.getBookStatus() == 3) {
					tourEnds.add(tourBKItem);
				}
				
				if (tourBKItem.getBookStatus() == 4) {
					tourCancels.add(tourBKItem);
				}
			}
			
			model.addAttribute("tourNotStarts", tourNotStarts);
			model.addAttribute("tourEnds", tourEnds);
			model.addAttribute("tourCancels", tourCancels);
			
			model.addAttribute("account", account);
			
			model.addAttribute("active", "bookedTours");
			
			return "/user/bookedTours";
		}
		
		return null;
	}
	
	@RequestMapping(value={"/booked-tour/api/cancel"})
	public String cancelBooking(@PathVariable String username, @RequestParam("id") int id) {
		super.updateStatus(id, 4);	
		
		return "redirect:/user/" + username + "?tab=booked-tours";
	}
	
	@RequestMapping(value={"/booked-tour/api/recover"})
	public String recoverBooking(@PathVariable String username, @RequestParam("id") int id) {
		super.updateStatus(id, 1);	
		
		return "redirect:/user/" + username + "?tab=booked-tours";
	}
}
