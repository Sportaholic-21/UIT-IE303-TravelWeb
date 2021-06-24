package com.levart.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.levart.entities.Account;
import com.levart.entities.Feedback;
import com.levart.entities.Tour;
import com.levart.entities.TourBooking;
import com.levart.form_entities.FormMessage;
import com.levart.form_entities.FormSearch;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.FeedbackDAO;
import com.levart.hibernate.dao.TourBookingDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@SessionAttributes("account")
public class FeedbackController {

	@ModelAttribute("account")
	public Account newAccount() {
		return new Account();
	}
	private String urlLocal;

	@RequestMapping("/feedback")
	public String showPage(@RequestParam(value = "tourID", required = false, defaultValue = "0") int tourID,
			@RequestParam(value = "tourBookingID", required = false, defaultValue = "0") int tourBookingID,
			@ModelAttribute("account") Account account, Model model, HttpServletRequest request) {
		
		this.urlLocal=request.getHeader("host")+ request.getRequestURI()+"?"+ request.getQueryString();
		TourDAO tourDAO = new TourDAO();
		TourBookingDAO tourbookingDAO = new TourBookingDAO();
		List<Tour> tourList = new ArrayList<Tour>();

		if (tourID != 0 && tourBookingID != 0) {
			tourList = tourDAO.getTour(tourID);
			Tour tour = tourList.get(0);
			TourBooking tourBooking = tourbookingDAO.getTourBooking(tourBookingID);
			model.addAttribute("tour", tour);
			model.addAttribute("tourBooking", tourBooking);
		} else {
			Tour tour = new Tour();
			TourBooking tourBooking = new TourBooking();
			model.addAttribute("tour", tour);
			model.addAttribute("tourBooking", tourBooking);
		}

		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			if (i == -1)
				return "feedback";
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}

		return "feedback";
	}

	@ModelAttribute("messageFeedback")
	public FormMessage sendFeebback() {
		return new FormMessage();
	}

	@ModelAttribute("textSearch")
	public FormSearch setSearch() {
		return new FormSearch();
	}

	@RequestMapping("/sendFeedback")
	public String sendFeedback(@ModelAttribute("messageFeedback") FormMessage messageFeedback,
			@ModelAttribute("account") Account account, Model model, HttpServletRequest request) {
		
		FeedbackDAO dao = new FeedbackDAO();
		List<Feedback> feedbacklist = dao.getFeedbackByTourBookingID(messageFeedback.getTourBookingID());
		System.out.println(this.urlLocal);
		System.out.println(messageFeedback.getTourBookingID());
		System.out.println(messageFeedback.getName());
		System.out.println(messageFeedback.getEmail());
		System.out.println(messageFeedback.getMessage());
		Feedback feedback =new Feedback();
		if (!feedbacklist.isEmpty()) {
			feedback= feedbacklist.get(0);
			feedback.setFeedbackMessage(messageFeedback.getMessage());
			feedback.setStart(messageFeedback.getStart());
			
			int status = analiseSentiment(request, messageFeedback.getMessage());
			feedback.setSentimentStatus(status);
		}else {
			feedback.setTourBookingID(new TourBookingDAO().getTourBooking(messageFeedback.getTourBookingID()));
			feedback.setFeedbackMessage(messageFeedback.getMessage());
			feedback.setStart(messageFeedback.getStart());
			
			int status = analiseSentiment(request, messageFeedback.getMessage());
			feedback.setSentimentStatus(status);
		}
		if (messageFeedback.getMessage()!="")
		dao.addFeedBack(feedback);
		
		return "redirect: " + this.urlLocal;
	}
	
	public int analiseSentiment(HttpServletRequest request, String message) {
		try{
			// path to sentimentAnalysis python file
            String pythonPath = "D:\\sentimentAnalysis.py";
            
            // path to python.exe
            String pythonExe = "C:\\Program Files\\Python39\\python.exe";
            
            // run python file and pass feedback message
            ProcessBuilder pb = new ProcessBuilder(pythonExe,
                    "-u",
                    pythonPath,
                    message);
            Process p = pb.start();

            // read value returned from python file
            BufferedReader bfr = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = "";
            line = bfr.readLine();
            System.out.println("message: " + line);
            while ((line = bfr.readLine()) != null){
            	// return value
                return Integer.parseInt(line);
            }
        }catch(Exception e){System.out.println(e);}
		
		return -1;
	}
}
