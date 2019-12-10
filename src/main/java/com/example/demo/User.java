package com.example.demo;

public class User {   // 사용자 정보를 가지고있는 User클래스 (db정보와 동일)
	private String id;
	private String password;
	
	public User(String id, String password)
	{
		this.id = id;
		this.password = password;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
