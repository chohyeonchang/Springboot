package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserDAO {
	public String _id;
	private Connection conn;
	private ResultSet rs;
	PreparedStatement pstmt = null;
	String str = "";
	String sql = "";
	boolean key = false;
	String db_id = "";
	String db_password = "";
	private JdbcTemplate jdbcTemplate;
	
	public UserDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public UserDAO() { // 데이터베이스 연결
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
	
	public List<User>selectAll(){   // user테이블의 정보를 <User>라는 리스트로 반환하는 함수
		List<User>results = jdbcTemplate.query("select * from user",
				(ResultSet rs, int rowNum)->{
					User user = new User(rs.getString("id"), rs.getString("password"));
					return user;
				});
				return results;
	}
	
	public int join(String id, String password) { // 회원가입을 처리하는 함수
		try {
			sql = "select * from user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next() == true) {
				db_id = rs.getString("id"); // user 테이블에서 id와 password를 받아와 변수에 저장
				db_password = rs.getString("password");
				if (id.equals(db_id)) {      // user 테이블에 있는 id중 하나와 같으면 key=true 
					key = true;
				}
			}
			if (key == true) {
				// 이미 아이디 존재 하는 경우 (이미 존재하는 아이디입니다.)
				return -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		sql = "INSERT INTO user VALUES(?, ?)"; // 새로 받은 id와 password를 user테이블에 Insert
		try {

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return 1;
	}
}
