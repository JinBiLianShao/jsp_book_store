package com.zhy.dao;

import java.sql.SQLException;
import java.util.List;

import com.zhy.beans.Book;

public interface BookDao {
	
	/**
	 * 获取数据库中所有图书
	 * @return
	 */
	public List<Book> getAllBooks();
	
	/**
	 * 获取数据库中最新的8本图书
	 * @return
	 */
	public List<Book> getAllNewBooks();
	/**
	 * 获取数据库中同类的8本图书
	 * @return
	 */
	public List<Book> getAllReleativeBooks(String cate);
	
	/**
	 * 获取数据库中最热的8本图书
	 * @return
	 */
	public List<Book> getAllHotBooks();
	
	/**
	 * 根据book的id查询book
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public Book getBookById(int id) throws SQLException;
	
	/**
	 * 根据书名模糊查询书籍
	 * @param name
	 * @return
	 */
	public List<Book> getBooksByName(String name);
	
	/**
	 * 根据书籍ID删除书籍
	 * @param id
	 */
	public void deleteBook(int id);
	
	/**
	 * 增加新的书籍
	 * @param book
	 */
	public void addBook(Book book);
	
	/**
	 * 修改书籍信息
	 * @param book
	 */
	public void updateBook(Book book);
	
}
