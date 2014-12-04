package com.uic.util;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


final public class HibernateUtil {
	private static SessionFactory sessionFactory = null;
	// 使用线程局部模式
	private static ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();

	private HibernateUtil() {
	};

	static {
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}

	// 获取全新的全新的sesession
	public static Session openSession() {
		return sessionFactory.openSession();
	}

	// 获取和线程关联的session
	public static Session getCurrentSession() {
		Session session = threadLocal.get();
		// 判断是否得到
		if (session == null) {
			session = sessionFactory.openSession();
			// 把session对象设置到 threadLocal,相当于该session已经和线程绑定
			threadLocal.set(session);
		}
		return session;
	}
	public static Object refreshObj(Object obj){
		Session session=getCurrentSession();
		session.refresh(obj);
		return obj;
	}
	public static void closeCurrentSession() {
		Session session = getCurrentSession();
		if (session != null && session.isOpen()) {
			session.close();
			threadLocal.set(null);
		}
	}

	// 这里提供一个根据id返回对象的方法
	public static Object findById(@SuppressWarnings("rawtypes") Class clazz,
			java.io.Serializable id) {
		Session s = null;
		Transaction tx = null;
		Object obj = null;
		try {
			s = openSession();
			tx = s.beginTransaction();
			obj = s.load(clazz, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
			// TODO: handle exception
		} finally {
			if (s != null && s.isOpen()) {
				s.close();
			}
		}
		return obj;
	}

	// 这里提供一个根据id返回对象的方法
	// OpenSessionInView
	public static Object findByIdOpenInView(
			@SuppressWarnings("rawtypes") Class clazz, java.io.Serializable id) {
		Session s = getCurrentSession();
		Object obj = null;
		obj = s.load(clazz, id);
		return obj;
	}

	// 统一的一个修改和删除(批量 hql) hql"delete update ...??"
	public static void executeUpdate(String hql, String[] parameters) {

		Session s = null;
		Transaction tx = null;

		try {
			s = openSession();

			tx = s.beginTransaction();
			Query query = s.createQuery(hql);
			// 先判断是否有参数要绑定
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setString(i, parameters[i]);
				}
			}
			query.executeUpdate();
			s.flush();
			s.clear();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
			// TODO: handle exception
		} finally {
			if (s != null && s.isOpen()) {
				s.close();
			}

		}

	}

	// 统一的一个修改和删除(批量 hql) hql"delete update ...??"
	// OpenSessionInView
	public static void executeUpdateOpenInView(String hql, String[] parameters) {
		Session s = getCurrentSession();
		Query query = s.createQuery(hql);
		// 先判断是否有参数要绑定
		if (parameters != null && parameters.length > 0) {
			for (int i = 0; i < parameters.length; i++) {
				query.setString(i, parameters[i]);
			}
		}
		// System.out.println("query+++++++++++++++++++++++++++++++"+query.toString());
		query.executeUpdate();
		s.flush();
	}

	// 统一的添加的方法
	public static void save(Object obj) {
		Session s = null;
		Transaction tx = null;
		try {
			s = openSession();
			tx = s.beginTransaction();
			s.save(obj);
			s.flush();
			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			throw new RuntimeException(e.getMessage());
			// TODO: handle exception
		} finally {
			if (s != null && s.isOpen()) {
				s.close();
			}
		}
	}

	// 统一的添加的方法
	// OpenSessionInView
	public static void saveOpenInView(Object obj) {
		Session s = getCurrentSession();
		s.save(obj);
		s.flush();
	}

	// 提供一个统一的查询方法(带分页) hql 形式 from 类 where 条件=? ..
	@SuppressWarnings("rawtypes")
	public static List executeQueryByPage(String hql, String[] parameters,
			int pageSize, int pageNow) {
		Session s = null;
		List list = null;

		try {
			s = openSession();
			Query query = s.createQuery(hql);
			// 先判断是否有参数要绑定
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setString(i, parameters[i]);
				}
			}
			query.setFirstResult((pageNow - 1) * pageSize).setMaxResults(
					pageSize);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
			// TODO: handle exception
		} finally {

			if (s != null && s.isOpen()) {
				s.close();
			}

		}
		return list;
	}

	// 提供一个统一的查询方法(带分页) hql 形式 from 类 where 条件=? ..
	// OpenSessionInView
	@SuppressWarnings("rawtypes")
	public static List executeQueryByPageOpenInView(String hql,
			String[] parameters, int pageSize, int pageNow) {
		Session s = getCurrentSession();
		List list = null;

		Query query = s.createQuery(hql);
		// 先判断是否有参数要绑定
		if (parameters != null && parameters.length > 0) {
			for (int i = 0; i < parameters.length; i++) {
				query.setString(i, parameters[i]);
			}
		}
		query.setFirstResult((pageNow - 1) * pageSize).setMaxResults(pageSize);
		list = query.list();
		return list;
	}

	// 提供一个统一的查询方法 hql 形式 from 类 where 条件=? ..
	@SuppressWarnings("rawtypes")
	public static List executeQuery(String hql, String[] parameters) {
		Session s = null;
		List list = null;
		try {
			s = openSession();
			Query query = s.createQuery(hql);
			// 先判断是否有参数要绑定
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setString(i, parameters[i]);
				}
			}
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
			// TODO: handle exception
		} finally {

			if (s != null && s.isOpen()) {
				s.close();
			}

		}
		return list;
	}

	// 提供一个统一的查询方法 hql 形式 from 类 where 条件=? ..
	// OpenSessionInView
	@SuppressWarnings("rawtypes")
	public static List executeQueryOpenInView(String hql, String[] parameters) {
		Session s = getCurrentSession();
		List list = null;
		Query query = s.createQuery(hql);
		// 先判断是否有参数要绑定
		if (parameters != null && parameters.length > 0) {
			for (int i = 0; i < parameters.length; i++) {
				query.setString(i, parameters[i]);
			}
		}
		list = query.list();
		return list;
	}

	// 提供一个统一查询方法，但是我们知道总是返回一个对象
	public static Object uniqueQuery(String hql, String[] parameters) {

		Session s = null;
		Object obj = null;

		try {
			s = openSession();
			Query query = s.createQuery(hql);
			// 先判断是否有参数要绑定
			if (parameters != null && parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setString(i, parameters[i]);
				}
			}
			obj = query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
			// TODO: handle exception
		} finally {

			if (s != null && s.isOpen()) {
				s.close();
			}

		}
		return obj;
	}

	// 提供一个统一查询方法，但是我们知道总是返回一个对象
	// OpenSessionInView
	public static Object uniqueQueryOpenInView(String hql, String[] parameters) {

		Session s = getCurrentSession();
		s.flush();
		Object obj = null;
		Query query = s.createQuery(hql);
		// 先判断是否有参数要绑定
		if (parameters != null && parameters.length > 0) {
			for (int i = 0; i < parameters.length; i++) {
				query.setString(i, parameters[i]);
			}
		}
		obj = query.uniqueResult();

		return obj;
	}

}
