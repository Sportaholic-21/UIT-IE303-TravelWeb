package com.levart.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
@RequestMapping("/admin")
public class DashboardController {
	@RequestMapping(value={"/dashboard", "/", ""})
	public String showPage(@ModelAttribute("account") Account account,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		model.addAttribute("account", account);
		
		return "/admin/dashboard";
	}
}
