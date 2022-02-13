package com.zhy.dao;

import java.sql.SQLException;
import java.util.List;

import com.zhy.beans.User;

public interface UserDao {
	
	/**
	 * 添加新用户
	 * @param user
	 * @throws SQLException 
	 * @throws Exception 
	 */
	public void addUser(User user) throws SQLException, Exception;
	
	/**
	 * 通过username获取User
	 * @param username
	 * @return
	 * @throws SQLException 
	 */
	public User getUserByUsername(String username) throws SQLException;
	
	/**
	 * 通过id获取User
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public User getUserById(int id) throws SQLException;
	
	/**
	 * 获取所有用户
	 * @return
	 */
	public List<User> getAllUsers() ;
	
	/**
	 * 更新用户信息
	 * @return
	 */

	public void updateUser(User user) throws Exception;
	
	/**
	 * 删除某一个用户
	 * @throws Exception 
	 */
	public void deleteUser(int id) throws Exception;

}
