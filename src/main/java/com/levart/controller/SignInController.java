package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.User;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSignUp;
import com.levart.hibernate.dao.UserDAO;

@Controller
@SessionAttributes("contentSignIn")
public class SignInController {
	@ModelAttribute("contentSignIn")
	public FormSignUp setSignIn() {
		return new FormSignUp();
	}
	@ModelAttribute("contentSignUp")
	public FormSignUp setSignUp() {
		return new FormSignUp();
	}
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	@RequestMapping("/sign-in")
	public String showPage(Model model) {
		FormSignUp userForm = new FormSignUp();
		model.addAttribute("contentSignUp", userForm);
		return "sign-in";
	}
	@PostMapping("/signIn")
	public String handleSignIn(@ModelAttribute("contentSignIn") FormSignUp userForm){
		
		return "redirect: home"; 
	}
	@PostMapping("/signUp")
	public String handleSignUp(@ModelAttribute("contentSignUp") FormSignUp userForm){
		UserDAO userDAO = new UserDAO();
		User user = new User();
		user.setUsername(userForm.getName());
		user.setEmail(userForm.getEmail());
		user.setPass(userForm.getPass());
		user.setPhone(userForm.getPhone());
		user.setUserRole(0);
		try{
			userDAO.addUser(user);
			userDAO.getUser();
			System.out.println(user.getPhone());
		} catch(Exception e){
			return "redirect: sign-in";
		}
		return "redirect: home";
	}
}
