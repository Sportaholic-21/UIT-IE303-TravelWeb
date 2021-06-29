package com.levart.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.utils.CRUDBookedTourOperation;

@Controller
@SessionAttributes("account")
@RequestMapping(value="/user")
public class UserController extends CRUDBookedTourOperation {
	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
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

		
		if (tab.equals("security")) {
			model.addAttribute("account", account);
			model.addAttribute("active", "security");
			return "/user/security";
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
