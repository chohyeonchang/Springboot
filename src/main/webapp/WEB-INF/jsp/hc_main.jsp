<%@ page contentType="text/html; charset = utf-8" pageEncoding="utf-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="resources/css/bootstrap-calendar.css">
<title>Spring</title>
<%
	String id = (String)session.getAttribute("userid");
%>
</head>
<body style="background-color: #ff8e7f;">
	<div>
	 <h1><a href="choose">Back</a></h1>
	 <h3 align="right"><%=id%>님&nbsp;<a href="login">로그아웃</a></h3> 
	 <img
      src="https://www.skuniv.ac.kr/share/img/page/emblem/powerfriends_emoticon/010.gif"
      style="float: left; width: 130px; height: 105px;">
	
		<img src="https://i.pinimg.com/originals/3f/82/40/3f8240fa1d16d0de6d4e7510b43b37ba.gif"
	   style="float : left; margin-left : 330px; width : 80px; height : 75px;">
	   <img src="https://i.pinimg.com/originals/3f/82/40/3f8240fa1d16d0de6d4e7510b43b37ba.gif"
	   style="float : right; margin-right : 470px; width : 80px; height : 75px;">
		
	<h1 align="center" style="font-weight:bold; font-size:45px">시간표</h1>
	
	</div>
	<br>
	
	<h3 style= "text-align:right"><a href="write">강의 등록</a>&nbsp;&nbsp;&nbsp;<a href="class_delete">강의 삭제</a></h3>
	
	<!-- 시간표 그리기( 처음 그릴때는 아무 표시가 안되어있음) -->
	<table style="width: 100%">
		<tr>
			<th></th>
			<th id="1">월</th>
			<th id="2">화</th>
			<th id="3">수</th>
			<th id="4">목</th>
			<th id="5">금</th>
		</tr>
		<tr>
			<th id="10">1교시<br>(09:00 ~ 10:15)
			</th>
			<td id="11"></td>
			<td id="12"></td>
			<td id="13"></td>
			<td id="14"></td>
			<td id="15"></td>
		</tr>
		<tr>
			<th id="20">2교시<br>(10:30 ~ 11:45)
			</th>
			<td id="21"></td>
			<td id="22"></td>
			<td id="23"></td>
			<td id="24"></td>
			<td id="25"></td>
		</tr>
		<tr>
			<th id="30">3교시<br>(12:00 ~ 13:15)
			</th>
			<td id="31"></td>
			<td id="32"></td>
			<td id="33"></td>
			<td id="34"></td>
			<td id="35"></td>
		</tr>
		<tr>
			<th id="40">4교시<br>(13:30 ~ 14:45)
			</th>
			<td id="41"></td>
			<td id="42"></td>
			<td id="43"></td>
			<td id="44"></td>
			<td id="45"></td>
		</tr>
		<tr>
			<th id="50">5교시<br>(15:00 ~ 16:15)
			</th>
			<td id="51"></td>
			<td id="52"></td>
			<td id="53"></td>
			<td id="54"></td>
			<td id="55"></td>
		</tr>
		<tr>
			<th id="60">6교시<br>(16:30 ~ 17:45)
			</th>
			<td id="61"></td>
			<td id="62"></td>
			<td id="63"></td>
			<td id="64"></td>
			<td id="65"></td>
		</tr>
	</table>
</body>

<!-- 아이디, 요일, 교시, 연강을 검사하여 조건에 맞도록 <td id>값을 이용하여 시간표를 변경 -->

<c:forEach var="table" items="${tables}" varStatus="status">
	<c:set var="id" value="<%=id%>"/>
	<c:set var="yoeil" value="${table.yoeil}" />
	<c:set var="gyosi" value="${table.gyosi}" />
	<c:set var="rowspan" value="${$table.rowspan}" />
	<c:choose>
	<c:when test="${table.id eq id }">		<!-- 1. 등록된 아이디와 현재 세션에 등록된 아이디가 같은가 ? -->	
		<c:choose>
		<c:when test="${table.yoeil eq '월'}">		<!-- 2. 등록된 요일과 '월'요일이 같은가 ? -->
			<c:choose>
				<c:when test="${table.gyosi eq '1'}">		<!-- 3. 등록된 교시와 '1'교시가 같은가 ? -->
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">		<!-- 4. 등록된 연강(1 or 2)과 '2'가 같은가 ? -->
							<script>
								function change() {
									var change1 = document.getElementById("11");		
									var change2 = document.getElementById("21");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = "<td>"						/* 조건을 만족하면 해당되는 <td id>에 강의명, 교수명을 등록하고 */ 
											+ class_name;							/* 배경색상을 변경한다 */
									change1.style.backgroundColor = 'Red';		
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Red';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("11");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Red';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '2'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("21");
									var change2 = document.getElementById("31");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Green';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Green';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("21");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Green';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '3'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("31");
									var change2 = document.getElementById("41");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Yellow';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Yellow';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("31");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Yellow';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '4'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("41");
									var change2 = document.getElementById("51");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Blue';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Blue';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("41");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Blue';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '5'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("51");
									var change2 = document.getElementById("61");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Purple';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Purple';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("51");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Purple';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '6'}">
					<script>
						function change() {
							var change1 = document.getElementById("61");
							var class_name = "${table.class_name}";
							var teacher_name = "${table.teacher_name}";
							change1.innerHTML = " <td>"
									+ class_name + "<br>" + teacher_name
									+ "</td>";
							change1.style.backgroundColor = 'Orange';
						}
						change();
					</script>
				</c:when>
			</c:choose>
		</c:when>
		<c:when test="${table.yoeil=='화'}">
			<c:choose>
				<c:when test="${table.gyosi eq '1'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("12");
									var change2 = document.getElementById("22");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Aqua';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Aqua';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("12");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Aqua';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '2'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("22");
									var change2 = document.getElementById("32");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Beige';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Beige';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("22");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Beige';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '3'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("32");
									var change2 = document.getElementById("42");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Coral';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Coral';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("32");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Coral';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '4'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("42");
									var change2 = document.getElementById("52");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkCyan';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkCyan';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("42");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkCyan';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '5'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("52");
									var change2 = document.getElementById("62");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkGoldenRod';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkGoldenRod';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("52");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkGoldenRod';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '6'}">
					<script>
						function change() {
							var change1 = document.getElementById("62");
							var class_name = "${table.class_name}";
							var teacher_name = "${table.teacher_name}";
							change1.innerHTML = " <td>"
									+ class_name + "<br>" + teacher_name
									+ "</td>";
							change1.style.backgroundColor = 'DarkGray';
						}
						change();
					</script>
				</c:when>
			</c:choose>
		</c:when>

		<c:when test="${table.yoeil=='수'}">
			<c:choose>
				<c:when test="${table.gyosi eq '1'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("13");
									var change2 = document.getElementById("23");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkKhaki';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkKhaki';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("13");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkKhaki';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '2'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("23");
									var change2 = document.getElementById("33");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkMagenta';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkMagenta';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("23");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkMagenta';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '3'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("33");
									var change2 = document.getElementById("43");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkOrange';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkOrange';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("33");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkOrange';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '4'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("43");
									var change2 = document.getElementById("53");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkRed';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkRed';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("43");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkRed';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '5'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("53");
									var change2 = document.getElementById("63");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkSalmon';
									change2.innerHTML = " <td bgcolor='Yellow'>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkSalmon';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("53");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkSalmon';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '6'}">
					<script>
						function change() {
							var change1 = document.getElementById("63");
							var class_name = "${table.class_name}";
							var teacher_name = "${table.teacher_name}";
							change1.innerHTML = " <td>"
									+ class_name + "<br>" + teacher_name
									+ "</td>";
							change1.style.backgroundColor = 'DarkseaGreen';
						}
						change();
					</script>
				</c:when>
			</c:choose>
		</c:when>

		<c:when test="${table.yoeil=='목'}">
			<c:choose>
				<c:when test="${table.gyosi eq '1'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("14");
									var change2 = document.getElementById("24");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkSlateBlue';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkSlateBlue';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("14");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkSlateBlue';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '2'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("24");
									var change2 = document.getElementById("34");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DarkTurquoise';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DarkTurquoise';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("24");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DarkTurquoise';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '3'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("34");
									var change2 = document.getElementById("44");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DeepPink';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DeepPink';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("34");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DeepPink';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '4'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("44");
									var change2 = document.getElementById("54");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DimGray';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DimGray';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("44");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DimGray';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '5'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("54");
									var change2 = document.getElementById("64");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'DodgerBlue';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'DodgerBlue';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("54");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'DodgerBlue';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '6'}">
					<script>
						function change() {
							var change1 = document.getElementById("64");
							var class_name = "${table.class_name}";
							var teacher_name = "${table.teacher_name}";
							change1.innerHTML = " <td>"
									+ class_name + "<br>" + teacher_name
									+ "</td>";
							change1.style.backgroundColor = 'Gold';
						}
						change();
					</script>
				</c:when>
			</c:choose>
		</c:when>

		<c:when test="${table.yoeil=='금'}">
			<c:choose>
				<c:when test="${table.gyosi eq '1'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("15");
									var change2 = document.getElementById("25");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'GreenYellow';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'GreenYellow';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("15");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'GreenYellow';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '2'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("25");
									var change2 = document.getElementById("35");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Ivory';
									change2.innerHTML = " <td bgcolor='Purple'>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Ivory';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("25");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Ivory';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '3'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("35");
									var change2 = document.getElementById("45");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'LavenderBlush';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'LavenderBlush';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("35");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'LavenderBlush';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '4'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("45");
									var change2 = document.getElementById("55");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'Lavender';
									change2.innerHTML = " <td>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'Lavender';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("45");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'Lavender';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '5'}">
					<c:choose>
						<c:when test="${table.rowspan eq '2'}">
							<script>
								function change() {
									var change1 = document.getElementById("55");
									var change2 = document.getElementById("65");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name;
									change1.style.backgroundColor = 'LawnGreen';
									change2.innerHTML = " <td bgcolor='Purple'>"
											+ teacher_name + "</td>";
									change2.style.backgroundColor = 'LawnGreen';
								}
								change();
							</script>
						</c:when>
						<c:otherwise>
							<script>
								function change() {
									var change1 = document.getElementById("55");
									var class_name = "${table.class_name}";
									var teacher_name = "${table.teacher_name}";
									change1.innerHTML = " <td>"
											+ class_name + "<br>"
											+ teacher_name + "</td>";
									change1.style.backgroundColor = 'LawnGreen';
								}
								change();
							</script>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:when test="${table.gyosi eq '6'}">
					<script>
						function change() {
							var change1 = document.getElementById("65");
							var class_name = "${table.class_name}";
							var teacher_name = "${table.teacher_name}";
							change1.innerHTML = " <td>"
									+ class_name + "<br>" + teacher_name
									+ "</td>";
							change1.style.backgroundColor = 'LightSkyBlue';
						}
						change();
					</script>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>
	</c:when>
	</c:choose>
</c:forEach>
</html>

