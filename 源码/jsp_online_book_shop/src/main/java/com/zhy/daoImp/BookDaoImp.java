package com.zhy.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zhy.beans.Book;
import com.zhy.dao.BookDao;
import com.zhy.tools.DBUtil;

public class BookDaoImp implements BookDao {

	@Override
	public List<Book> getAllBooks() {
		List<Book> books = new ArrayList<>();
		Book book = null;
		String sql = "select * from book";
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
		return books;
	}

	@Override
	public Book getBookById(int id) throws SQLException {
		Book book = null;

		Connection connection = DBUtil.getConnection();
		String sql = "SELECT * from book where id='" + id + "'";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				book = new Book(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getInt(4), resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7),
						resultSet.getString(8));
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

		return book;
	}

	@Override
	public List<Book> getBooksByName(String name) {
		List<Book> books = new ArrayList<Book>();
		ResultSet resultSet = null;
		Connection conn = null;
		PreparedStatement ps = null;
		Book book = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement("select * from book where name like ?");
			ps.setString(1, "%" + name + "%");
			resultSet = ps.executeQuery();
			while (resultSet.next()) {
				book = new Book(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
						resultSet.getInt(4), resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7),
						resultSet.getString(8));
				books.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(resultSet, ps, conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return books;
	}

	@Override
	public void deleteBook(int id) {
		PreparedStatement prep = null;
		Connection conn = null;
		String url = "delete from book  where id=?";
		try {
			conn = DBUtil.getConnection();
			prep = conn.prepareStatement(url);
			prep.setInt(1, id);
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
	public void addBook(Book book) {
		String sql = "insert book (name, author, price, introduction, stock, category, cover,time)" + "value(?, ?, ?, ?, ?,?,?,?)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String name = book.getName();
		String author = book.getAuthor();
		int price = book.getPrice();
		String intro = book.getIntroduction();
		int stock = book.getStock();
		String category = book.getCategory();
		String cover = book.getCover();
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, author);
			preparedStatement.setString(4, intro);
			preparedStatement.setString(6, category);
			preparedStatement.setString(7, cover);
			preparedStatement.setDate(8, book.getTime());
			preparedStatement.setInt(3, price);
			preparedStatement.setInt(5, stock);
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				DBUtil.close(preparedStatement, connection);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	@Override
	public void updateBook(Book book) {
		int id = book.getId();
		String name = book.getName();
		String author = book.getAuthor();
		int price = book.getPrice();
		String intro = book.getIntroduction();
		int stock = book.getStock();
		String category = book.getCategory();
		String cover = book.getCover();
		
		String sql = "update book set name = ?, author = ?, price = ?, introduction = ?, stock = ?, category = ?, cover = ? where id = ? ";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, author);
			preparedStatement.setString(4, intro);
			preparedStatement.setString(6, category);
			preparedStatement.setString(7, cover);
			preparedStatement.setInt(3, price);
			preparedStatement.setInt(5, stock);
			preparedStatement.setInt(8, id);
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(preparedStatement, connection);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
//		Book book = new Book(89, "1", "1", 1, "1", 1, "小说", "1");
//		BookDao bookDao = DaoFactory.getBookDao();
////		bookDao.addBook(book);
//		book.setName("2");
//		bookDao.updateBook(book);
	}

	@Override
	public List<Book> getAllNewBooks() {
		List<Book> books = new ArrayList<>();
		Book book = null;
		String sql = "select * from book ORDER BY TIME DESC  limit 0,8 ";
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
		return books;
 	}

	@Override
	public List<Book> getAllHotBooks() {
		
		List<Book> books = new ArrayList<>();
		String sql = "select bookid AS a,COUNT(bookid) AS b from orders group BY bookid  order BY b desc LIMIT 0,8";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = DBUtil.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int bookid = resultSet.getInt(1);
				Book book = getBookById(bookid);
				if(book != null) {
					books.add(book);
				}
				
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
		return books;
	}

	@Override
	public List<Book> getAllReleativeBooks(String cate) {
		List<Book> books = new ArrayList<>();
		Book book = null;
		String sql = "select * from book where category = '"+cate+"' ORDER BY TIME DESC  limit 0,8 ";
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
		return books;
	}
}
