package com.levart.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.levart.entities.TourBooking;
import com.levart.hibernate.utils.HibernateUtils;

public class TourBookingDAO {
	static SessionFactory factory;
	
	public List<TourBooking> getAllTourBooking() {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<TourBooking> query=session.createQuery("from TourBooking");
			List<TourBooking> tourBookings = query.getResultList();
						
			return tourBookings;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return null;
	}
	
	public TourBooking getTourBooking(int id) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			TourBooking tour = session.get(TourBooking.class, id);
			return tour;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return null;
	}	
	
	public void updateTourBooking(TourBooking tourBooking) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			
			session.saveOrUpdate(tourBooking);
			
			tx.commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
	}	
	
	public void updateStatus(TourBooking tourBooking) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			
			session.saveOrUpdate(tourBooking);
			
			tx.commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
	}	
	
	public void deleteTourBooking(TourBooking tourBooking) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			
			session.delete(tourBooking);
			
			tx.commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
	}	
}
