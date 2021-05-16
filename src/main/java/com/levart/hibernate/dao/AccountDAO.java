package com.levart.hibernate.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

import com.levart.entities.User;
import com.levart.hibernate.utils.HibernateUtils;

public class AccountDAO {
	SessionFactory factory=HibernateUtils.getSessionFactory();

	private String hql = "from User";

	private List<User> users = new ArrayList<>();

	public UserDAO(){

	}

	public List<User> getUser(){
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			Query<User> query=session.createQuery(hql);
			users = query.getResultList();
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
		return users;
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

	//Search
	public int findUserIndex(String email, String password){
		int i;
		for (i = 0; i < users.size() 
					&& !(users.get(i).getEmail().equals(email) && users.get(i).getPass().equals(password)); 
					i++);
		return (i == users.size()) ? -1 : i;
	}
}
