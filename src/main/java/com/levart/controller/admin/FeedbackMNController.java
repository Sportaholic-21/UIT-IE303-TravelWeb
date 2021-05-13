package com.levart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class FeedbackMNController {
	@RequestMapping(value={"/feedbacks"})
	public String showPage() {
		return "/admin/feedback";
	}
}
