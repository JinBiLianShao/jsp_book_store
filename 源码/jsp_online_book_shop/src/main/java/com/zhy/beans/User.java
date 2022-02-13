package com.zhy.beans;

public class User {
	private int id;
	private String username;
	private String nickname;
	private String password;
	
	public User(int id,String username, String nickname, String password) {
		super();
		this.id = id;
		this.username = username;
		this.nickname = nickname;
		this.password = password;
	}
	public User(String username, String nickname, String password) {
		super();
		this.username = username;
		this.nickname = nickname;
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", nickname=" + nickname + ", password=" + password + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
