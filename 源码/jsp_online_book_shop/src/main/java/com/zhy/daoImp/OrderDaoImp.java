package com.zhy.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zhy.beans.CartItem;
import com.zhy.beans.Order;
import com.zhy.beans.ShoppingCart;
import com.zhy.dao.OrderDao;
import com.zhy.tools.DBUtil;

public class OrderDaoImp implements OrderDao {

	@Override
	public List<Order> getOrdersByUsername(String username) throws Exception {
		Order order = null;
		List<Order> orders = new ArrayList<>();
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from orders where user ='" + username + "'";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			order = new Order(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3), resultSet.getInt(4),
					resultSet.getInt(5), resultSet.getString(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9),resultSet.getString(10),resultSet.getString(11),resultSet.getInt(12));
			orders.add(order);
		}
		try {
			DBUtil.close(resultSet, preparedStatement, connection);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public void updateOrderStatus(Integer id,int status) throws Exception {

		PreparedStatement prep = null;
		Connection conn = null;
		String url = "update orders set status = ? where id =?";
		try {
			conn = DBUtil.getConnection();
			prep = conn.prepareStatement(url);
			prep.setInt(1, status);
			prep.setInt(2, id);
			prep.executeUpdate();
		} finally {
			DBUtil.close(prep, conn);
		}
	}

	@Override
	public void add(ShoppingCart shoppingCart, String user,String shou,String address,String info,String phone) throws Exception {
		List<Order> orders = new ArrayList<>();
		Order order = null;
		for (CartItem cartItem : shoppingCart.getCartItems()) {
			order = new Order(cartItem.getBook().getName(), cartItem.getBook().getPrice(), cartItem.getQuantity(),
					(int) cartItem.getSubtotalPrice(), user, cartItem.getBook().getId(), shou, address, info, phone,0);
			orders.add(order);
		}
		String sql = null;
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = null;
		for (Order order2 : orders) {
			sql = "insert orders (name, price, quantity, total, user, bookid,shou,address,info,phone,status)" + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, order2.getName());
			preparedStatement.setInt(2, order2.getPrice());
			preparedStatement.setInt(3, order2.getQuantity());
			preparedStatement.setInt(4, order2.getTotal());
			preparedStatement.setString(5, order2.getUser());
			preparedStatement.setInt(6, order2.getBookid());
			preparedStatement.setString(7, order2.getShou());
			preparedStatement.setString(8, order2.getAddress());
			preparedStatement.setString(9, order2.getInfo());
			preparedStatement.setString(10, order2.getPhone());
			preparedStatement.setInt(11, order2.getStatus());

			preparedStatement.execute();
		}

		DBUtil.close(preparedStatement, connection);

	}
	@Override
	public List<Order> getAllOrders() throws Exception {
		Order order = null;
		List<Order> orders = new ArrayList<>();
		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from orders";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			order = new Order(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3), resultSet.getInt(4),
					resultSet.getInt(5), resultSet.getString(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9),resultSet.getString(10),resultSet.getString(11),resultSet.getInt(12));
			orders.add(order);
		}
		try {
			DBUtil.close(resultSet, preparedStatement, connection);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	public static void main(String[] args) throws Exception {
		OrderDao orderDao = new OrderDaoImp();
		System.out.println(orderDao.getOrdersByUsername("1@qq.com"));
	}

	@Override
	public void deleteOrders(int id) {
		PreparedStatement prep = null;
		Connection conn = null;
		String url = "delete from orders  where id=?";
		try {
			conn = DBUtil.getConnection();
			prep = conn.prepareStatement(url);
			prep.setInt(1, id);
			prep.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(prep, conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}
