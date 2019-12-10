<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Spring</title>
</head>
<%
	String id = (String)session.getAttribute("userid");
%>
<BODY style="background-color: palegreen;">
	<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzQ8X9MKpcTYuOZJm--jCb98v7UgWcawbeCnRG3lrNCNT6kUpf"
      style = "float : left; margin-left:250px; width : 75px; height : 75px;">
      <img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzQ8X9MKpcTYuOZJm--jCb98v7UgWcawbeCnRG3lrNCNT6kUpf"
      style = "float : right; margin-right : 250px; width : 75px; height : 75px;">
	<h1 align = "center"> 강의 등록 </h1><br><br><br>
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">강의 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="<%=id%>" name="id" maxlength="50" disabled/></td>
						</tr>	
						<tr>
							<td><input type="text" class="form-control"
								placeholder="강좌명" name="class_name" maxlength="50" /></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="교수명" name="teacher_name" maxlength="50" /></td>				
						</tr>
						<tr>
							<td>
								<select name="yoeil" class="form-control">
								<option value="월">월</option>
								<option value="화">화</option>
								<option value="수">수</option>
								<option value="목">목</option>
								<option value="금">금</option>
								</select>		
							</td>	
						</tr>
						<tr>
							<td>
								<select name="gyosi" class="form-control">
								<option value="1">1교시(09:00 ~ 10:15)</option>
								<option value="2">2교시(10:30 ~ 11:45)</option>
								<option value="3">3교시(12:00 ~ 13:15)</option>
								<option value="4">4교시(13:30 ~ 14:45)</option>
								<option value="5">5교시(15:00 ~ 16:15)</option>
								<option value="6">6교시(16:30 ~ 17:45)</option>
								</select>
							</td>	
						</tr>
						<tr>
							<td>
								<select name="rowspan" class="form-control">
								<option value="2">연강</option>
								<option value="1">연강아님</option>
								</select>
							</td>
						</tr>			
					</tbody>
				</table>
				<input type="submit" class="btn btn-info pull-right" value="등록" />
			</form>
			<form method="post" action="hc_main">
				<input type="submit" class="btn btn-danger pull-right" value="취소" />
			</form>
		</div>
	</div>
</body>
</html>




