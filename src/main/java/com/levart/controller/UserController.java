package com.levart.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.levart.entities.Account;
import com.levart.entities.Nation;
import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.dao.TourDAO;
import com.levart.hibernate.utils.CRUDBookedTourOperation;

@Controller
@SessionAttributes("account")
@RequestMapping(value="/user")
public class UserController extends CRUDBookedTourOperation {
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
	
	@RequestMapping(value={"/", ""})
	public String showPage(@ModelAttribute("account") Account account,@RequestParam("tab") String tab,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		if (tab.equals("profile")) {
			model.addAttribute("account", account);
			
			model.addAttribute("active", "profile");
			
			return "/user/profile";	
		}
		
		if (tab.equals("booked-tours")) {
			account = accountDAO.getAccountWithTourBooking(account.getUsername());
			
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
		
		if (tab.equals("wishlist")) {
			model.addAttribute("account", account);
			
			model.addAttribute("active", "wishlist");
			
			return "/user/wishlist";	
		}
		
		return "redirect: no-permission";
	}
	
	@RequestMapping(value={"/booked-tour/api/cancel"})
	public String cancelBooking(@ModelAttribute("account") Account account, @RequestParam("id") int id, Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		super.updateStatus(id, 4);	
		
		model.addAttribute("account", account);
		
		return "redirect:/user/?tab=booked-tours";
	}
	
	@RequestMapping(value={"/booked-tour/api/recover"})
	public String recoverBooking(@ModelAttribute("account") Account account, @RequestParam("id") int id, Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		super.updateStatus(id, 1);	
		
		model.addAttribute("account", account);
		
		return "redirect:/user/?tab=booked-tours";
	}
	
}
