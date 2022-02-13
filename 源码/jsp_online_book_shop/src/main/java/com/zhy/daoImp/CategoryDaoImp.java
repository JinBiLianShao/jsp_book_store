package com.zhy.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zhy.beans.Book;
import com.zhy.beans.Category;
import com.zhy.dao.CategoryDao;
import com.zhy.factory.DaoFactory;
import com.zhy.tools.DBUtil;

public class CategoryDaoImp implements CategoryDao {

	@Override
	public List<Category> getAllCategory() {
		List<Category> categories = new ArrayList<>();
		Category category = null;
		String sql = "select * from category";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				category = new Category(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4));
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return categories;
	}

	@Override
	public Category getCategoryById(int id) {
		Category category = null;
		String sql = "select * from category where id=" + id;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				category = new Category(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return category;
	}

	@Override
	public List<Book> getBooksByCategoryId(int categoryId) {
		Book book = null;
		List<Book> books = new ArrayList<Book>();
		String categoryName = getCategoryById(categoryId).getName();
		String sql = "SELECT * from book where category='" + categoryName + "'";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				book = new Book(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getInt(4), resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7),
						resultSet.getString(8));
				books.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return books;
	}
	
	@Override
	public int getBooksSizeByCategoryId(int categoryId) {
 		String categoryName = getCategoryById(categoryId).getName();
		String sql = "SELECT count(*) from book where category='" + categoryName + "'";
		Connection connection = null;
		int result = 0;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				result = resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	@Override
	public List<Category> getCategoryByGrade(int grade) {
		List<Category> categories = new ArrayList<>();
		Category category = null;
		String sql = "select * from category where grade=" + grade;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				category = new Category(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4));
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return categories;
	}

	@Override
	public List<Category> getSonCategory(int id) {
		List<Category> categories = new ArrayList<>();
		Category category = null;
		String sql = "select * from category where parent=" + id;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				category = new Category(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
						resultSet.getInt(4));
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, preparedStatement, connection);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return categories;
	}

	public static void main(String[] args) throws SQLException, Exception {
		CategoryDao categoryDao = DaoFactory.getCategoryDao();
		Category category = categoryDao.getCategoryById(24);
		category.setName("test1");
		categoryDao.addCategory(category);
	}

	@Override
	public void updateCategory(Category category) {
		PreparedStatement prep = null;
		Connection conn = null;
		String url = "update category set name=?,grade=?,parent=? where id=?";
		try {
			conn = DBUtil.getConnection();
			prep = conn.prepareStatement(url);
			prep.setString(1, category.getName());
			prep.setInt(2, category.getGrade());
			prep.setInt(3, category.getParent());
			prep.setInt(4, category.getId());

			prep.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(prep, conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void addCategory(Category category) throws Exception {
		String sql = "insert category (name, grade, parent)" + "value(?, ?, ?)";
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		String name = category.getName();
		int grade = category.getGrade();
		int parent = category.getParent();
		preparedStatement.setString(1, name);
		preparedStatement.setInt(2, grade);
		preparedStatement.setInt(3, parent);
		preparedStatement.execute();
		DBUtil.close(preparedStatement, connection);
	}

}
