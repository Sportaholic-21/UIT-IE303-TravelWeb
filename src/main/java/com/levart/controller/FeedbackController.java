package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import com.levart.entities.Account;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
public class FeedbackController {

	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}

	@RequestMapping("/feedback")
	public String showPage() {
		return "feedback";
	}
	
	@ModelAttribute("messageFeedback")
	public FormMessage sendFeebback() {
		return new FormMessage();
	}
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
	@RequestMapping("/sendFeedback")
	public String sendFeedback(@ModelAttribute("messageFeedback") FormMessage messageFeedback,
							   @ModelAttribute("account") Account account, 
							   Model model) {
		//kiểm tra account
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		//end Ktra
		String name=messageFeedback.getName();
		String email=messageFeedback.getEmail();
		String message=messageFeedback.getMessage();
		//dùng để chuyển cái biến name vào name1 trên trang jsp, trên trang feedback.jsp chỗ nào có ${name1} sẽ nhận đc giá trị của name
		model.addAttribute("name1", name);
		model.addAttribute("email1", email);
		model.addAttribute("message1", message);	
		return "feedback";
	}
}
