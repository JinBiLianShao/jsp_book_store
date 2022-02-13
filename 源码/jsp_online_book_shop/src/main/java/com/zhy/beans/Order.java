package com.zhy.beans;

/**
 * 订单类
 *
 */
public class Order {
	private int id;
	private String name;
	private int price;
	private int quantity;
	private int total;
	private String user; // 购买的人
	private int bookid; // 购买的人

	public int getId() {
		return id;
	}
	String shou;
	String address;
	String info;
	String phone;
	int status;
	public Order(int id, String name, int price, int quantity, int total, String user,int bookid,String shou,String address,String info,String phone,int status) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.total = total;
		this.user = user;
		this.bookid = bookid;
		this.shou = shou;
		this.address = address;
		this.info = info;
		this.phone = phone;
		this.status = status;
		
	}

	public Order(String name, int price, int quantity, int total, String user,int bookid,String shou,String address,String info,String phone,int status) {
		super();
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.total = total;
		this.user = user;
		this.bookid = bookid;
		this.shou = shou;
		this.address = address;
		this.info = info;
		this.phone = phone;
		this.status = status;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getShou() {
		return shou;
	}

	public void setShou(String shou) {
		this.shou = shou;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
