package com.levart.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@RequestMapping("/admin/booked-tour")
public class BookedTourEditingController {
	@RequestMapping(value = { "/edit" })
	public String showPage(@RequestParam("id") int id, Model model) {
		//	 get the booked tour from the db
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		TourBooking editedTourBooking = tourBookingDAO
				.getTourBooking(id);

		// get all tours
		TourDAO tourDAO = new TourDAO();
		List<Tour> tours = tourDAO.getAllTours();
		
		// set booked tour as a model attribute to pre-populate the form
		model.addAttribute("tourBooking", editedTourBooking);
		model.addAttribute("tours", tours);
		model.addAttribute("username", editedTourBooking.getAccount().getUsername());
		
		// return view
		return "/admin/booked-tour-editing";
	}
	
	@PostMapping(value = { "/api/update" })
	public String showPage(@ModelAttribute("tourBooking") TourBooking tourBooking) {
		// get Tour
		TourDAO tourDAO = new TourDAO();
		Tour updatedTour = (Tour) tourDAO.getTour(tourBooking.getTour().getTourID());
		
		// update the tourBooking 	
		tourBooking.setTour(updatedTour);

		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		tourBookingDAO.updateTourBooking(tourBooking);

		return "redirect:/admin/booked-tours";
	}
}
