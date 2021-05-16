package com.levart.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.levart.hibernate.utils.HibernateUtils;
import com.levart.entities.Tour;

public class TourPackageDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public TourPackageDAO() {
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
			Query<Tour> query=session.createQuery("from TourPackage");
			List<Tour> packageList = query.getResultList();
			
			for (Tour tourPackage: packageList) {
				System.out.println(tourPackage.getTourID());
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
	public void addTour(Tour tourPackage) {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			session.save(tourPackage);
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
		TourPackageDAO tourPackageDAO= new TourPackageDAO();
		tourPackageDAO.addTour(p);
		tourPackageDAO.getTour();
		System.out.println("hello");
	}
}
