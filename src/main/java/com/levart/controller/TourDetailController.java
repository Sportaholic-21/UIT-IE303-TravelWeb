package com.levart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Image;
import com.levart.entities.Tour;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.ImageDAO;
import com.levart.hibernate.dao.TourDAO;

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
		return "tour-detail";
	}
	
//	@PostMapping("/search")
//	public ....
	///Theem search cho trang nafy sau khi DUng lam search xong
}
