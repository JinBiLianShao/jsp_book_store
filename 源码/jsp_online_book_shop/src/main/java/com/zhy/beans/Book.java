package com.zhy.beans;

import java.sql.Date;

public class Book {
	private int id;
	private String name;
	private String author;
	private int price;
	private String introduction; // 书本简介
	private int stock; // 书本库存
	private String category; // 书本分类
	private String cover; // 存储书本封面的图片路径
	private Date time; // 存储书本封面的图片路径

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	@Override
	public String toString() {
		return "Book [name=" + name + ", author=" + author + ", price=" + price + ", introduction=" + introduction
				+ ", stock=" + stock + ", category=" + category + ", cover=" + cover + "]";
	}

	public Book(int id, String name, String author, int price, String introduction, int stock, String category,
			String cover) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.price = price;
		this.introduction = introduction;
		this.stock = stock;
		this.category = category;
		this.cover = cover;
	}

	public Book(String name, String author, int price, String introduction, int stock, String category, String cover) {
		super();
		this.name = name;
		this.author = author;
		this.price = price;
		this.introduction = introduction;
		this.stock = stock;
		this.category = category;
		this.cover = cover;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getTime() {
		return new Date(System.currentTimeMillis());
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
