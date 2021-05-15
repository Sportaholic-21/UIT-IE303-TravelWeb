package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import com.levart.entities.User;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSignUp;
import com.levart.hibernate.dao.UserDAO;

@Controller
@SessionAttributes("user")
public class SignInController {
	@ModelAttribute("user")
	public User setUser() {
		return new User();
	}
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
	public String handleSignIn(@ModelAttribute("contentSignIn") FormSignUp userForm, 
							   @ModelAttribute("user") User user,
							   RedirectAttributes redirectAttributes){
		String email = userForm.getEmail();
		String password = userForm.getPass();
		userForm.setRememberme(1);
		UserDAO userDAO = new UserDAO();
		List<User> users = userDAO.getUser();
		int i = userDAO.findUserIndex(email,password);
		System.out.println(i);
		if (i==-1){
			return "redirect: sign-in";
		}
		user = users.get(i);
		user.setUsername("username");
		redirectAttributes.addFlashAttribute("user", user);
		System.out.println(user.getUsername());
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
