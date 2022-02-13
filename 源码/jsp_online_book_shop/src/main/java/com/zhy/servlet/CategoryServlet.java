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
import com.zhy.beans.Category;
import com.zhy.dao.CategoryDao;
import com.zhy.factory.DaoFactory;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void get(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		/*
		 * 1.获取到分类名 2.查询到该分类下所有图书 3.将所有图书放入books集合 4.将books集合放入request的属性
		 * 5.重定向到显示该分类所有图书的页面
		 */
		int size = 9;
		int page = 1;
		String categoryId = request.getParameter("id");
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		List<Book> books = new ArrayList<>();
		books = DaoFactory.getCategoryDao().getBooksByCategoryId(Integer.parseInt(categoryId));
		int pagesize = getPageSize(books, size);
		books = getList(books, page, size);
		if(page<=0) {
			page = 1;
		}
		if(page>=pagesize) {
			page = pagesize;
		}
		request.setAttribute("category", books);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("nowpage", page);
		request.setAttribute("cateid", categoryId);
		request.getRequestDispatcher("/shop.jsp").forward(request, response);

	}
	
	public void getAllbooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		/*
		 * 1.获取到分类名 2.查询到该分类下所有图书 3.将所有图书放入books集合 4.将books集合放入request的属性
		 * 5.重定向到显示该分类所有图书的页面
		 */
		int size = 8;
		int page = 1;
 		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		List<Book> books = new ArrayList<>();
		books = DaoFactory.getBookDao().getAllBooks();
		int pagesize = getPageSize(books, size);
		books = getList(books, page, size);
		if(page<=0) {
			page = 1;
		}
		if(page>=pagesize) {
			page = pagesize;
		}
		request.setAttribute("category", books);
		request.setAttribute("pagesize", pagesize);
		request.setAttribute("nowpage", page);
 		request.getRequestDispatcher("/allbooks.jsp").forward(request, response);

	}
	
	static List<Book> getList(List<Book> list,int page,int size){
		int end = 0;
		int pages = list.size()/size + 1;
		if(page>pages) {
			page = pages - 1;
		}
		if(page < 1) {
			page = 1;
		}
		if(page*size>list.size()) {
			end = list.size();
		}else {
			end = page*size;
		}
		
		return list.subList((page-1)*size, end);
	}
	
	static int getPageSize(List<Book> list,int size) {
		if(list.size() % size == 0) {
			return list.size()/size;
		}else {
			return list.size()/size + 1;
		}
	 
	}

	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException {
		String name = request.getParameter("name");
		String grade = request.getParameter("grade");
		String parent = request.getParameter("parent");
		Category category = new Category(0, name, Integer.parseInt(grade), Integer.parseInt(parent));
		CategoryDao categoryDao = DaoFactory.getCategoryDao();
		try {
			categoryDao.addCategory(category);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/tgls/goodsManage/goodsType_list.jsp?page=1&size=9");

	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NumberFormatException, SQLException{
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String grade = request.getParameter("grade");
		String parent = request.getParameter("parent");

		Category category = new Category(Integer.parseInt(id), name, Integer.parseInt(grade), Integer.parseInt(parent));

		DaoFactory.getCategoryDao().updateCategory(category);
		String url = "/tgls/goodsManage/goodsType_update.jsp?id="+id;
		response.sendRedirect(request.getContextPath() + url);
	}

	
	public static void main(String[] args) {
		
	}
}
