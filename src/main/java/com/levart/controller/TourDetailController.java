package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import com.levart.entities.User;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.UserDAO;

@Controller
@SessionAttributes("user")
public class TourDetailController {

	@ModelAttribute("user")
	public User newUser() {
		return new User();
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
	public String showPage(@ModelAttribute("user") User user, Model model) {
		if (user.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			UserDAO userDAO = new UserDAO();
			List<User> users = userDAO.getUser();
			int i = userDAO.findUserIndex(user.getEmail(), user.getPass());
			if (i == -1) return "tour-detail";
			user = users.get(i);
			model.addAttribute("username", user.getUsername());
		}
		return "tour-detail";
	}
	
//	@PostMapping("/search")
//	public ....
	///Theem search cho trang nafy sau khi DUng lam search xong
}
