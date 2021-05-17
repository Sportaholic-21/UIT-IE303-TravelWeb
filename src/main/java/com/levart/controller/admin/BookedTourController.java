package com.levart.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.TourBookingDAO;

@Controller
@RequestMapping("/admin")
public class BookedTourController {
	@RequestMapping(value={"/booked-tours"})
	public String showPage(Model model) {
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		List<TourBooking> tourBookings = tourBookingDAO.getAllTourBooking();
		
		model.addAttribute("tourBookings", tourBookings);
		
		return "/admin/booked-tour";
	}
}
