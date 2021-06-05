package com.levart.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.levart.entities.Account;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping(value={"/", ""})
	public String showMap() {
		return "/user/guest-profile";
	}
	
	@RequestMapping(value={"/insight"})
	public String showPage(@RequestParam("id") int id, Model model) {
		AccountDAO accountDAO = new AccountDAO();
		Account account = accountDAO.getAccount(id);

		model.addAttribute("account", account);
		
		model.addAttribute("active", "profile");
		
		return "/user/profile";
	}
	
	@RequestMapping(value={"/insight/booked-tours"})
	public String showBookedTours(@RequestParam("id") int id, Model model) {
		AccountDAO accountDAO = new AccountDAO();
		Account account = accountDAO.getAccountWithTourBooking(id);
		
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
		
		model.addAttribute("active", "bookedTours");
		
		return "/user/bookedTours";
	}
}
