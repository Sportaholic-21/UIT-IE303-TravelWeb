package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import com.levart.entities.Account;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
public class TourDetailController {

	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}
	
	@ModelAttribute("messageContact")
	public FormMessage setSendNow() {
		return new FormMessage();
	}
	
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
	@RequestMapping("/tour-detail")
	public String showPage(@ModelAttribute("account") Account account, Model model) {
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1) return "tour-detail";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		return "tour-detail";
	}
	
//	@PostMapping("/search")
//	public ....
	///Theem search cho trang nafy sau khi DUng lam search xong
}
