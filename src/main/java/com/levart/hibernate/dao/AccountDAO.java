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

	private List<Account> accounts = new ArrayList<>();

	public AccountDAO(){

	}

	public List<Account> getAllAccounts(){
		Session session = factory.openSession();
		try {
			Transaction tx = session.beginTransaction();
			@SuppressWarnings("unchecked")
			Query<Account> query=session.createQuery(hql);
			accounts = query.getResultList();
			for (Account account: accounts){
				System.out.println(account.getAccountID());
			}
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
}
