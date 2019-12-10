<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Spring</title>
</head>
<BODY style="background-color: palegreen;">
	<img
		src="https://cdn.pixabay.com/photo/2013/07/12/12/44/cancel-146131_640.png"
		style="float: left; margin-left: 250px; width: 75px; height: 75px;">
	<img
		src="https://cdn.pixabay.com/photo/2013/07/12/12/44/cancel-146131_640.png"
		style="float: right; margin-right: 250px; width: 75px; height: 75px;">
	<h1 align="center" style="font-weight:bold">강의 삭제</h1>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<form method="post" action="class_deleteAction">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">강의
								삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="강의명" name="class_name" maxlength="20" /></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-info pull-right" value="확인" />
			</form>

			<form method="post" action="hc_main">
				<input type="submit" class="btn btn-danger pull-right" value="취소" />
			</form>
		</div>
	</div>
</body>
</html>
