package com.levart.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.levart.entities.Image;
import com.levart.hibernate.utils.HibernateUtils;

public class ImageDAO {
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public ImageDAO() {
	}
	
	@SuppressWarnings("unchecked")
	public List<Image> getCoverImage(int id){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			session.beginTransaction();
			// thực thi câu query dạng hql
			Query<Image> query =session.createQuery("from Image where tourID ="+ id +" and imageRole = 0");
			List<Image> list = query.list();
			return list;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	public List<Image> getGalleryImages(int id){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			session.beginTransaction();
			// thực thi câu query dạng hql
			@SuppressWarnings("unchecked")
			Query<Image> query =session.createQuery("from Image where tourID ="+ id +" and imageRole = 1");
			List<Image> list = query.list();
			return list;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
		
}
