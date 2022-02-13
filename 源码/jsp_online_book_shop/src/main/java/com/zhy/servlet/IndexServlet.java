package com.zhy.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.Book;
import com.zhy.beans.Category;
import com.zhy.beans.ShoppingCart;
import com.zhy.factory.DaoFactory;

@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Book> books = DaoFactory.getBookDao().getAllBooks();
		request.setAttribute("books", books);

		List<Category> categories = DaoFactory.getCategoryDao().getAllCategory();
		request.setAttribute("categories", categories);
		if (request.getSession().getAttribute("shoppingCart") == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			request.getSession().setAttribute("shoppingCart", shoppingCart);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
