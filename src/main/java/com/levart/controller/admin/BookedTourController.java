package com.levart.controller.admin;

import java.net.IDN;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@SessionAttributes("account")
@RequestMapping("/admin/booked-tour")
public class BookedTourController {
	
	@Autowired
	JavaMailSender mailSender;

	@ModelAttribute("statusBookedTour")
	public TourBooking updateStatusBookedTour() {
		return new TourBooking();
	}

	@ModelAttribute("addTourBooking")
	public TourBooking addBookedTour() {
		return new TourBooking();
	}

	@ModelAttribute("tourBooking")
	public TourBooking editBookedTour() {
		return new TourBooking();
	}

	@ModelAttribute("account")
	public Account setAccount() {
		return new Account();
	}
	@RequestMapping(value = { "/", "" })
	public String showPage(@ModelAttribute("account") Account account,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		List<TourBooking> tourBookings = tourBookingDAO.getAllTourBooking();

		model.addAttribute("tourBookings", tourBookings);
		model.addAttribute("account", account);
		
		return "/admin/booked-tour/list";
	}

	@RequestMapping(value = { "/add" })
	public String showPageAddTourBooking(@ModelAttribute("account") Account account,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
		
		TourDAO tourDAO = new TourDAO();
		List<Tour> tours = tourDAO.getAllTours();
		
		model.addAttribute("tours", tours);
		model.addAttribute("account", account);
		model.addAttribute("accounts", accounts);

		return "/admin/booked-tour/addForm";
	}

	@RequestMapping(value = { "/addTourBooking" })
	public String addBookingTour(@ModelAttribute("addTourBooking") TourBooking tourBooking) {
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		tourBookingDAO.updateTourBooking(tourBooking);
		return "redirect:/admin/booked-tour/add";
	}

	@RequestMapping(value = { "/edit" })
	public String showPage(@RequestParam("id") int id, @ModelAttribute("account") Account account,  Model model) {
		if (account.getEmail() == null) {
			return "redirect:/no-permission";
		}
		AccountDAO accountDAO = new AccountDAO();

		List<Account> accounts = accountDAO.getAllAccounts();
		
		int index = accountDAO.findAccountIndex(account.getEmail(), account.getPass());
		
		if (index == -1) return "redirect:/no-permission";
		
		account = accounts.get(index);
	
		// get the booked tour from the db
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		TourBooking editedTourBooking = tourBookingDAO.getTourBooking(id);

		// get all tours
		TourDAO tourDAO = new TourDAO();
		List<Tour> tours = tourDAO.getAllTours();

		// set booked tour as a model attribute to pre-populate the form
		model.addAttribute("account", account);
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
		Tour updatedTour = tourDAO.getTour(tourBooking.getTour().getTourID()).get(0);
		
		// update the tourBooking 	
		tourBooking.setTour(updatedTour);

		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		tourBookingDAO.updateTourBooking(tourBooking);

		return "redirect:/admin/booked-tour";
	}

	@RequestMapping(value = { "/api/delete" })
	public String delete(@RequestParam("id") int id, Model model) {
		// get the booked tour from the db
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		TourBooking deletedTourBooking = tourBookingDAO.getTourBooking(id);

		tourBookingDAO.deleteTourBooking(deletedTourBooking);

		return "redirect:/admin/booked-tour";
	}

	@PostMapping("updateStatusBookedTour")
	public String updateStatusBooked(@ModelAttribute("statusBookedTour") TourBooking tourbooking) throws MessagingException, MalformedURLException, URISyntaxException {
		TourBookingDAO tourBookingDAO = new TourBookingDAO();
		System.out.println("A " + tourbooking.getTourBookingID() + "," + Integer.valueOf(tourbooking.getBookStatus()));
		tourBookingDAO.updateStatusTourBooking(tourbooking.getTourBookingID(), tourbooking.getBookStatus());
		
		if (tourbooking.getBookStatus()==3) {
			tourbooking=tourBookingDAO.getTourBooking(tourbooking.getTourBookingID());
			MimeMessage message = mailSender.createMimeMessage();
			Boolean multipart = true;
			MimeMessageHelper helper = new MimeMessageHelper(message, multipart);
			String name = tourbooking.getAccount().getUsername();
			String email = tourbooking.getAccount().getEmail();
			
			String s="http://localhost:8080/UIT-IE303-TravelWeb/feedback?name=" + name + "&email=" + email + "&tourBookingID=" + tourbooking.getTourBookingID() +"&tourID="+ tourbooking.getTour().getTourID();
			URL url = new URL(s);
			URI uri = new URI(url.getProtocol(), url.getUserInfo(), IDN.toASCII(url.getHost()), url.getPort(),
					url.getPath(), url.getQuery(), url.getRef());
			String correctEncodedURL = uri.toASCIIString();
			System.out.println(correctEncodedURL);
			
			String htmlMessage = " <div style=\"width: fit-content; background-color: blueviolet; padding: 20px 50px 50px;\">\r\n"
					+ "        <h1 style=\"color: aliceblue; margin: 10px 100px;\">LEVART</h1>\r\n"
					+ "        <section style=\"background-color: antiquewhite;  border-radius: 15px; margin: 10px 100px; padding: 20px 30px;\">\r\n"
					+ "            <h1>We believe that you have a great trip!!! </h1>\r\n"
					+ "            <p>Please, give us feedback about your trip: </p>\r\n"
					+ "            <button style=\"background-color: blueviolet; border-radius: 10px; padding: 5px 5px;\">\r\n"
					+ "                <a href=\""+ correctEncodedURL
					+ "\" style=\"color: white; text-decoration: none; font-weight: 600;\">Leave your feedback</a>\r\n"
					+ "            </button>\r\n" 
					+ "        </section>\r\n"
					+ "        <section style=\"background-color: antiquewhite;  border-radius: 15px; margin: 10px 100px; padding: 20px 30px;\">\r\n"
		
					+ "                ---------------------------------------------- <br> Levart Travel Agency <br> University of Infomation Technology <br> Office : IE303.L21, Tim Tim Team, Han Thuyen Street, Linh Trung Ward, Thu Duc District, Ho Chi Minh City\r\n"
					+ "                <br> Tel : 12344321 hinh nhu em noi em yeu anh roi | Email: thomnd131200@gmail.com <br> Website : ..... <br> Hotline: 0900 gan song khong co song | Feedback - Complaints: 0902 ngay mai noi tiep\r\n"
					+ "            </p>\r\n" + "        </section>\r\n" + "    </div>";
			message.setContent(htmlMessage, "text/html");
			helper.setFrom("thomnd131200@gmail.com");
			helper.setTo(tourbooking.getAccount().getEmail());
			helper.setSubject("[Feedback] Please Give Us Feedback!!!");
			// gui email thong qua gmail
			this.mailSender.send(message);	
		}
		
		return "redirect:/admin/booked-tour";
	}
}
