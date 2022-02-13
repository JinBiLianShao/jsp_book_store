package com.zhy.tools;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zhy.beans.Book;
import com.zhy.beans.Category;

public class PageUtils {
	public static List<Category> getList(List<Category> list,Object page1,HttpServletRequest request){
		int pagesize = getPageSize(list);
		int page = Integer.parseInt(page1+"");
		int end = 0;
		int size = 9;
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
		request.setAttribute("pagesize", pagesize);
		return list.subList((page-1)*size, end);
	}

	public static int getBookPageSize(List<Book> list) {
		int size = 9;
		if(list.size() % size == 0) {
			return list.size()/size;
		}else {
			return list.size()/size + 1;
		}

	}
	
	public static List<Book> getBookList(List<Book> list,Object page1,HttpServletRequest request){
		int pagesize = getBookPageSize(list);
		int page = Integer.parseInt(page1+"");
		int end = 0;
		int size = 9;
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
		request.setAttribute("pagesize", pagesize);
		return list.subList((page-1)*size, end);
	}

	public static int getPageSize(List<Category> list) {
		int size = 9;
		if(list.size() % size == 0) {
			return list.size()/size;
		}else {
			return list.size()/size + 1;
		}

	}
}
