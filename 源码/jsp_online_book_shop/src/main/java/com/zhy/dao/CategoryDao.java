package com.zhy.dao;

import java.sql.SQLException;
import java.util.List;

import com.zhy.beans.Book;
import com.zhy.beans.Category;

public interface CategoryDao {
	
	/**
	 * 获取数据库中所有分类
	 * @return 
	 */
	public List<Category> getAllCategory() ;
	
	/**
	 * 通过分类ID得到分类
	 * @param id
	 * @return
	 */
	public Category getCategoryById(int id);
	
	/**
	 * 根据分类等级查找分类
	 * @param grade
	 * @return
	 */
	public List<Category> getCategoryByGrade(int grade);
	
	/**
	 * 通过分类Id获取该分类下的所有图书
	 * @param categoryId
	 * @return
	 */
	public List<Book> getBooksByCategoryId(int categoryId) ;
	
	/**
	 * 通过上级分类获取下级分类
	 * @param id
	 * @return
	 */
	public List<Category> getSonCategory(int id);
	
	/**
	 * 更新分类
	 * @param category
	 */
	public void updateCategory(Category category);
	
	/**
	 * 添加分类
	 * @param category
	 * @throws SQLException 
	 * @throws Exception 
	 */
	public void addCategory(Category category) throws SQLException, Exception;

	public int getBooksSizeByCategoryId(int categoryId);
}
