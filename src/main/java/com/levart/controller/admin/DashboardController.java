package com.levart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DashboardController {
	@RequestMapping(value={"/dashboard", "/", ""})
	public String showPage() {
		return "/admin/dashboard";
	}
}
