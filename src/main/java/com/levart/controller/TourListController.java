package com.levart.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.http.MediaType;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import com.levart.entities.Account;
import com.levart.entities.Continent;
import com.levart.entities.Image;
import com.levart.entities.Nation;
import com.levart.entities.Tour;
import com.levart.entities.Typology;
import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSearchPackage;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.ContinentDAO;
import com.levart.hibernate.dao.ImageDAO;
import com.levart.hibernate.dao.NationDAO;
import com.levart.hibernate.dao.TourDAO;
import com.levart.hibernate.dao.TypologyDAO;

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
	
	@RequestMapping(value = "/tour-list")
	public String showPage(@ModelAttribute("account") Account account, Model model, @ModelAttribute("contentSearchPackage") FormSearchPackage formsearchpackage, 
			@RequestParam(value = "typologyID", required = false, defaultValue = "0") int typologyID,
			@RequestParam(value = "continentID", required = false, defaultValue = "0") int continentID,
			@RequestParam(value = "nationID", required = false, defaultValue = "0") int nationID) {
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
		// Trường hợp tìm kiếm trong tour-list từ trang all tours tìm kiếm ra các kết quả
		if(typologyID == 0 && continentID == 0 && nationID == 0) {
			TourDAO tourdao = new TourDAO();
			List<Tour> list = tourdao.findTourWithCriteria(formsearchpackage.getDestination(), formsearchpackage.getMaxPrice(), formsearchpackage.getContinent(), formsearchpackage.getNation(), formsearchpackage.getTypology());
			
			NationDAO nationdao = new NationDAO();
			List<Nation> listNation = nationdao.getAllNation();
			
			ContinentDAO continentdao = new ContinentDAO();
			List<Continent> listContinent = continentdao.getAllContinents();
			
			TypologyDAO typologydao = new TypologyDAO();
			List<Typology> listTypology = typologydao.getAllTypologies();
			
	    	ImageDAO imgdao = new ImageDAO();
	    	List<Image> imgList = new ArrayList<Image>();
			for (Tour tour : list) {
				imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
			}
			
			model.addAttribute("continentList", listContinent);
    	    model.addAttribute("nationList", listNation);
    	    model.addAttribute("typologyList", listTypology);
			
			model.addAttribute("searchResult", list);
			model.addAttribute("imgList", imgList);
		}
		// Trường hợp lấy từ tag trong tour-detail
		else {
			TourDAO tourdao = new TourDAO();
			List<Tour> list = new ArrayList<Tour>();
			
			NationDAO nationdao = new NationDAO();
			List<Nation> listNation = nationdao.getAllNation();
			
			ContinentDAO continentdao = new ContinentDAO();
			List<Continent> listContinent = continentdao.getAllContinents();
			
			TypologyDAO typologydao = new TypologyDAO();
			List<Typology> listTypology = typologydao.getAllTypologies();
			
			model.addAttribute("typologyList", listTypology);
			model.addAttribute("continentList", listContinent);
    	    model.addAttribute("nationList", listNation);
			
			if(typologyID != 0)
				list = tourdao.getTourByTypologyID(typologyID);
			else if(continentID != 0)
				list = tourdao.getTourByContinentID(continentID);
			else if (nationID != 0)
				list = tourdao.getTourByNationID(nationID);
	    	
	    	ImageDAO imgdao = new ImageDAO();
	    	List<Image> imgList = new ArrayList<Image>();
			for (Tour tour : list) {
				imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
			}
			
			model.addAttribute("searchResult", list);
			model.addAttribute("imgList", imgList);
		}
		return "tour-list";
	}
	
    
    @RequestMapping("/all-tours")
    	public String showAllTours(@ModelAttribute("account") Account account, Model model) {
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
    		TourDAO tourdao = new TourDAO();
    		List<Tour> list = tourdao.getAllTours();
    		
    		NationDAO nationdao = new NationDAO();
			List<Nation> listNation = nationdao.getAllNation();
			
			ContinentDAO continentdao = new ContinentDAO();
			List<Continent> listContinent = continentdao.getAllContinents();
			
			TypologyDAO typologydao = new TypologyDAO();
			List<Typology> listTypology = typologydao.getAllTypologies();
			
			model.addAttribute("typologyList", listTypology);
			model.addAttribute("continentList", listContinent);
     	    model.addAttribute("nationList", listNation);
    	    
    	    ImageDAO imgdao = new ImageDAO();
    	    List<Image> imgList = new ArrayList<Image>();
    		for (Tour tour : list) {
    			imgList.add(imgdao.getGalleryImages(tour.getTourID()).get(1));
    		}
    		
    		model.addAttribute("searchResult", list);
    		model.addAttribute("imgList", imgList);
    		return "tour-list";
    }
    

	@RequestMapping(value={"api/sidebarTourList"},method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<HashMap<String,String>> displayTourOnSideBar() {
		List<HashMap<String,String>> tourList = new ArrayList<>();
		TourDAO tourdao = new TourDAO();
    	List<Tour> list = tourdao.getTop3Tours();
		ImageDAO imgdao = new ImageDAO();
		for (Tour tour : list) {
			HashMap<String,String> innerMap = new HashMap<>();
			innerMap.put("tourId", String.valueOf(tour.getTourID()));
			innerMap.put("tourName",tour.getTourName());
			innerMap.put("nationName",tour.getNation().getNationName());
			innerMap.put("price",tour.getPrice());
			innerMap.put("imageURL",imgdao.getGalleryImages(tour.getTourID()).get(1).getImageURL());
			tourList.add(innerMap);
		}
		return tourList;
	}
}
