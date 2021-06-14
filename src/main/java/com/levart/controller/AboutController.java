package com.levart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Nation;
import com.levart.entities.TourBooking;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.dao.TourBookingDAO;

@Controller
@SessionAttributes("account")
public class AboutController {
	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	@GetMapping("/about")
	public String showPage(@ModelAttribute("account") Account account, Model model) {
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1) return "about";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
			model.addAttribute("account", account);
		}
		TourBookingDAO tourBookingDAO=new TourBookingDAO();
		List<TourBooking> tourBookingList=tourBookingDAO.getAllTourBooking();
		NationDAO nationDAO=new NationDAO();
		List<Nation> nationList=nationDAO.getAllNation();
		List<Float> totalPriceList=new ArrayList<Float>();
		float totalPrice=0;
		for (Nation nation : nationList) {
			for (TourBooking tourBooking : tourBookingList) {
				if (tourBooking.getTour().getNation().getNationID()==nation.getNationID()) {
					totalPrice=totalPrice+Float.valueOf(tourBooking.getTour().getPriceDiscount());
				}
				
			}
			totalPriceList.add(totalPrice);
		}
		model.addAttribute("nationList", nationList);
		model.addAttribute("totalPriceList", totalPriceList);
		return "about";
	}
}
