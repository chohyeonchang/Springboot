<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.Table"%>
<%@ page import="com.example.demo.TableDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String id = (String)session.getAttribute("userid");
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	String class_name = request.getParameter("class_name");       // 강의명(class_name)을 받아옴
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring</title>
</head>
<body>
	<%
		TableDAO tabledao = new TableDAO();
		int result = tabledao.delete(id,class_name);                       // 강의 삭제
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의 삭제에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			response.sendRedirect("hc_main");
			}
	%>
</body>
</html>
