package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import com.levart.entities.Account;
import com.levart.entities.Image;
import com.levart.entities.Tour;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSearchPackage;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.ImageDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@SessionAttributes("account")
public class TourListController {

	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}
	
	@ModelAttribute("contentSearchPackage")
	public FormSearchPackage setSearchPackage() {
		return new FormSearchPackage();
	}
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
    @RequestMapping("/tour-list")
	public String showPage(@ModelAttribute("account") Account account, Model model, @Valid @ModelAttribute("contentSearchPackage") FormSearchPackage formsearchpackage, @RequestParam(value = "typologyID", required = false, defaultValue = "0") int typologyID) {
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1) return "tour-list";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		if(typologyID == 0) {
			TourDAO tourdao = new TourDAO();
			List<Tour> list = tourdao.findTour(formsearchpackage.getDestination());
			if(list.isEmpty()) {
				list = tourdao.getAllTours();
			}
	    	model.addAttribute("searchResult", list);
	    	ImageDAO imgdao = new ImageDAO();
	    	List<Image> imgList = new ArrayList<Image>();
			for (Tour tour : list) {
				imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
			}
			
			model.addAttribute("imgList", imgList);
		}
		else {
			TourDAO tourdao = new TourDAO();
			List<Tour> list = tourdao.getTourByTypologyID(typologyID);
	    	model.addAttribute("searchResult", list);
	    	ImageDAO imgdao = new ImageDAO();
	    	List<Image> imgList = new ArrayList<Image>();
			for (Tour tour : list) {
				imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
			}
			
			model.addAttribute("imgList", imgList);
		}
		return "tour-list";
	}
    
    
}
