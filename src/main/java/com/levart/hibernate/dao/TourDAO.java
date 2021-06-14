package com.levart.hibernate.dao;

import java.util.ArrayList;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.levart.entities.Tour;
import com.levart.entities.Typology;
import com.levart.entities.Image;
import com.levart.entities.Nation;
import com.levart.hibernate.utils.HibernateUtils;

public class TourDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public TourDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Tour> getTour(int id) {
		Session session = factory.openSession();
		List<Tour> tourList = new ArrayList<Tour>();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query<Tour> query =session.createQuery("from Tour where tourID ='"  + id +"'");
			tourList = query.list();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();

		}
		return tourList;
	}
	
	
	public List<String> getTourSchedule(int id){
		Session session = factory.openSession();
		List<Tour> scheduleList = new ArrayList<Tour>();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query query =session.createQuery("select schedule from Tour where tourID ='"  + id +"'");
			List<String> list = (List<String>) query.list();
			String listAsString = list.stream()
                    .map(Object::toString)
                    .collect(Collectors.joining("\n"));
			
			// Tạo List tách ra thông tin theo từng ngày
			List<String> scheduleSpiltDay = Arrays.asList(listAsString.split("/"));
			return scheduleSpiltDay;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();

		}
		return null;
	}
	

	//select
	public List<Tour> getAllTours() {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query<Tour> query=session.createQuery("from Tour");
			List<Tour> tourList = query.getResultList();
			
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		
		return null;
	}
	
	public List<Tour> getTop3Tours(){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour order by rating desc";
			Query<Tour> query = session.createQuery(hql).setMaxResults(3);
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	public List<Tour> getTourByTypologyID(int id){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where typologyID = :searchKey";
			Query<Tour> query = session.createQuery(hql).setParameter("searchKey", id);
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	public List<Tour> getTourByNationID(int id){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where nationID = :searchKey";
			Query<Tour> query = session.createQuery(hql).setParameter("searchKey", id);
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	public List<Tour> getTourByContinentID(int id){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where nation.continent.continentID = :searchKey";
			Query<Tour> query = session.createQuery(hql).setParameter("searchKey", id);
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	public List<Tour> getRelatedTour(int typologyID, int nationID, int id ){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where typologyID = " + typologyID + "and nationID= " + nationID + " and tourID != " + id;
			Query<Tour> query = session.createQuery(hql).setMaxResults(3);
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	//Search
	public List<Tour> findTour(String tourName){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where tourName like: searchKey";
			Query<Tour> query = session.createQuery(hql).setParameter("searchKey", "%" + tourName + "%");
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	public List<Tour> findTourWithPrice(float price){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where price <= " + price;
			Query<Tour> query = session.createQuery(hql);
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	public List<Tour> findTourWithBoth(String tourName, float price){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			String hql = "from Tour where tourName like: searchKey and price <= " + price;
			Query<Tour> query = session.createQuery(hql).setParameter("searchKey", "%" + tourName + "%");
			List<Tour> tourList = query.getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}
	
	
	//insert
	public void addTour(Tour tour) {
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			session.save(tour);
			tx.commit();
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
		TourDAO tourDAO= new TourDAO();
		tourDAO.getAllTours();
		int id = 4;
		String tourName = "Ha";
		float price = 200;
		int typologyID = 4;
		int nationID = 1;
		
		List<Tour> list = tourDAO.getTourByContinentID(1);
		System.out.println(list);
	}
}
