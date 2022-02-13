package com.zhy.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zhy.beans.User;
import com.zhy.dao.UserDao;
import com.zhy.factory.DaoFactory;
import com.zhy.tools.DBUtil;

public class UserDaoImp implements UserDao {

	@Override
	public void addUser(User user) throws Exception {
		String sql = "insert user (username, password, nickname)" + "value(?, ?, ?)";
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		String username = user.getUsername();
		String password = user.getPassword();
		String nickname = user.getNickname();
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, password);
		preparedStatement.setString(3, nickname);
		preparedStatement.execute();
		DBUtil.close(preparedStatement, connection);

	}

	@Override
	public User getUserByUsername(String username) throws SQLException {
		User user = null;

		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from user where username='" + username + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			user = new User(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
					resultSet.getString(4));
		}
		try {
			DBUtil.close(resultSet, preparedStatement, connection);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();
		User user = null;
		String sql = "select * from user";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				user = new User(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getString(4));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return users;

	}

	@Override
	public void updateUser(User u) throws Exception {
		PreparedStatement prep = null;
		Connection conn = null;
		String url = "update user set username=?,nickname=?,password=? where id=?";
		try {
			conn = DBUtil.getConnection();
			prep = conn.prepareStatement(url);
			prep.setString(1, u.getUsername());
			prep.setString(2, u.getNickname());
			prep.setString(3, u.getPassword());
			prep.setInt(4, u.getId());

			prep.executeUpdate();
		} finally {
			DBUtil.close(prep, conn);
		}
	}

	public static void main(String[] args) throws Exception {
		String pString= DaoFactory.getUserDAO().getUserById(27).getPassword();
		System.out.println(pString);
	}

	@Override
	public void deleteUser(int id) throws Exception {
		PreparedStatement prep = null;
		Connection conn = null;
		String url = "delete from user  where id=?";
		try {
			conn = DBUtil.getConnection();
			prep = conn.prepareStatement(url);
			prep.setInt(1, id);

			prep.executeUpdate();
		} finally {
			DBUtil.close(prep, conn);
		}

	}

	@Override
	public User getUserById(int id) throws SQLException {
		User user = null;

		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from user where id='" + id + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			user = new User(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
					resultSet.getString(4));
		}
		try {
			DBUtil.close(resultSet, preparedStatement, connection);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

}
