package com.zhy.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhy.beans.Admin;
import com.zhy.dao.AdminDao;
import com.zhy.factory.DaoFactory;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminDao adminDao = DaoFactory.getAdminDao();
		Admin admin = null;
		admin = adminDao.getAdminByUsername(username);
		if (null == admin) {
			request.setAttribute("message", "抱歉，您还不是管理员！");
			request.getRequestDispatcher("adminLogin.jsp").forward(request, response);

			return;
		} else if (!admin.getPassword().equals(password)) {

			request.setAttribute("message", "抱歉，用户名或者密码错误，请重新登录！");
			request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
			return;
		}

		// 登录成功，将用户存储到session
		request.getSession().setAttribute("admin", admin);
		request.removeAttribute("message");
		response.sendRedirect(request.getContextPath() + "/frame.jsp");
	}

	public void update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		String oldpassword = request.getParameter("oldpassword");
		String password = request.getParameter("password");
		System.out.println("username:" + username);
		System.out.println("oldpassword:" + oldpassword);
		System.out.println("password:" + password);
		AdminDao adminDao = DaoFactory.getAdminDao();
		Admin admin = adminDao.getAdminByUsername(username);
		if (!admin.getPassword().equals(oldpassword)) {
			System.out.println("原始密码错误！");
			request.getSession().setAttribute("message", "原始密码错误，请重新输入！");
			response.sendRedirect("tgls/modify_password.jsp");
			;
			return;
		}
		admin.setPassword(password);
		adminDao.updatePassword(admin);
		System.out.println(password);
//		response.sendRedirect(request.getHeader("Referer"));
		request.getSession().removeAttribute("message");
		request.setAttribute("message", "修改密码成功！");
		response.sendRedirect("info.jsp");
		;
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("admin");
		response.sendRedirect("adminLogin.jsp");
	}

}
