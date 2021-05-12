package com.levart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class TourBookingController {
	@RequestMapping(value={"/tour-booking"})
	public String showPage() {
		return "/admin/tour-booking";
	}
}
