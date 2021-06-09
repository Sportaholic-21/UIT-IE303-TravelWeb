package com.levart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.levart.entities.Account;
import com.levart.entities.Tour;
import com.levart.hibernate.dao.AccountDAO;
import com.levart.hibernate.dao.TourDAO;

@Controller
@RequestMapping(value="/wishlist")
public class WishlistController {
	@RequestMapping(value={"/", ""})
	public String showWishlist(@ModelAttribute(name="account") Account account, Model model) {
		if (account.getEmail() == null) {
			model.addAttribute("username", null);
		} else {
			AccountDAO userDAO = new AccountDAO();
			List<Account> users = userDAO.getAllAccounts();
			int i = userDAO.findAccountIndex(account.getEmail(), account.getPass());
			account = users.get(i);
			model.addAttribute("username", account.getUsername());
		}
		
		return "wishlist";	
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/api"}, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody int addWishlist(Model model, HttpServletRequest request) {
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		
		List<Tour> wishlistSession = new ArrayList<Tour>();
		
		TourDAO tourDAO = new TourDAO();
		
		int tourID = Integer.parseInt(id);
		
		Tour tour = tourDAO.getTour(tourID).get(0);
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("wishlistSession") != null) {
			wishlistSession = (ArrayList<Tour>) session.getAttribute("wishlistSession");
        }else {
        	wishlistSession = new ArrayList<Tour>();
        }
		
		int index = wishlistSession.indexOf(tour);

		if(action.equals("add")) {
			if( index == -1 ){
			  // Remove the item and store it in a variable
				wishlistSession.add(tour);
			}	
		} else if(action.equals("remove")) {
			if( index != -1 ){
				  // Remove the item and store it in a variable
					wishlistSession.remove(tour);
				}
			
			session.setAttribute("wishlistSession", wishlistSession);
			}
		
		int wishListNum = wishlistSession.size();
	
		session.setAttribute("wishlistSession", wishlistSession);
		session.setAttribute("wishListNum", wishListNum);
		
		return wishlistSession.size();
	}
}
