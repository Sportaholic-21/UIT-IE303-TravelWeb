package com.levart.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ErrorController {
	@RequestMapping("no-permission")
	public String showPermission() {
		return "no-permission";
	}
}
