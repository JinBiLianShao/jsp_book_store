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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.获取表单中用户填写的参数
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		String MD5password = null;
		try {
			
			//2.对用户输入的密码进行MD5编码
			MD5password = Md5Code.createMd5Code(password);
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		User user = new User(username, nickname, MD5password);
		UserDao userDao = DaoFactory.getUserDAO();
		try {
			//3.先检验此用户名是否已经被注册了
			if (userDao.getUserByUsername(username) != null) {
				//3.1如果已经被注册，则重定向至注册页面重新注册。
				request.getSession().setAttribute("message", "该用户名已被注册，请重新注册！");
				response.sendRedirect(request.getContextPath() + "/register.jsp");
				return;
			} else {
				//3.2如果未注册，则将用户信息添加至数据库，注册成功！
				userDao.addUser(user);
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//4.注册成功，跳转至登陆页面。
		request.getSession().setAttribute("message", "注册成功，现在就登录吧！");
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
