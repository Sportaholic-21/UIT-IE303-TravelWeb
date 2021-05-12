package com.levart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class BookedTourEditingController {
	@RequestMapping(value={"/edit-booked-tour"})
	public String showPage() {
		return "/admin/booked-tour-editing";
	}
}
