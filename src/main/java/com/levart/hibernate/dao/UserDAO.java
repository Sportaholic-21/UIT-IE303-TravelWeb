package com.levart.hibernate.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

import com.levart.entities.User;
import com.levart.hibernate.utils.HibernateUtils;

public class UserDAO {
	SessionFactory factory=HibernateUtils.getSessionFactory();

	private String hql = "from User";

	/*private List<User> users = new ArrayList<>();

	public List<User> getAll(){
		return users;
	}
*/
	public UserDAO(){

	}

	public void getUser(){
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			Query<User> query=session.createQuery(hql);
			List<User> users = query.getResultList();
			for (User user: users){
				System.out.println(user.getUserID());
			}
			tx.commit();
		} catch (RuntimeException e){
			session.getTransaction().rollback();
			e.printStackTrace();
		} /*finally{
			session.flush();
			session.close();
		}*/
	}

	public void addUser(User user) {
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			session.save(user);
			tx.commit();
			System.out.println("OK");
		} catch (RuntimeException e){
			session.getTransaction().rollback();
			e.printStackTrace();
		} /*finally {
			session.flush();
			session.close();
		}*/
	}

	public static void main(String []args){
		User a = new User();
		a.setUsername("Long");
		UserDAO userDAO = new UserDAO();
		userDAO.addUser(a);
		userDAO.getUser();
		System.out.println("Hello");
	}
}
