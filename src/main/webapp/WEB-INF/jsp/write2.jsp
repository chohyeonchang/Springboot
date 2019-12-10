<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.example.demo.EiljungDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Spring</title>
</head>
<BODY style="background-color: palegreen;">
<%
	String id = (String)session.getAttribute("userid"); 
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
%>
	<h1 align="center"><%=year%>-<%=month%>-<%=day%>일정</h1><br><br>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">일정 목록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
							<!-- 현재날짜의 일정 목록(제목, 내용)을 보여줌 -->
						<td><c:set var="date"><%=year%>-<%=month%>-<%=day%></c:set> <c:set
								var="id" value="<%=id%>" />
							 <c:forEach var="eiljung" items="${eiljungs}" varStatus="status">
								<c:choose>
									<c:when test="${eiljung.id eq id }">
										<c:if test="${eiljung.date eq date}">
											 ${eiljung.subject} - ${eiljung.content}<br>
										</c:if>
									</c:when>
								</c:choose>
							</c:forEach>

							<form method="post" action="deleteAction">
								<input type="submit" class="btn btn-danger pull-right"
									value="일정삭제" /> <input type="hidden" name="date"
									value="<%=year%>-<%=month%>-<%=day%>" />
							</form>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction2">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">일정
								등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="<%=year%>-<%=month%>-<%=day%>" name="date2"
								maxlength="50" disabled /> <input type="hidden" name="date"
								value="<%=year%>-<%=month%>-<%=day%>" /></td>
						</tr>
					
						<tr>
							<td><input type="text" class="form-control" placeholder="<%=id%>"
								name="id" maxlength="50" disabled /></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목"
								name="subject" maxlength="50" /></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="내용"
								name="content" maxlength="400" /></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-info pull-right" value="등록" />
			</form>
			<form method="post" action="calendar">
				<input type="submit" class="btn btn-danger pull-right" value="취소" />
			</form>
		</div>
	</div>
</body>
</html>




