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
}
