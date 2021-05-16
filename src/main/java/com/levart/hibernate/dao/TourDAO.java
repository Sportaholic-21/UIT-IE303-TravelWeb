package com.levart.hibernate.dao;

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

	//select
	public void getTour() {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query<Tour> query=session.createQuery("from Tour");
			List<Tour> packageList = query.getResultList();
			
			for (Tour tour: packageList) {
				System.out.println(tour.getTourID());
			}
//			tx.commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
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
		tourDAO.getTour();
		System.out.println("hello");
	}
}
