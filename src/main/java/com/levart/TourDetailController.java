package com.levart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourDetailController {
	@RequestMapping("/tour-detail")
	public String showPage() {
		return "tour-detail";
	}
}
