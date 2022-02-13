package com.zhy.beans;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class ShoppingCart {
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();
	/**
	 * 向购物车中添加图书
	 * 
	 * @param book
	 */
	public void add(Book book) {

		CartItem item = map.get(book.getId());

		if (item == null) {
			// 若不存在相同类型书籍，则创建新的购物项
			item = new CartItem();
			item.setBook(book);
			item.setQuantity(1);
			// 将购物项添加到购物车中
			map.put(book.getId(), item);
		} else {
			// 若存在相同类型书籍，则将购物项个数加一
			item.setQuantity(item.getQuantity() + 1);
		}
	}

	/**
	 * 合计  （所有条目价钱小计之和）
	 * 使用BigDecimal类型：解决二进制运算误差问题
	 * @return
	 */
	public double getTotalPrice() {
		//使用BigDecimal类型
		BigDecimal total = BigDecimal.valueOf(0);
		//遍历每个条目
		for (CartItem cartItem : map.values()) {
			//得到每个条目价钱（得到BigDecimal类型）
			BigDecimal subTatal = BigDecimal.valueOf(cartItem.getSubtotalPrice());
			//对每个条目进行加法求和
			total = total.add(subTatal);
		}
		return total.doubleValue();	//转为double类型
	}
	
	/**
	 * 删除指定条目
	 * @param bid
	 */
	public void delete(int id){
		map.remove(id);
	}
	
	/**
	 * 修改指定条目的购买数量
	 * @param id
	 * @param quantity
	 */
	public void update(int id, int quantity) {
		map.get(id).setQuantity(quantity);
	}
	
	/**
	 * 清空条目
	 */
	public void clear(){
		map.clear(); 
	}
	
	/**
	 * 我的购物车（获取所有条目）
	 * @return
	 */
	public Collection<CartItem> getCartItems(){
		return map.values();
	}


	public Map<Integer, CartItem> getMap() {
		return map;
	}

	public void setMap(Map<Integer, CartItem> map) {
		this.map = map;
	}

	/**
	 * 获取商品总数量
	 * @return
	 */
	public int getNum() {
		return getCartItems().size();
	}

	
	

}
