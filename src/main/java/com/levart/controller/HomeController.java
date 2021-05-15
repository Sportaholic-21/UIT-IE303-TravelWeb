package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

import com.levart.entities.User;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.UserDAO;

@Controller
@SessionAttributes("user")
public class HomeController {
	
	@ModelAttribute("user")
	public User newUser() {
		return new User();
	}

	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
    @RequestMapping("/home")
	public String showPage(@ModelAttribute(name="user") User user, Model model){
		if (user.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			UserDAO userDAO = new UserDAO();
			List<User> users = userDAO.getUser();
			int i = userDAO.findUserIndex(user.getEmail(), user.getPass());
			user = users.get(i);
			model.addAttribute("username", user.getUsername());
		}
		return "home";
	}

	@PostMapping("/signOut")
	public String handleSignOut(@ModelAttribute(name="user") User user)
	{
		user.setPass(null);
		user.setEmail(null);
		return "home"; //Cái này chắc sau này đổi
	}
}
