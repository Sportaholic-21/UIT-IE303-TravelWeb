package com.levart.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.levart.entities.Account;
import com.levart.entities.Nation;
import com.levart.entities.Tour;
import com.levart.entities.Typology;
import com.levart.hibernate.utils.HibernateUtils;

public class TypologyDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public TypologyDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Typology> getAllTypologies(){
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Typology> query=session.createQuery("from Typology");
			List<Typology> nationList = query.getResultList();
			
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
		TypologyDAO tyDAO = new TypologyDAO();
		List<Typology> list = tyDAO.getAllTypologies();
		System.out.println(list);
	}
}
