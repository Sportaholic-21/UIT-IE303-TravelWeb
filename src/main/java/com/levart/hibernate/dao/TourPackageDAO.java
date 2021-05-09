package com.levart.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.levart.hibernate.utils.HibernateUtils;
import com.levart.entities.TourPackage;

public class TourPackageDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public TourPackageDAO() {
		// TODO Auto-generated constructor stub
	}

	//select
	public void getTourPackage() {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query<TourPackage> query=session.createQuery("from TourPackage");
			List<TourPackage> packageList = query.getResultList();
			
			for (TourPackage tourPackage: packageList) {
				System.out.println(tourPackage.getPackageID());
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
	public void addTourPackage(TourPackage tourPackage) {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			session.save(tourPackage);
//			tx.commit();
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
		TourPackage p = new TourPackage( );
		p.setNation("CHina");
		p.setContinent("Khap the gioi");
		TourPackageDAO tourPackageDAO= new TourPackageDAO();
		tourPackageDAO.addTourPackage(p);
		tourPackageDAO.getTourPackage();
		System.out.println("hello");
	}
}
