package com.zhy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.User;
import com.zhy.dao.UserDao;
import com.zhy.factory.DaoFactory;
import com.zhy.tools.Md5Code;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String MD5password = null;
		try {
			MD5password = Md5Code.createMd5Code(password);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		User user = new User(username, nickname, MD5password);
		UserDao userDao = DaoFactory.getUserDAO();
		try {
			userDao.addUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/tgls/agent/agent_list.jsp");
	}
	
	public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		System.out.println("username:" + username);
		System.out.println("password:" + password);
		int id = Integer.parseInt(request.getParameter("id"));
		UserDao userDao = DaoFactory.getUserDAO();
		User user = null;
		if (password == "") {
			String userPW = userDao.getUserById(id).getPassword();
			user = new User(id, username, nickname, userPW);
		} else {
			user = new User(id, username, nickname, Md5Code.createMd5Code(password));
		}
		userDao.updateUser(user);
		String url = "/tgls/agent/agent_update.jsp?username="+username;
		PrintWriter out = response.getWriter();
		out.print("<script language='javascript'>alert('Update Successfully!')</script>");
		response.sendRedirect(request.getContextPath() + url);
		
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Exception {
		String id =  request.getParameter("id");
		DaoFactory.getUserDAO().deleteUser(Integer.parseInt(id));
		response.sendRedirect(request.getHeader("Referer"));
	}
}
