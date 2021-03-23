package com.levart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignInController {
	@RequestMapping("/sign-in")
	public String showPage() {
		return "sign-in";
	}
}
