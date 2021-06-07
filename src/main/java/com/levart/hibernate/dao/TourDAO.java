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
	
	//Trích lấy schedule trong db
//	public ArrayList<List<String>> getTourSchedule(int id){
//		Session session = factory.openSession();
//		List<Tour> scheduleList = new ArrayList<Tour>();
//		try {
//			// bắt đầu 1 transaction (giao dịch)
//			Transaction tx = session.beginTransaction();
//			// thực thi câu query dạng hql
//			@SuppressWarnings("unchecked")
//			Query query =session.createQuery("select schedule from Tour where tourID ='"  + id +"'");
//			List<String> list = (List<String>) query.list();
//			String listAsString = list.stream()
//                    .map(Object::toString)
//                    .collect(Collectors.joining("\n"));
//			
//			// Tạo List tách ra thông tin theo từng ngày
//			List<String> scheduleSpiltDay = Arrays.asList(listAsString.split("/"));
//			
//			ArrayList<List<String>> daySpilt = new ArrayList<List<String>>();
//			
//			for (String str: scheduleSpiltDay) {
//				List<String> dailyschedule = Arrays.asList(str.split("\n"));
//				daySpilt.add(dailyschedule.subList(0, dailyschedule.size()));
//			}
//			return daySpilt;
//		} catch (RuntimeException e) {
//			session.getTransaction().rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//
//		}
//		return null;
//	}

	
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
		int id = 1;
		//List<List<String>> list = tourDAO.getTourSchedule(id);
		//System.out.println(list);
		List<Tour> list = tourDAO.getTour(id);
		System.out.println(list);
		
	}
}
