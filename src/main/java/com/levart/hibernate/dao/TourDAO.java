package com.levart.hibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.levart.hibernate.utils.HibernateUtils;
import com.levart.entities.Tour;

public class TourDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public TourDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public Tour getTour(int id) {
		Session session = factory.openSession();
		try {
			Tour tour = session.get(Tour.class, id);
			return tour;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return null;
	}

	//select
	public List<Tour> getAllTours() {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query<Tour> query=session.createQuery("from Tour");
			List<Tour> tourList = query.getResultList();
			
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		
		return null;
	}
	
	//insert
	public void addTour(Tour tour) {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			session.save(tour);
			tx.commit();
			System.out.println("Insert success!");
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
	}
	public static void main(String []args){
		Tour p = new Tour();
//		p.setNation("CHina");
//		p.setContinent("Khap the gioi");
		TourDAO tourDAO= new TourDAO();
		tourDAO.addTour(p);
		tourDAO.getAllTours();
		System.out.println("hello");
	}
}
