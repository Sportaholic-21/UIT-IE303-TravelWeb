package com.levart.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.levart.entities.Account;
import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@RequestMapping("/admin/booked-tour")
public class BookedTourController {
	
	@ModelAttribute("statusBookedTour")
	public TourBooking updateStatusBookedTour() {
		return new TourBooking();
	}
	@ModelAttribute("addTourBooking")
	public TourBooking addBookedTour() {
		return new TourBooking();
	}
	
	@RequestMapping(value={"/", ""})
	public String showPage(Model model) {
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		List<TourBooking> tourBookings = tourBookingDAO.getAllTourBooking();
		
		model.addAttribute("tourBookings", tourBookings);
		
		return "/admin/booked-tour/list";
	}
	
	@RequestMapping(value={"/add"})
	public String showPageAddTourBooking(Model model) {
		TourDAO tourDAO = new TourDAO();
		List<Tour> tours = tourDAO.getAllTours();
		model.addAttribute("tours", tours);
		
		AccountDAO accountDAO=new AccountDAO();
		List<Account> accounts=accountDAO.getAllAccounts();
		model.addAttribute("accounts", accounts);
		
		return "/admin/booked-tour/addForm";
	}
	
	@RequestMapping(value={"/addTourBooking"})
	public String addBookingTour(@ModelAttribute("addTourBooking") TourBooking tourBooking) {
		TourBookingDAO tourBookingDAO=new TourBookingDAO();
		tourBookingDAO.updateTourBooking(tourBooking);
		return "redirect:/admin/booked-tour/add";
	}
	
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
		return "/admin/booked-tour/editForm";
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

		return "redirect:/admin/booked-tour";
	}
	
	@RequestMapping(value = { "/api/delete" })
	public String delete(@RequestParam("id") int id, Model model) {
		//	 get the booked tour from the db
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		TourBooking deletedTourBooking = tourBookingDAO
				.getTourBooking(id);
		
		tourBookingDAO.deleteTourBooking(deletedTourBooking);
		
		return "redirect:/admin/booked-tour";
	}
	@PostMapping("updateStatusBookedTour")
	public String updateStatusBooked(@ModelAttribute("statusBookedTour") TourBooking tourbooking ) {
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		System.out.println("A "+tourbooking.getTourBookingID()+","+ Integer.valueOf(tourbooking.getBookStatus()));
		tourBookingDAO.updateStatusTourBooking(tourbooking.getTourBookingID(), tourbooking.getBookStatus());
		return "redirect:/admin/booked-tour";
	}
}
