<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.example.demo.Table"%>
<%@ page import="com.example.demo.TableDAO"%>
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
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("userid");
	String class_name=request.getParameter("class_name");
	String teacher_name=request.getParameter("teacher_name");
	String yoeil=request.getParameter("yoeil"); 
	String gyosi=request.getParameter("gyosi");  
	String rowspan=request.getParameter("rowspan");
%>

<%
	if (id == null || id == "" || class_name == null || teacher_name == null || class_name =="" || teacher_name ==""
			|| rowspan ==null || rowspan ==""|| yoeil ==null || yoeil ==""|| gyosi ==null || gyosi ==""){ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')"); // 하나라도 입력이 안됬을 경우
		script.println("history.back()");
		script.println("</script>");
	} else {
		TableDAO a = new TableDAO();
		int result = a.write(id, class_name, teacher_name, yoeil, gyosi, rowspan); // 강의 등록

		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의 등록에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			response.sendRedirect("hc_main");
		}
	}
%>
</body>
</html>
