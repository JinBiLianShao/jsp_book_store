package com.zhy.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.Book;
import com.zhy.factory.DaoFactory;
import com.zhy.tools.EncodeUtil;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//1.对请求进行编码处理
		EncodeUtil.encode(request);
		//2.获取搜索内容
		String searchName = request.getParameter("search");
		if (searchName == "") {
			request.getRequestDispatcher("/search.jsp").forward(request, response);
			return;
		}
		//3.利用DaoFactory得到BookDao调用（根据书名模糊查询书籍）方法
		List<Book> books  = DaoFactory.getBookDao().getBooksByName(searchName);
		//4.将搜索到的内容放入请求域中
		request.setAttribute("searchName", books);
		//5.请求转发
		request.getRequestDispatcher("/search.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
