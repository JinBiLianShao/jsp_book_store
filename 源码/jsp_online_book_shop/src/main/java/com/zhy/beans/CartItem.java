package com.zhy.beans;

import java.math.BigDecimal;

public class CartItem {

	private Book book;
	private int quantity;

	/**
	 * 小计方法：处理二进制运算误差问题
	 * @return
	 */
	public double getSubtotalPrice(){  //计算方法，没有对应成员
		
		//将double转化为BigDecimal类型：解决二进制运算误差问题
		BigDecimal _price = BigDecimal.valueOf(book.getPrice());
		BigDecimal _count = BigDecimal.valueOf(quantity);
		
		//计算价格（价钱*数量）,并转回double类型
		return _price.multiply(_count).doubleValue();  
	}


	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}