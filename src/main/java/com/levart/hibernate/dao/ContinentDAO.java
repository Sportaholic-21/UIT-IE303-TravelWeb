package com.levart.hibernate.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.levart.entities.Nation;
import com.levart.entities.Continent;
import com.levart.hibernate.utils.HibernateUtils;

public class ContinentDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public ContinentDAO() {
		// TODO Auto-generated constructor stub
	}
	
	//select
	public List<Continent> getAllContinents(){
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Continent> query=session.createQuery("from Continent");
			List<Continent> continentList = query.getResultList();
			
			return continentList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		return null;
	}
	public List<Nation> getListNationByEndedTour() {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Nation> query=session.createQuery("select distinct t.nation from Tour t, TourBooking tb where t.tourID = tb.tour.tourID and tb.bookStatus = 3");
			List<Nation> nationList = query.getResultList();
			
			return nationList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return null;
	}
	
	public Number countToursWithContinents(int id) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			String hql = "select count(tourName) from Tour where nation.continent.continentID = :searchKey";
			Query query = session.createQuery(hql).setParameter("searchKey", id);
			List listResult = query.list();
			Number number = (Number) listResult.get(0);
			return number;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return 0;
	}
	
	public static void main(String []args){
		ContinentDAO continentdao = new ContinentDAO();
		Number num = continentdao.countToursWithContinents(1);
		System.out.print(num);	
	}
}
