package com.example.demo;

public class Eiljung {  // 일정 정보를 가지고있는 일정클래스 (db정보와 동일)
	private int number;
	private String id;
	private String date;
	private String subject;
	private String content;
	
	public Eiljung(int number, String id, String date, String subject, String content)
	{
		this.number = number;
		this.id = id;
		this.date = date;
		this.subject = subject;
		this.content = content;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
