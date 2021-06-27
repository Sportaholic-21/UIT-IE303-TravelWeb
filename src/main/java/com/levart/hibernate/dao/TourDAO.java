package com.levart.hibernate.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.levart.entities.Tour;
import com.levart.hibernate.utils.HibernateUtils;

public class TourDAO {
	
	static SessionFactory factory = HibernateUtils.getSessionFactory();

	public TourDAO() {
	}
	
	public List<Tour> getTour(int id) {
		Session session = factory.openSession();
		List<Tour> tourList = new ArrayList<Tour>();
		try {
			// bắt đầu 1 transaction (giao dịch)
			session.beginTransaction();
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
		// --- Trường hợp dùng cho thanh search của home và tour-detail
	
		// --- Trường hợp sử dụng criteria trong trang tour-list // 
	public List<Tour> findTourWithCriteria(String tourName, float price ,String continentName, String nationName, String typologyName){
		Session session = factory.openSession();
		try {
			// bắt đầu 1 transaction (giao dịch)
			Transaction tx = session.beginTransaction();
			// thực thi câu query dạng hql
			// -- Tạo criteria builder
			CriteriaBuilder builder = session.getCriteriaBuilder();
			CriteriaQuery<Tour> criteria = builder.createQuery(Tour.class);
			Root<Tour> tourRoot = criteria.from(Tour.class);
			criteria.select(tourRoot);
			
			// -- Thêm các mệnh đề where
				// -- Lấy điều kiện tìm kiếm theo tourName
			Predicate searchWithTourName = builder.like(tourRoot.<String>get("tourName"), "%" + tourName + "%");
				// -- Lấy điều kiện tìm theo max price
			Predicate searchWithPrice = builder.lessThanOrEqualTo(tourRoot.get("price"), price);
				// -- Lấy điều kiện tìm kiếm theo nationName
			Predicate searchWithNation = builder.equal(tourRoot.get("nation").get("nationName"), nationName); 
				// -- Lấy điều kiện tìm kiếm theo contininentName
			Predicate searchWithContinent = builder.equal(tourRoot.get("nation").get("continent").get("continentName"), continentName); 
				// -- Lấy theo điều kiện typologyID
			Predicate searchWithTypology = builder.equal(tourRoot.get("typology").get("typologyName"), typologyName);
			
			// -- Xét các điều kiện
			// Trường hợp tìm kiếm chưa để tâm đến giá tiền
			if(price == 0){
				// *** Trường hợp có nhập tourName
				if(tourName != "") {
					//	* Trường hợp cả continent và nation và typology đều có giá trị
					if(continentName != "" && nationName != "" && typologyName != ""){
						Predicate NameContinentNationTypology = builder.and(searchWithTourName, searchWithNation, searchWithContinent, searchWithTypology);
						criteria.where(NameContinentNationTypology);
					}
					//	* Trường hợp continent, typology và nation khuyết 1 giá trị
						// -- khuyết nation có typology có continent
					else if (continentName != "" && typologyName != "" && nationName == ""){
						Predicate NameTypologyContinent = builder.and(searchWithTourName, searchWithTypology, searchWithContinent);
						criteria.where(NameTypologyContinent);
					}
						// -- khuyết continent có typology có nation
					else if (continentName == "" && typologyName != "" && nationName != ""){
						Predicate NameTypologyNation = builder.and(searchWithTourName, searchWithTypology ,searchWithNation);
						criteria.where(NameTypologyNation);
					}
						// -- khuyết Typology có continent và nation
					else if(continentName != "" && typologyName == "" && nationName != "") {
						Predicate NameContinentNation = builder.and(searchWithTourName, searchWithContinent ,searchWithNation);
						criteria.where(NameContinentNation);
					}
					//	* Trường hợp continent, typology và nation khuyết 2 giá trị
						// -- không có cả nation và continent nhưng có typology
					else if (continentName == "" && nationName == "" && typologyName != ""){
						Predicate NameTypology = builder.and(searchWithTourName, searchWithTypology);
						criteria.where(NameTypology);
					}
						// -- không có cả nation và typology nhưng có continent
					else if (continentName != "" && nationName == "" && typologyName == ""){
						Predicate NameContinent = builder.and(searchWithTourName, searchWithContinent);
						criteria.where(NameContinent);
					}
						// -- không có cả continent và typology nhưng có nation
					else if (continentName == "" && typologyName == "" && nationName != ""){
						Predicate NameNation = builder.and(searchWithTourName, searchWithNation);
						criteria.where(NameNation);
					}
					// * Trường hợp không có cả 3 giá trị continent, nation và typology
					else if (continentName == "" && typologyName == "" && nationName == ""){
						Predicate Name = builder.and(searchWithTourName);
						criteria.where(Name);
					}
				}
				//Trường hợp không nhập tourName
				else if (tourName == "") {
					//	* Trường hợp cả continent và nation và typology đều có giá trị
					if(continentName != "" && nationName != "" && typologyName != ""){
						Predicate ContinentNationTypology = builder.and(searchWithNation, searchWithContinent, searchWithTypology);
						criteria.where(ContinentNationTypology);
					}
					//	* Trường hợp continent, typology và nation khuyết 1 giá trị
						// -- khuyết nation có typology có continent
					else if (continentName != "" && typologyName != "" && nationName == ""){
						Predicate TypologyContinent = builder.and(searchWithTypology, searchWithContinent);
						criteria.where(TypologyContinent);
					}
						// -- khuyết continent có typology có nation
					else if (continentName == "" && typologyName != "" && nationName != ""){
						Predicate TypologyNation = builder.and(searchWithTypology ,searchWithNation);
						criteria.where(TypologyNation);
					}
						// -- khuyết Typology có continent và nation
					else if(continentName != "" && typologyName == "" && nationName != "") {
						Predicate ContinentNation = builder.and(searchWithContinent ,searchWithNation);
						criteria.where(ContinentNation);
					}
					//	* Trường hợp continent, typology và nation khuyết 2 giá trị
						// -- không có cả nation và continent nhưng có typology
					else if (continentName == "" && nationName == "" && typologyName != ""){
						Predicate Typology = builder.and(searchWithTypology);
						criteria.where(Typology);
					}
						// -- không có cả nation và typology nhưng có continent
					else if (continentName != "" && nationName == "" && typologyName == ""){
						Predicate Continent = builder.and(searchWithContinent);
						criteria.where(Continent);
					}
						// -- không có cả continent và typology nhưng có nation
					else if (continentName == "" && typologyName == "" && nationName != ""){
						Predicate Nation = builder.and(searchWithNation);
						criteria.where(Nation);
					}
				}
			}
			//Trường hợp để tâm đến giá tiền
			else if (price != 0) {
				// *** Trường hợp có nhập tourName
				if(tourName != "") {
					//	* Trường hợp cả continent và nation và typology đều có giá trị
					if(continentName != "" && nationName != "" && typologyName != ""){
						Predicate PriceNameContinentNationTypology = builder.and(searchWithPrice, searchWithTourName, searchWithNation, searchWithContinent, searchWithTypology);
						criteria.where(PriceNameContinentNationTypology);
					}
					//	* Trường hợp continent, typology và nation khuyết 1 giá trị
						// -- khuyết nation có typology có continent
					else if (continentName != "" && typologyName != "" && nationName == ""){
						Predicate PriceNameTypologyContinent = builder.and(searchWithPrice ,searchWithTourName, searchWithTypology, searchWithContinent);
						criteria.where(PriceNameTypologyContinent);
					}
						// -- khuyết continent có typology có nation
					else if (continentName == "" && typologyName != "" && nationName != ""){
						Predicate PriceNameTypologyNation = builder.and(searchWithPrice, searchWithTourName, searchWithTypology ,searchWithNation);
						criteria.where(PriceNameTypologyNation);
					}
						// -- khuyết Typology có continent và nation
					else if(continentName != "" && typologyName == "" && nationName != "") {
						Predicate PriceNameContinentNation = builder.and(searchWithPrice, searchWithTourName, searchWithContinent ,searchWithNation);
						criteria.where(PriceNameContinentNation);
					}
					//	* Trường hợp continent, typology và nation khuyết 2 giá trị
						// -- không có cả nation và continent nhưng có typology
					else if (continentName == "" && nationName == "" && typologyName != ""){
						Predicate PriceNameTypology = builder.and(searchWithPrice, searchWithTourName, searchWithTypology);
						criteria.where(PriceNameTypology);
					}
						// -- không có cả nation và typology nhưng có continent
					else if (continentName != "" && nationName == "" && typologyName == ""){
						Predicate PriceNameContinent = builder.and(searchWithPrice, searchWithTourName, searchWithContinent);
						criteria.where(PriceNameContinent);
					}
						// -- không có cả continent và typology nhưng có nation
					else if (continentName == "" && typologyName == "" && nationName != ""){
						Predicate PriceNameNation = builder.and(searchWithPrice, searchWithTourName, searchWithNation);
						criteria.where(PriceNameNation);
					}
					// * Trường hợp không có cả 3 giá trị continent, nation và typology
					else if (continentName == "" && typologyName == "" && nationName == ""){
						Predicate PriceName = builder.and(searchWithPrice, searchWithTourName);
						criteria.where(PriceName);
					}
				}
				//Trường hợp không nhập tourName
				else if (tourName == "") {
					//	* Trường hợp cả continent và nation và typology đều có giá trị
					if(continentName != "" && nationName != "" && typologyName != ""){
						Predicate PriceContinentNationTypology = builder.and(searchWithPrice, searchWithNation, searchWithContinent, searchWithTypology);
						criteria.where(PriceContinentNationTypology);
					}
					//	* Trường hợp continent, typology và nation khuyết 1 giá trị
						// -- khuyết nation có typology có continent
					else if (continentName != "" && typologyName != "" && nationName == ""){
						Predicate PriceTypologyContinent = builder.and(searchWithPrice, searchWithTypology, searchWithContinent);
						criteria.where(PriceTypologyContinent);
					}
						// -- khuyết continent có typology có nation
					else if (continentName == "" && typologyName != "" && nationName != ""){
						Predicate PriceTypologyNation = builder.and(searchWithPrice, searchWithTypology ,searchWithNation);
						criteria.where(PriceTypologyNation);
					}
						// -- khuyết Typology có continent và nation
					else if(continentName != "" && typologyName == "" && nationName != "") {
						Predicate PriceContinentNation = builder.and(searchWithPrice, searchWithContinent ,searchWithNation);
						criteria.where(PriceContinentNation);
					}
					//	* Trường hợp continent, typology và nation khuyết 2 giá trị
						// -- không có cả nation và continent nhưng có typology
					else if (continentName == "" && nationName == "" && typologyName != ""){
						Predicate PriceTypology = builder.and(searchWithPrice, searchWithTypology);
						criteria.where(PriceTypology);
					}
						// -- không có cả nation và typology nhưng có continent
					else if (continentName != "" && nationName == "" && typologyName == ""){
						Predicate PriceContinent = builder.and(searchWithPrice, searchWithContinent);
						criteria.where(PriceContinent);
					}
						// -- không có cả continent và typology nhưng có nation
					else if (continentName == "" && typologyName == "" && nationName != ""){
						Predicate PriceNation = builder.and(searchWithPrice, searchWithNation);
						criteria.where(PriceNation);
					}
					//	* Trường hợp không có cả continent, typology và nation
					else if (continentName == "" && typologyName == "" && nationName == ""){
						Predicate Price = builder.and(searchWithPrice);
						criteria.where(Price);
					}
				}
			}
			// -- Thêm kết quả vào tourList
			List<Tour> tourList = session.createQuery(criteria).getResultList();
			return tourList;
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
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
		String tourName = "Ninh";
		float price = 330;
		int typologyID = 1;
		int nationID = 1;
		String nation = "Viet Nam";
		String continent = "Asia";
		String typologyName = "Relax";
//		List<Tour> list = tourDAO.findTourWithDestination(tourName);
//		System.out.println(list);
	}
}
