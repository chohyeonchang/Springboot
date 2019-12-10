<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.example.demo.Eiljung"%>
<%@ page import="com.example.demo.EiljungDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("userid");
	request.setCharacterEncoding("utf-8");
	String date=request.getParameter("date");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
%>

<%
	if (id==null || id=="" ||date ==null || date ==""||subject == null || subject == null || content =="" || content =="") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')"); // 하나라도 입력이 안됬을 경우
		script.println("history.back()");
		script.println("</script>");
		}
	else {
		EiljungDAO a = new EiljungDAO();
		int result = a.write(id, date, subject, content);      // 일정 등록

		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('일정 등록에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			response.sendRedirect("calendar");
		}
	}
%>
</body>
</html>
