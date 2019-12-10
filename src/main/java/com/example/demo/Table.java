package com.example.demo;

public class Table {   // 강좌 정보를 가지고있는 Table클래스 (db정보와 동일)
	private int number;
	private String id;
	private String class_name;
	private String teacher_name;
	private String yoeil;
	private String gyosi;
	private String rowspan;

	public Table(int number, String id, String class_name, String teacher_name, String yoeil, String gyosi,
			String rowspan) {
		this.number = number;
		this.id = id;
		this.class_name = class_name;
		this.teacher_name = teacher_name;
		this.yoeil = yoeil;
		this.gyosi = gyosi;
		this.rowspan = rowspan;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYoeil() {
		return yoeil;
	}

	public void setYoeil(String yoeil) {
		this.yoeil = yoeil;
	}

	public String getGyosi() {
		return gyosi;
	}

	public void setGyosi(String gyosi) {
		this.gyosi = gyosi;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getRowspan() {
		return rowspan;
	}

	public void setRowspan(String rowspan) {
		this.rowspan = rowspan;
	}

}
