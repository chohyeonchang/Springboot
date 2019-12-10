package com.example.demo;


import java.sql.ResultSet;
import java.util.List;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class TableDAO {
	private JdbcTemplate jdbcTemplate;
	private Connection conn;
	
	public TableDAO(){    // 데이터베이스 연결
		try {

			String dbURL = "jdbc:mysql://localhost/boarddb?characterEncoding=utf8&&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public TableDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Table>selectAll(){ // table 테이블에 있는 정보를 <Table>이라는 리스트로 반환하는 함수
		List<Table>results = jdbcTemplate.query("select * from  `boarddb`.`table`",
				(ResultSet rs, int rowNum)->{
					Table table = new Table(rs.getInt("number"), rs.getString("id"), rs.getString("class_name"),
							rs.getString("teacher_name"),rs.getString("yoeil"),rs.getString("gyosi"),rs.getString("rowspan"));
					return table;
				});
				return results;
	}
	
	public int write(String id, String class_name, String teacher_name, String yoeil, String gyosi, String rowspan) {  // 새로운 강의를 등록하는 함수
		String SQL = "INSERT INTO `boarddb`.`table` (`id`, `class_name`, `teacher_name`, `yoeil`, `gyosi`, `rowspan`) VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, class_name);
			pstmt.setString(3, teacher_name);
			pstmt.setString(4, yoeil);
			pstmt.setString(5, gyosi);
			pstmt.setString(6, rowspan);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; 
	}
	
	public int delete(String id, String class_name) {  // 강의를 삭제하는 함수
		String SQL = "DELETE FROM `boarddb`.`table` WHERE id = ? AND class_name = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, class_name);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
}
	

