package com.levart.controller.admin;

import com.levart.entities.Account;
import com.levart.hibernate.dao.AccountDAO;

import org.passay.CharacterData;
import org.passay.CharacterRule;
import org.passay.EnglishCharacterData;
import org.passay.PasswordGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

    @ModelAttribute("account")
    public Account setAccount(){
        return new Account();
    }
    
    @RequestMapping("/add")
    public String showPageAddUser() {
        return "/admin/user/addForm";
    }

    @PostMapping("/api/add")
    public String addUser(@ModelAttribute("account") Account userForm){
        AccountDAO userDAO = new AccountDAO();
		Account account = new Account();
		account.setUsername(userForm.getUsername());
		account.setEmail(userForm.getEmail());
		account.setPass(userForm.getPass());
		account.setAccountRole((int) userForm.getAccountRole());
        account.setAccountAddress("Sai Gon");
        account.setSocialMediaLink("socialMediaLink");
        try{
			userDAO.addAccount(account);
            System.out.println("Success");
		} catch(Exception e){
			return "redirect: admin/user/add";
		}
        return "redirect: /UIT-IE303-TravelWeb/admin";
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
