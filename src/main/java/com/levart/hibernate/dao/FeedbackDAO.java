package com.levart.hibernate.dao;

import java.net.IDN;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.levart.entities.Feedback;
import com.levart.entities.TourBooking;
import com.levart.hibernate.utils.HibernateUtils;

public class FeedbackDAO {
	static SessionFactory factory;

	public List<Feedback> getFeedbackByTourBookingID(int tourBookingID) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();

		try {

			@SuppressWarnings("unchecked")
			Query<Feedback> query = session.createQuery("from Feedback where tourBookingID= :tourBookingID");
			query.setParameter("tourBookingID", tourBookingID);
			List<Feedback> feedback = query.getResultList();
			return feedback;

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		return null;
	}
	
	public List<Feedback> getAllFeedback(int tourID) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();

		try {
			Query<Feedback> query = session.createQuery("from Feedback");
			List<Feedback> feedback = query.getResultList();
			List<Feedback> fbList=new ArrayList<Feedback>();
			for (Feedback fb : feedback) {
				if (fb.getTourBookingID().getTour().getTourID()==tourID) {
					fbList.add(fb);
				}
			}
			return fbList;

		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		return null;
	}

	public void addFeedBack(Feedback feedback) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;

		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(feedback);
			tx.commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
	}
	
	public static void main(String[] args) throws MalformedURLException, URISyntaxException {
		FeedbackDAO dao= new FeedbackDAO();
//		dao.addFeedBack(3, "Hello", 5);
//		
//		String urlStr = "http://localhost:8080/UIT-IE303-TravelWeb/feedback?name=thone&email=pastwent12345@gmail.com&tourBookingID=3&tourID=5";
//		URL url = new URL(urlStr);
//		URI uri = new URI(url.getProtocol(), url.getUserInfo(), url.getHost(), url.getPort(), url.getPath(),
//				url.getQuery(), url.getRef());
//		for (Feedback a : dao.getAllFeedback()) {
//			System.out.println(a.getFeedbackID());
//		}
		
//
//		URL url = new URL("http://example.com/query?q=random word £500 bank $");
//		URI uri = new URI(url.getProtocol(), url.getUserInfo(), IDN.toASCII(url.getHost()), url.getPort(),
//				url.getPath(), url.getQuery(), url.getRef());
//		String correctEncodedURL = uri.toASCIIString();
//		System.out.println(correctEncodedURL);
	}
}
