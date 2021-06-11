package com.levart.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;

import com.levart.entities.Account;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSignUp;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
public class SignInController {
	@ModelAttribute("account")
	public Account setAccount() {
		return new Account();
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
							   @ModelAttribute("account") Account account,
							   RedirectAttributes redirectAttributes){
		String email = userForm.getEmail();
		String password = userForm.getPass();
		userForm.setRememberme(1);
		AccountDAO userDAO = new AccountDAO();
		List<Account> users = userDAO.getAllAccounts();
		int i = userDAO.findAccountIndex(email,password);;
		if (i==-1){
			return "redirect: sign-in";
		}
		account = users.get(i);
		account.setUsername("username");
		redirectAttributes.addFlashAttribute("account", account);
		System.out.println(account.getUsername());
		return "redirect: home"; 
	}

	@PostMapping(value ="/api/forgotPassword", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String,String> sendOTP(@RequestBody String req) throws ParseException {
		JSONParser parser = new JSONParser();  
		JSONObject reqJSON = (JSONObject) parser.parse(req);
		HashMap<String,String> res = new HashMap<String,String>();
		String reqEmail = (String) reqJSON.get("email");
		int index = AccountDAO.findEmail(reqEmail);
		if (index == -1) res.put("status", "0");
		else {
			res.put("status", "1");
			res.put("otp", genOTP());
		}
		return res;
	}

	public static String genOTP() {
		String numString="0123456789";
		StringBuilder rndzer = new StringBuilder();
		java.util.Random rnd = new java.util.Random();
		while (rndzer.length() < 6) {
			int i = (int) (rnd.nextFloat() * numString.length());
			rndzer.append(numString.charAt(i));
		}
		String out = rndzer.toString();
		return out;
	}
}
