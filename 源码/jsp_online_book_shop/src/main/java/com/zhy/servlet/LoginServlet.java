package com.zhy.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.User;
import com.zhy.dao.UserDao;
import com.zhy.factory.DaoFactory;
import com.zhy.tools.Md5Code;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 1.获取用户所填写账号和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String MD5password = null;
		try {
			// 2.对密码进行MD5编码
			MD5password = Md5Code.createMd5Code(password);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		UserDao userDao = DaoFactory.getUserDAO();
		User user = null;
		try {
			//3.根据用户输入的用户名查找数据库中对应的信息，将其封装为USER。
			user = userDao.getUserByUsername(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//4.对用户信息进行校验
		//4.1如果user == null也就是在数据库中未查找到对应的USER，那么请用户先注册。
		if (null == user) {
			request.setAttribute("message", "抱歉，您还未注册！请先进行注册！");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		//4.2判断用户名和密码是否正确。
		} else if (!user.getPassword().equals(MD5password)) {

			request.setAttribute("message", "抱歉，用户名或者密码错误，请重新登录！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		// 5.登录成功，将用户存储到session
		request.getSession().setAttribute("user", user);
		request.removeAttribute("message");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
