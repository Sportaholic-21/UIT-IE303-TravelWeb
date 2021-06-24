package com.levart.controller;

import java.util.ArrayList;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Continent;
import com.levart.entities.Feedback;
import com.levart.entities.Image;
import com.levart.entities.Nation;
import com.levart.entities.Tour;
import com.levart.entities.Typology;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSearchPackage;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.ContinentDAO;
import com.levart.hibernate.dao.FeedbackDAO;
import com.levart.hibernate.dao.ImageDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.dao.TourDAO;
import com.levart.hibernate.dao.TypologyDAO;

@Controller
@SessionAttributes("account")
@RequestMapping("/tour-detail")
public class TourDetailController {

	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}
	
	@ModelAttribute("messageContact")
	public FormMessage setSendNow() {
		return new FormMessage();
	}
	
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
	@ModelAttribute("contentSearchPackage")
	public FormSearchPackage setSearchPackage() {
		return new FormSearchPackage();
	}
	
	@RequestMapping
	public String showPage() {
		return "tour-detail";
	}
	
	@RequestMapping("/tour-detail")
	public String showPage(@ModelAttribute("account") Account account, Model model) {
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1) return "tour-detail";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		return "tour-detail";
	}
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String displaytourInfo(@PathVariable Integer id, Model model) throws Exception {
		// Get dữ liệu
		int tourID = id;
		TourDAO tourdao = new TourDAO();
		List<Tour> list = tourdao.getTour(id);
		model.addAttribute("tourList", list);
		List<String> scheduleList = tourdao.getTourSchedule(tourID);
		model.addAttribute("tourSchedule", scheduleList);
		ImageDAO imageDAO = new ImageDAO();
		List<Image> coverImage = imageDAO.getCoverImage(tourID);
		model.addAttribute("coverImageDisplay", coverImage);
		List<Image> galleryImages = imageDAO.getGalleryImages(tourID);
		model.addAttribute("galleryImagesDisplay", galleryImages);
		
		
		ImageDAO imgdao = new ImageDAO();
		List<Tour> relatedList = tourdao.getRelatedTour(list.get(0).getTypology().getTypologyID(), list.get(0).getNation().getNationID(),tourID);
		model.addAttribute("relatedList", relatedList);
		List<Image> imgList = new ArrayList<Image>();
		for (Tour tour : relatedList) {
			imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
		}
		model.addAttribute("imgList", imgList);
		
		
		FeedbackDAO feedbackDAO=new FeedbackDAO();
		List<Feedback> listAFeedback=feedbackDAO.getAllFeedback(tourID);
		if(listAFeedback.isEmpty()) {
			model.addAttribute("feedbackListcheck", 0);
		}else {
			model.addAttribute("feedbackListcheck", 1);
			model.addAttribute("feedbackList", listAFeedback);
		}
		
		NationDAO nationDAO = new NationDAO();
		List<Nation> nationList = nationDAO.getNationsByContinent(list.get(0).getNation().getContinent().getContinentID());
		model.addAttribute("nationList", nationList);
		
		ContinentDAO continentDAO = new ContinentDAO();
		Number num = continentDAO.countToursWithContinents(list.get(0).getNation().getContinent().getContinentID());
		model.addAttribute("packageNum", num);
		return "tour-detail";
	}
	
	@PostMapping("/tour-list")
	public String showResult(@ModelAttribute("account") Account account, Model model, @Valid @ModelAttribute("contentSearchPackage") FormSearchPackage formsearchpackage) {
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
	
//	@PostMapping("/search")
//	public ....
	///Theem search cho trang nafy sau khi DUng lam search xong
}
