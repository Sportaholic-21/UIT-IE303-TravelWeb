package com.levart.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.levart.entities.Nation;
import com.levart.hibernate.utils.HibernateUtils;

public class NationDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public NationDAO() {
	}
	
	//select
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
	
	public List<Nation> getAllNations() {
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			String hql = "from Nation n order by size(n.tours) DESC";
			Query<Nation> query=session.createQuery(hql).setMaxResults(6);
			List<Nation> nationList = query.getResultList();
			
			return nationList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {

			session.close();
		}
		return null;
	}
	
	public List<Nation> getNationsByContinent(int id) {
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			String hql = "from Nation where continentID = " + id;
			Query<Nation> query=session.createQuery(hql);
			List<Nation> nationList = query.getResultList();
			
			return nationList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {

			session.close();
		}
		return null;
	}
	
	public static void main(String []args){
		NationDAO nationdao = new NationDAO();
		List<Nation> list = nationdao.getNationsByContinent(1);
		System.out.print(list);
		
	}
}
