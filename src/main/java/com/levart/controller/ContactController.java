package com.levart.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.levart.entities.Account;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
public class ContactController {

	/*@Autowired
	JavaMailSender mailSender;*/
	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}

	@ModelAttribute("messageContact")
	public FormMessage setContact() {
		return new FormMessage();
	}
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}

	@GetMapping("/contact")
	public String showPage(@ModelAttribute("account") Account account, Model model) {
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAccount();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1) return "contact";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		return "contact";
	}


//	@PostMapping("/sendContact")
//	@ResponseBody
//	public String sendContact(@ModelAttribute("messageContact") FormMessage messageContact, Model model)
//			throws MessagingException {
//		// Tao email
//		MimeMessage message = mailSender.createMimeMessage();
//		Boolean multipart = true;
//		MimeMessageHelper helper = new MimeMessageHelper(message, multipart);
////		SimpleMailMessage message=new SimpleMailMessage();
//		String name = messageContact.getName();
//		String phone =messageContact.getPhone();
//		String email = messageContact.getEmail();
//		String message1 = messageContact.getMessage();
//		String htmlMessage = "<h1 style=\"color: red\">Hello</h1>"
//				+ "<p>Thank you for contacting to us. Please, re-check the details.</p>  \r\n" + "Name: " + name
//				+ " <br>  \r\n" + "Phone: " + phone + "</br>" + "Email: " + email + "<br> " + "Message: " + message1;
//		message.setContent(htmlMessage, "text/html");
//		helper.setFrom("thomnd131200@gmail.com");
//		helper.setTo(messageContact.getEmail());
//		helper.setSubject("Test Test");
////		message.setText("Hello cac ban, ahii!!");
//
//		// gui email thong qua gmail
//		this.mailSender.send(message);
//		return "Sent";
//	}
}
