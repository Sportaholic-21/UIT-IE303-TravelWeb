package com.levart.hibernate.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.levart.entities.Account;
import com.levart.entities.Nation;
import com.levart.entities.Tour;
import com.levart.hibernate.utils.HibernateUtils;

public class NationDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public NationDAO() {
	}
	
	public List<Nation> getAllNation(){
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Nation> query=session.createQuery("from Nation");
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
		factory = HibernateUtils.getSessionFactory();
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
			factory.close();
		}
		return null;
	}
	
	public List<Nation> getNationsByContinent(int id) {
		factory = HibernateUtils.getSessionFactory();
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
			factory.close();
		}
		return null;
	}		
	public static void main(String args[]) {
		TourDAO tourdao = new TourDAO();
		
		List<Tour> listAll = tourdao.getAllTours();
		NationDAO nationDAO= new NationDAO();
		List<Nation> nationList=nationDAO.getAllNation();
		AccountDAO userDAO = new AccountDAO();
		List<Account> users = userDAO.getAllAccounts();
		System.out.println(listAll.size()+" "+ nationList.size() + users.size());
	}
}
