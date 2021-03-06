package com.levart.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Feedback;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.FeedbackDAO;

@Controller
@SessionAttributes("account")
@RequestMapping("/admin")
public class FeedbackMNController {
	
	@ModelAttribute("account")
	public Account setAccount() {
		return new Account();
	}
	@RequestMapping(value={"/feedbacks"})
	public String showPage(@ModelAttribute("account") Account account,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		FeedbackDAO feedBackDAO=new FeedbackDAO();
		List<Feedback> feedbackList= feedBackDAO.getFeedbackList();
		model.addAttribute("account", account);
		model.addAttribute("feedbackList", feedbackList);
		return "/admin/feedback";
	}
}
