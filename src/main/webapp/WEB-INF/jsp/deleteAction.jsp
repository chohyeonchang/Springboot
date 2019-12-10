<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.Eiljung"%>
<%@ page import="com.example.demo.EiljungDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String id = (String)session.getAttribute("userid");
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String date = request.getParameter("date");			// 날짜(date)를 받아옴
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring</title>
</head>
<body>
	<%
		EiljungDAO eiljungdao = new EiljungDAO();
		int result = eiljungdao.delete(id, date);                       // 일정 삭제
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('일정 삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			response.sendRedirect("calendar");
			}
	%>
</body>
</html>
