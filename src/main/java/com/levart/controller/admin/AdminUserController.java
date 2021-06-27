package com.levart.controller.admin;

import java.net.IDN;
import java.net.URI;
import java.net.URL;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.passay.CharacterData;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@SessionAttributes("account")
@RequestMapping("/admin/user")
public class AdminUserController {
	@ModelAttribute("accountModelAttribute")
	public Account setTourModelAttribute() {
		return new Account();
	}
	@ModelAttribute("account")
	public Account setAccount() {
		return new Account();
	}
	
	@Autowired
	JavaMailSender mailSender;

	@RequestMapping(value = { "/", "" })
	public String showPage(@ModelAttribute("account") Account account,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);

		model.addAttribute("accounts", accounts);
		model.addAttribute("account", account);
		
		return "/admin/user/list";
	}
	@RequestMapping(value = { "/add" })
	public String showPageAddAccount(@ModelAttribute("account") Account account,  Model model, @RequestParam(value = "status", required = false, defaultValue = "none") String status) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		model.addAttribute("account", account);
		
		String action = status;
		
		if (action.equals("success")) {
			model.addAttribute("status", "success");
		}
		
		return "/admin/user/addForm";
	}
	@PostMapping("api/add")
	public String addAccount(@ModelAttribute("accountModelAttribute") Account account) throws MessagingException {
		AccountDAO accountDAO = new AccountDAO();
		accountDAO.addAccount(account);
		
		MimeMessage message = mailSender.createMimeMessage();
		Boolean multipart = true;
		MimeMessageHelper helper = new MimeMessageHelper(message, multipart);
		String username = account.getUsername();
		String pass = account.getPassword();
		String url="http://localhost:8080/UIT-IE303-TravelWeb/home";
		String htmlMessage = " <div style=\"width: fit-content; background-color: blueviolet; padding: 20px 50px 50px;\">\r\n"
				+ "        <h1 style=\"color: aliceblue; margin: 10px 100px;\">LEVART</h1>\r\n"
				+ "        <section style=\"background-color: antiquewhite;  border-radius: 15px; margin: 10px 100px; padding: 20px 30px;\">\r\n"
				+ "            <h1>Thank you for booking the tour from us!</h1>\r\n"
				+ "            <p>We hope you will have a great experience.</p>\r\n"
				+ "            <button style=\"background-color: blueviolet; border-radius: 10px; padding: 5px 5px;\">\r\n"
				+ "                <a href=\"" + url
				+ "\" style=\"color: white; text-decoration: none; font-weight: 600;\">Levart website</a>\r\n"
				+ "            </button>\r\n" 
				+ "        </section>\r\n"
				+ "        <section style=\"background-color: antiquewhite;  border-radius: 15px; margin: 10px 100px; padding: 20px 30px;\">\r\n"
				+ "            <h1 style= \"color: red\">This is YOUR ACCOUNT which you can log-in on us website - Levart.</h1>\r\n"
				+ "            <p>Username: " + username + "</p>\r\n" + "            <p>Password: " + pass + "</p>\r\n"
				+ "\r\n" + "            <p>\r\n"
				+ "                ---------------------------------------------- <br> Levart Travel Agency <br> University of Infomation Technology <br> Office : IE303.L21, Tim Tim Team, Han Thuyen Street, Linh Trung Ward, Thu Duc District, Ho Chi Minh City\r\n"
				+ "                <br> Tel : 0123456789 | Email: thomnd131200@gmail.com <br> Website : ..... <br> Hotline: 0900001211| Feedback - Complaints: 0902012345\r\n"
				+ "            </p>\r\n" + "        </section>\r\n" + "    </div>";
		message.setContent(htmlMessage, "text/html");
		helper.setFrom("thomnd131200@gmail.com");
		helper.setTo(account.getEmail());
		helper.setSubject("[Account] Your account on Levart!!!");
		this.mailSender.send(message);	
		return "redirect:/admin/user/add?status=success";
	}
	@PostMapping("/api/generatePassword")
    @ResponseBody
    public String newPassword() {
        return generatePassayPassword();
    }
	
	public String generatePassayPassword() {
        PasswordGenerator gen = new PasswordGenerator();
        CharacterData lowerCaseChars = EnglishCharacterData.LowerCase;
        CharacterRule lowerCaseRule = new CharacterRule(lowerCaseChars);
        lowerCaseRule.setNumberOfCharacters(2);
    
        CharacterData upperCaseChars = EnglishCharacterData.UpperCase;
        CharacterRule upperCaseRule = new CharacterRule(upperCaseChars);
        upperCaseRule.setNumberOfCharacters(2);
    
        CharacterData digitChars = EnglishCharacterData.Digit;
        CharacterRule digitRule = new CharacterRule(digitChars);
        digitRule.setNumberOfCharacters(2);
    
        CharacterData specialChars = new CharacterData() {
            public String getErrorCode() {
                return "ERROR_CODE";
            }
    
            public String getCharacters() {
                return "!@#$%^&*()_+";
            }
        };
        CharacterRule splCharRule = new CharacterRule(specialChars);
        splCharRule.setNumberOfCharacters(2);
    
        String password = gen.generatePassword(10, splCharRule, lowerCaseRule, 
          upperCaseRule, digitRule);
        return password;
    }

}
