package com.zhy.dao;

import com.zhy.beans.Admin;

public interface AdminDao {

	/**
	 * 根据用户名获取Admin
	 */
	public Admin getAdminByUsername(String username) ;
	
	/**
	 * 修改密码
	 */
	public void updatePassword(Admin admin);


}
