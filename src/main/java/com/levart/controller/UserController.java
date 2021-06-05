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
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.utils.CRUDBookedTourOperation;

@Controller
@RequestMapping(value="/user/{username}")
public class UserController extends CRUDBookedTourOperation {
	@RequestMapping(value={"", "/"})
	public String showPage(@PathVariable String username, org.springframework.web.context.request.WebRequest webRequest, Model model) {
		AccountDAO accountDAO = new AccountDAO();
		String tab = webRequest.getParameter("tab");
		
		if (tab == null) {
			Account account = accountDAO.getAccount(username);
			
			model.addAttribute("account", account);
			
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
			System.out.println(tourBookings);
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
