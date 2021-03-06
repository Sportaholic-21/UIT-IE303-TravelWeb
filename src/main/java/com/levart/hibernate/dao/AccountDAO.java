package com.levart.hibernate.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

import com.levart.entities.Account;
import com.levart.hibernate.utils.HibernateUtils;

public class AccountDAO {
	SessionFactory factory=HibernateUtils.getSessionFactory();

	private String hql = "from Account";

	private static List<Account> accounts = new ArrayList<>();

	public AccountDAO(){

	}

	public List<Account> getAllAccounts(){
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			Query<Account> query=session.createQuery(hql);
			accounts = query.getResultList();
//			for (Account account: accounts){
//				System.out.println(account.getAccountID());
//			}
			tx.commit();
		} catch (RuntimeException e){
			session.getTransaction().rollback();
			e.printStackTrace();
		} /*finally{
			session.flush();
			session.close();
		}*/
		return accounts;
	}
	
	public Account getAccount(String username) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Account> query = session.createQuery("from Account account where account.username=:theParam");

			query.setParameter("theParam", username);
			
			Account tempAccount = query.getSingleResult();

			return tempAccount;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return null;
	}
	
	public Account getAccountbyEmail(String email) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Account> query = session.createQuery("from Account account where account.email=:theParam");

			query.setParameter("theParam", email);
			
			Account tempAccount = query.getSingleResult();

			return tempAccount;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return null;
	}

	public void addAccount(Account account) {
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			session.save(account);
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
	public int findAccountIndex(String email, String password){
		int i;
		for (i = 0; i < accounts.size() 
					&& !(accounts.get(i).getEmail().equals(email) && accounts.get(i).getPass().equals(password)); 
					i++);
		return (i == accounts.size()) ? -1 : i;
	}

	public int findEmail(String email) {
		int i;
		for (i = 0; i < accounts.size() 
					&& !(accounts.get(i).getEmail().equals(email)); 
					i++);
		return (i == accounts.size()) ? -1 : i;
	}
	
	// get tourBooking of specific account
	public Account getAccountWithTourBooking(String username) {
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			@SuppressWarnings("unchecked")
			Query<Account> query = session.createQuery("select i from Account i JOIN FETCH i.tourBookings where i.username=:theParam");
			
			query.setParameter("theParam", username);
			
			Account tempAccount = query.getSingleResult();
			
			return tempAccount;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		
		return null;
	}

	public int setNewPassword(String email, String newPassword) {
		int out;
		factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			Query<Account> query = session.createQuery("update Account acc set acc.password=:newPassword where email=:email");
			query.setParameter("newPassword", newPassword);
			query.setParameter("email", email);
			out = query.executeUpdate();
			tx.commit();
			return out;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}
		return -1;
	}
}
