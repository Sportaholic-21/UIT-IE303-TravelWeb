package com.levart.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Image;
import com.levart.entities.Nation;
import com.levart.entities.Tour;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSearchPackage;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.ImageDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@SessionAttributes("account")
public class HomeController {
	
	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}

	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	@ModelAttribute("contentSearchPackage")
	public FormSearchPackage setSearchPackage() {
		return new FormSearchPackage();
	}
	
    @RequestMapping("/home")
	public String showPage(@ModelAttribute(name="account") Account account, Model model){
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if(i==-1) return "home";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		TourDAO tourdao = new TourDAO();
		ImageDAO imgdao = new ImageDAO();
		
		NationDAO nationdao = new NationDAO();
		List<Nation> popularNations = nationdao.getPopularDestinations();
		model.addAttribute("popularList", popularNations);
		
		List<Tour> list = tourdao.getTop3Tours();
		model.addAttribute("tourList", list);
		List<Image> imgList = new ArrayList<Image>();
		for (Tour tour : list) {
			imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
		}
		model.addAttribute("imgList", imgList);
		
		List<Tour> listAll = tourdao.getAllTours();
		NationDAO nationDAO= new NationDAO();
		List<Nation> nationList=nationDAO.getAllNation();
		AccountDAO userDAO = new AccountDAO();
		List<Account> users = userDAO.getAllAccounts();
		model.addAttribute("totalDestination",listAll.size());
		model.addAttribute("totalNation", nationList.size());
		model.addAttribute("totalAccount", users.size());
		return "home";
	}
    
    @PostMapping("/tour-list")
	public String showResult(@ModelAttribute("account") Account account, Model model, @ModelAttribute("contentSearchPackage") FormSearchPackage formsearchpackage) {
    	 
    	if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		TourDAO tourdao = new TourDAO();
		List<Tour> list = tourdao.findTourWithCriteria(formsearchpackage.getDestination(), 0, "", "", "");
    	model.addAttribute("searchResult", list);
    	ImageDAO imgdao = new ImageDAO();
    	List<Image> imgList = new ArrayList<Image>();
		for (Tour tour : list) {
			imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
		}
		
		model.addAttribute("imgList", imgList);

		
		return "tour-list";
	}
    
    
	@PostMapping("/signOut")
	public String handleSignOut(@ModelAttribute(name="account") Account account)
	{
		account.setPass(null);
		account.setEmail(null);
		return "home"; //Cái này chắc sau này đổi
	}
}
