package com.zhy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.Book;
import com.zhy.beans.ShoppingCart;
import com.zhy.factory.DaoFactory;

@WebServlet("/CartServlet")
public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 添加购物 条目
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 * @throws NumberFormatException
	 */
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		/*
		 * 1.得到session中的车（只有登陆的用户才有车） 2.得到购买的图书和数量 3.创建条目（条目包含图书和数量属性），并对条目设置图书和购买数
		 * 4.添加条目到车中
		 */
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
		// 得到条目，先得到图书的id,通过id查询数据库，得到book
		String id = request.getParameter("id");

		Book book = DaoFactory.getBookDao().getBookById(Integer.parseInt(id));
		PrintWriter out = response.getWriter();
		
		shoppingCart.add(book);
		request.getSession().setAttribute("shoppingCart", shoppingCart);
		response.sendRedirect(request.getHeader("Referer"));

	}

	/**
	 * 删除购物条目
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.得到车 2.得到要清空的条目ID 3.根据ID删除条目
		 */
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
		String id = request.getParameter("id");
		shoppingCart.delete(Integer.parseInt(id));
		request.getSession().removeAttribute("message1");
		response.sendRedirect(request.getContextPath() + "/cart.jsp");
	}

	/**
	 * 清空购物条目
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public void clear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.得到车 2.清空车
		 */
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
		shoppingCart.clear();
		response.sendRedirect(request.getContextPath() + "/cart.jsp");
	}
	
	/**
	 * 修改购买数量
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1.得到要修改的条目的ID和需要修改的数量
		 * 2.得到购物车
		 * 3.调用购物车的update()方法修改
		 */
		String id = request.getParameter("id");
		String quantity = request.getParameter("quantity");
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("shoppingCart");
		shoppingCart.update(Integer.parseInt(id), Integer.parseInt(quantity));
		response.sendRedirect(request.getContextPath() + "/cart.jsp");
	}
}
