package com.levart.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@SessionAttributes("account")
@RequestMapping("/admin")
public class DashboardController {
	
	@ModelAttribute("account")
	public Account setAccount() {
		return new Account();
	}
	@RequestMapping(value={"/dashboard", "/", ""})
	public String showPage(@ModelAttribute("account") Account account,  Model model) {
		// check valid user
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		// get data
		TourDAO tourDAO = new TourDAO();
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		
		// calc sum of tourBooking price
		List<TourBooking> tourBookings = tourBookingDAO.getAllTourBooking();
		double sales = tourBookings.stream().filter(i -> i.getBookStatus() == 3).mapToDouble(i -> Float.parseFloat(i.getTour().getPrice())).sum();
		
		// count Booked Tours by Month
		List<Integer> bookedTourByMonth = new ArrayList<Integer>();
		for (int i = 0; i < 12; i++) {
			int month = i;
			bookedTourByMonth.add((int) tourBookings.stream().filter(bTour -> bTour.getBookDate().getMonthValue() == month).count());
		}
		
		// add data to model
		model.addAttribute("account", account);
		model.addAttribute("totalTour", tourDAO.getAllTours().size());
		model.addAttribute("totalUser", accountDAO.getAllAccounts().size());
		model.addAttribute("totalBookedTour", tourBookings.size());
		model.addAttribute("sales", sales);
		model.addAttribute("bookedTourByMonth", bookedTourByMonth);
		
		return "/admin/dashboard";
	}
}
