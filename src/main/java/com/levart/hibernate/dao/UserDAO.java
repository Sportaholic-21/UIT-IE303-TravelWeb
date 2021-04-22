package com.levart.hibernate.dao;

import org.hibernate.SessionFactory;
import com.levart.hibernate.utils.HibernateUtils;

public class UserDAO {
	SessionFactory factory=HibernateUtils.getSessionFactory();
	
}
