package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class EiljungDAO {
	private JdbcTemplate jdbcTemplate;
	private Connection conn;
	PreparedStatement pstmt = null;
	
	public EiljungDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public EiljungDAO() { // 데이터베이스 연결
		try {
			String dbURL = "jdbc:mysql://localhost:3306/boarddb?characterEncoding=utf-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Eiljung>selectAll(){  // eiljung 테이블에 있는 정보들을 <Eiljung>이라는 리스트로 반환하는 함수
		List<Eiljung>results = jdbcTemplate.query("select * from  `boarddb`.`eiljung`",
				(ResultSet rs, int rowNum)->{
					Eiljung eiljung = new Eiljung(rs.getInt("number"), rs.getString("id"),
							rs.getString("date"), rs.getString("subject"), rs.getString("content"));
					return eiljung;
				});
				return results;
	}
	
	
	
	public int write(String id, String date, String subject, String content){  // 새로운 일정을 등록하는 함수
		String SQL = "INSERT INTO `boarddb`.`eiljung` (`id`, `date`, `subject`, `content`) VALUES(?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, date);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; 
	}
	
	public int delete(String id, String date) {  // 일정을 삭제하는 함수
		String SQL = "DELETE FROM eiljung WHERE id = ? AND date = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, date);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
}
	
	
