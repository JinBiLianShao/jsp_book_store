package com.zhy.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import com.zhy.beans.Book;
import com.zhy.daoImp.PhotoDao;
import com.zhy.factory.DaoFactory;

/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 删除书籍
	 * @param request
	 * @param response
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		DaoFactory.getBookDao().deleteBook(Integer.parseInt(id));
		try {
			response.sendRedirect(request.getHeader("Referer"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}
	}

	/**
	 * 增加书籍
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/**
		 * 步骤： 1.获取请求中的name = ?, author = ?, price = ?, introduction = ?, stock = ?,
		 * category = ? 2.获取书本封面名称 3.存入数据库
		 */

		
		List<String> list = new ArrayList<String>();
		String filename = PhotoDao.getPhotoNewName();
		ServletContext servletContext = null;
		servletContext = request.getSession().getServletContext();
		// 数据库中存储格式:/webTest/imgs/***.jpg
		// 第一步:获取页面上上传的图片资源
		List<FileItem> items = PhotoDao.getRequsetFileItems(request, servletContext);
		System.out.println("items:" + items);
		for (FileItem item : items) {
			if (!item.isFormField()) {
				// 判断后缀名是否是jpg
				if (PhotoDao.isGif(item)) {
					PhotoDao.saveFile(item, filename);
				} else {
					System.out.println("后缀格式有误，保存文件失败");
				}
			} else {
				/*
				 * 获取表单中的非文件值 表单中的空间name值 System.out.println("name值:  "+item.getFieldName());
				 * 该name值空间中的value值 System.out.println(item.getString("UTF-8"));
				 */
				try {
					list.add(item.getString("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// 存在数据库里面的照片路径是在项目里的相对路径
		String finalPhotoName = "/img/product/" + filename;
		System.out.println("finalPhotoName：" + finalPhotoName);
		System.out.println("list[0]:" + list.get(0));
		System.out.println("list[1]:" + list.get(1));
		System.out.println("list[2]:" + list.get(2));
		System.out.println("list[3]:" + list.get(3));
		System.out.println("list[4]:" + list.get(4));
		System.out.println("list[5]:" + list.get(5));
		String cover = finalPhotoName;
		Book book = new Book(list.get(0), list.get(2), Integer.parseInt(list.get(1)), list.get(4),Integer.parseInt(list.get(3)) , list.get(5),
				cover);
		DaoFactory.getBookDao().addBook(book);

		response.sendRedirect(request.getContextPath() + "/tgls/goodsManage/goods_list.jsp");
	}

	/**
	 * 更新书籍信息
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {

		List<String> list = new ArrayList<String>();
		String filename = PhotoDao.getPhotoNewName();
		ServletContext servletContext = null;
		servletContext = request.getSession().getServletContext();
		// 数据库中存储格式:/webTest/imgs/***.jpg
		// 第一步:获取页面上上传的图片资源
		List<FileItem> items = PhotoDao.getRequsetFileItems(request, servletContext);
		System.out.println("items:" + items);
		for (FileItem item : items) {
			if (!item.isFormField()) {
				// 判断后缀名是否是jpg
				if (PhotoDao.isGif(item)) {
					PhotoDao.saveFile(item, filename);
				} else {
					System.out.println("后缀格式有误，保存文件失败");
				}
			} else {
				/*
				 * 获取表单中的非文件值 表单中的空间name值 System.out.println("name值:  "+item.getFieldName());
				 * 该name值空间中的value值 System.out.println(item.getString("UTF-8"));
				 */
				try {
					list.add(item.getString("UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// 存在数据库里面的照片路径是在项目里的相对路径
		String finalPhotoName = "/img/product/" + filename;
		String cover = finalPhotoName;
		Book book = new Book(Integer.parseInt(list.get(6)), list.get(0), list.get(2), Integer.parseInt(list.get(1)), list.get(4),Integer.parseInt(list.get(3)) , list.get(5),
				cover);
		DaoFactory.getBookDao().updateBook(book);

		String url = "/tgls/goodsManage/goods_update.jsp?id="+list.get(6);
		response.sendRedirect(request.getContextPath() + url);
	}
}
