package com.levart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping(value={"/", ""})
	public String showMap() {
		return "/user/guest-profile";
	}
	
	@RequestMapping(value={"/insight"})
	public String showPage(Model model) {
		model.addAttribute("active", "profile");
		
		return "/user/profile";
	}
	
	@RequestMapping(value={"/insight/booked-tours"})
	public String showBookedTours(Model model) {
		model.addAttribute("active", "bookedTours");
		
		return "/user/bookedTours";
	}
}
