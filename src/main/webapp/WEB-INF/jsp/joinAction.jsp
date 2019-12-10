<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %> 
<% 
	request.setCharacterEncoding("UTF-8"); 
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
	   String getnewId = request.getParameter("userID");            // 아이디(id)와 비밀번호(password)를 받아옴
	   String getnewPw = request.getParameter("userPassword");

		if (getnewId == null || getnewPw == null || getnewId == "" || getnewPw == ""){     
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");    // id나 password 둘중 하나라도 입력이 안됬을 경우 
				script.println("history.back()");
				script.println("</script>");
			} 
		else{														// 입력이 다 되었고, user 테이블에 같은 id가 없을 경우 (회원가입 완료)
				UserDAO userDAO = new UserDAO();
				int result = userDAO.join(getnewId,getnewPw);           // user 테이블에 새로운 id와 pw 추가
				
				if(result == -1){ 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디 입니다.')");     // user 테이블에 같은 id가 있을 경우 (회원가입 실패)
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원 가입이 완료되었습니다.')");
					script.println("history.go(-2)");   				 // 회원가입 완료 후 로그인 페이지로
					script.println("</script>");
					}
			}
	%>
</body>
</html>
