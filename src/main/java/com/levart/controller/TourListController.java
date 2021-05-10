package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.levart.form_entities.FormSearch;
import com.levart.form_entities.FormSearchPackage;

@Controller
public class TourListController {
	
	@ModelAttribute("contentSearchPackage")
	public FormSearchPackage setSearchPackage() {
		return new FormSearchPackage();
	}
	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}
	
    @RequestMapping("/tour-list")
	public String showPage() {
		return "tour-list";
	}
}
