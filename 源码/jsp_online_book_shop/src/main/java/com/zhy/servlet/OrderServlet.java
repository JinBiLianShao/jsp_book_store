package com.zhy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.Book;
import com.zhy.beans.CartItem;
import com.zhy.beans.ShoppingCart;
import com.zhy.beans.User;
import com.zhy.factory.DaoFactory;

@WebServlet("/OrderServlet")
public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		User user = (User) request.getSession().getAttribute("user");
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
		List<CartItem> items = new ArrayList<CartItem> (shoppingCart.getCartItems());
		String shou = null;
		String address = null;
		String info = null;
		String phone = null;
		shou = request.getParameter("shou");
		address = request.getParameter("address");
		info = request.getParameter("info");
		phone = request.getParameter("phone");
		for (CartItem item : items) {
			int stock = item.getBook().getStock() - item.getQuantity();
			Book book = item.getBook();
			book.setStock(stock);
			DaoFactory.getBookDao().updateBook(book);
		}

		try {
			DaoFactory.getOrderDao().add(shoppingCart, user.getUsername(),shou,address,info,phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
		shoppingCart.clear();
		response.sendRedirect(request.getContextPath() + "/buySuccess.jsp");

	}
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		int id =  Integer.parseInt(request.getParameter("id"));
		DaoFactory.getOrderDao().deleteOrders(id);
		try {
			response.sendRedirect(request.getHeader("Referer"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}
	}
	public void fahuo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		int id =  Integer.parseInt(request.getParameter("id"));
		try {
			DaoFactory.getOrderDao().updateOrderStatus(id,1);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.sendRedirect(request.getHeader("Referer"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}
	}
	public void shouhuo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		int id =  Integer.parseInt(request.getParameter("id"));
		try {
			DaoFactory.getOrderDao().updateOrderStatus(id,2);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.sendRedirect(request.getHeader("Referer"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}
	}
}
