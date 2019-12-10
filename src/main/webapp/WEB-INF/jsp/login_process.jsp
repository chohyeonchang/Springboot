<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.demo.UserDAO"%>
<%@ page import="com.example.demo.User"%>
<%@ page import="java.io.PrintWriter" %>

<%
   request.setCharacterEncoding("utf-8");
   String getId = request.getParameter("id");
   String getPw = request.getParameter("passwd");             // 아이디(id)와 비밀번호(password)를 받아옴
   String db_Id = null;
   String db_Pw = null;
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String str = "";
   String sql = "";
   boolean key=false;
 %>

 <% 
   try {
      String dburl = "jdbc:mysql://localhost:3306/boarddb?characterEncoding=utf-8&serverTimezone=UTC";
      String dbid = "root";
      String dbpw = "1234";
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dburl, dbid, dbpw);                  // 데이터베이스 연결
      sql="select * from user";
      pstmt=conn.prepareStatement(sql);
      rs=pstmt.executeQuery(); 
      
      while (rs.next() == true) {
         db_Id=rs.getString("id");
         db_Pw=rs.getString("password");   // user 테이블에있는 id와 password를 가져옴
         if(getId.equals(db_Id)&&getPw.equals(db_Pw)){   // login폼에서 입력한 id와 password가 user 테이블에 있는 id와 password와 같으면 key=true 
        	 key=true;
         }
      }
      if(key==true){
    	 	session.setAttribute("userid",getId);   //key=true(로그인 성공)이면 session에 userid라는 이름으로 id 등록 후 페이지 넘김
   	   		response.sendRedirect("choose");
      }
      else{															// id와 password 둘중 하나라도 불일치(로그인 실패)
    	    PrintWriter script = response.getWriter();              // PrintWriter 객체가 필요
			script.println("<script>");
			script.println("alert('아이디와 비밀번호를 다시 확인하세요.')");  // 자바스크립트에서 화면에 알림을 띄울 때 사용
			script.println("history.back()");                       // 이전 화면으로
			script.println("</script>");
      }
   } catch (Exception e) {
      e.printStackTrace();

   }
   
%>