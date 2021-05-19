package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import com.levart.entities.Account;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
public class HomeController {
	
	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}

	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
    @RequestMapping("/home")
	public String showPage(@ModelAttribute(name="account") Account account, Model model){
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		return "home";
	}

	@PostMapping("/signOut")
	public String handleSignOut(@ModelAttribute(name="account") Account account)
	{
		account.setPass(null);
		account.setEmail(null);
		return "home"; //Cái này chắc sau này đổi
	}
}
