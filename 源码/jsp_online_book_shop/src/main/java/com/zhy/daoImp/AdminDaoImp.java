package com.zhy.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zhy.beans.Admin;
import com.zhy.dao.AdminDao;
import com.zhy.factory.DaoFactory;
import com.zhy.tools.DBUtil;
import com.zhy.tools.Md5Code;

public class AdminDaoImp implements AdminDao {

	@Override
	public Admin getAdminByUsername(String username) {
		Admin admin = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "SELECT * from admin where username='" + username + "'";

			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				admin = new Admin(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return admin;
	}

	@Override
	public void updatePassword(Admin admin) {
		String sql = "update admin set  password = ? where id = ?";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, admin.getPassword());
			preparedStatement.setInt(2, admin.getId());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
	}
	
	public static void main(String[] args) throws Exception {
		Admin admin = DaoFactory.getAdminDao().getAdminByUsername("admin");
		System.out.println(admin.getId() + ":" + admin.getUsername());
		admin.setPassword("admin");
		DaoFactory.getAdminDao().updatePassword(admin);
		System.out.println(Md5Code.createMd5Code("admin"));
	}

}
