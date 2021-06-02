package com.levart.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.levart.entities.Account;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;

@Controller
@SessionAttributes("account")
public class ContactController {

	@Autowired
	JavaMailSender mailSender;
	
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
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1) return "contact";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		return "contact";
	}

	@RequestMapping(value = "sendContact", method = RequestMethod.POST)//
//	@ResponseStatus
	public String sendContact(@ModelAttribute("messageContact") FormMessage messageContact, Model model)
			throws MessagingException {
		// Tao email
		MimeMessage message = mailSender.createMimeMessage();
		Boolean multipart = true;
		MimeMessageHelper helper = new MimeMessageHelper(message, multipart);
//		SimpleMailMessage message=new SimpleMailMessage();
		String name = messageContact.getName();
		String phone = messageContact.getPhone();
		String email = messageContact.getEmail();
		String message1 = messageContact.getMessage();
		String htmlMessage = " <div style=\"width: fit-content; background-color: blueviolet; padding: 20px 50px 50px;\">\r\n"
				+ "        <h1 style=\"color: aliceblue; margin: 10px 100px;\">LEVART</h1>\r\n"
				+ "        <section style=\"background-color: antiquewhite;  border-radius: 15px; margin: 10px 100px; padding: 20px 30px;\">\r\n"
				+ "            <h1>Thank you for contacting with us!</h1>\r\n"
				+ "            <p>This is the infomation that we received from you: </p>\r\n"
				+ "            <button style=\"background-color: blueviolet; border-radius: 10px; padding: 5px 5px;\">\r\n"
				+ "                <a href=\"http://localhost:8080/UIT-IE303-TravelWeb/contact?name=" + name + "&phone="+ phone + "&email=" + email + "&message=" + message1
				+ "\" style=\"color: white; text-decoration: none; font-weight: 600;\">Modify your answers</a>\r\n"
				+ "            </button>\r\n" 
				+ "        </section>\r\n"
				+ "        <section style=\"background-color: antiquewhite;  border-radius: 15px; margin: 10px 100px; padding: 20px 30px;\">\r\n"
				+ "            <h1 style= \"color: red\">Please, re-check the details.</h1>\r\n"
				+ "            <p>Name: " + name + "</p>\r\n" + "            <p>Phone Number: " + phone + "</p>\r\n"
				+ "            <p>Email: " + email + "</p>\r\n" + "            <p>Message: " + message1 + "</p>\r\n"
				+ "\r\n" + "            <p>\r\n"
				+ "                ---------------------------------------------- <br> Levart Travel Agency <br> University of Infomation Technology <br> Office : IE303.L21, Tim Tim Team, Han Thuyen Street, Linh Trung Ward, Thu Duc District, Ho Chi Minh City\r\n"
				+ "                <br> Tel : 12344321 hinh nhu em noi em yeu anh roi | Email: thomnd131200@gmail.com <br> Website : ..... <br> Hotline: 0900 gan song khong co song | Feedback - Complaints: 0902 ngay mai noi tiep\r\n"
				+ "            </p>\r\n" + "        </section>\r\n" + "    </div>";
		message.setContent(htmlMessage, "text/html");
		helper.setFrom("thomnd131200@gmail.com");
		helper.setTo(messageContact.getEmail());
		helper.setSubject("Test Test nha");
//		message.setText("Hello cac ban, ahii!!");

		// gui email thong qua gmail
		this.mailSender.send(message);
		return "redirect:/contact";
	}
}
