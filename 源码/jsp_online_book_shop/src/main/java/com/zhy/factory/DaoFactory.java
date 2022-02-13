package com.zhy.factory;

import com.zhy.dao.AdminDao;
import com.zhy.dao.BookDao;
import com.zhy.dao.CategoryDao;
import com.zhy.dao.OrderDao;
import com.zhy.dao.UserDao;
import com.zhy.daoImp.AdminDaoImp;
import com.zhy.daoImp.BookDaoImp;
import com.zhy.daoImp.CategoryDaoImp;
import com.zhy.daoImp.OrderDaoImp;
import com.zhy.daoImp.UserDaoImp;

public class DaoFactory {
	/**
	 * 获取UserDao
	 * 
	 * @return
	 */
	public static UserDao getUserDAO() {
		return new UserDaoImp();
	}

	/**
	 * 获取BookDao
	 * @return
	 */
	public static BookDao getBookDao() {
		return new BookDaoImp();
	}
	
	/**
	 * 获取CategoryDao
	 * @return
	 */
	public static CategoryDao getCategoryDao() {
		return new CategoryDaoImp();
	}
	
	/**
	 * 获取订单 orderDao
	 * @return
	 */
	public static OrderDao getOrderDao() {
		return new OrderDaoImp();
	}
	
	/**
	 * 获取AdminDao
	 * @return
	 */
	public static AdminDao getAdminDao() {
		return new AdminDaoImp();
	}

}
