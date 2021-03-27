package com.levart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TourListController {
    @RequestMapping("/tour-list")
	public String showPage() {
		return "tour-list";
	}
}
