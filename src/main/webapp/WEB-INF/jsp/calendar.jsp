<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page import="com.example.demo.EiljungDAO" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("userid");
	Calendar cal = Calendar.getInstance();
	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	if(strYear != null)
	{
	  year = Integer.parseInt(strYear);
	  month = Integer.parseInt(strMonth);
	  
	}else{
	
	}
	
	cal.set(year, month, 1);   // 년도, 월 세팅
	
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;
	
	Calendar todayCal = Calendar.getInstance();   
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));     // 오늘 날짜 저장
	
%>
<html lang="ko">
<HEAD>
	<TITLE>캘린더</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javaScript" language="javascript"></script>
	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {font-family: "돋움"; font-size: 9pt; color:#000000;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}

		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
	</style>
	
</HEAD>
<BODY style="background-color: pink;">
<h2 align="right"><%=id%>님&nbsp;<a href="login">로그아웃</a></h2> 
 <img
      src="https://www.skuniv.ac.kr/share/img/page/emblem/powerfriends_emoticon/013.gif"
      style="float: right; width: 150px; height: 125px;">
   <h2><a href="choose"><font size="4em">Back</font></a></h2>   
   
    <img src = "https://cdn.dribbble.com/users/303363/screenshots/2306952/day_005-_gif_.gif"
   		style = "float : left; margin-left : 350px; width : 100px; height : 100px;">
   
   <span
       style="font-style: italic;  font-size: 3em; font-weight: bold; line-height: 2.0em; background-color: pink;
        font-family: arial; margin-left: 50px">
		스케줄달력
	</span>
	 <img src = "https://cdn.dribbble.com/users/303363/screenshots/2306952/day_005-_gif_.gif"
	  	 style = "float : right; width : 100px; height : 100px; margin-right:300px">
	  	 <br><br>


<form name="calendarFrm" id="calendarFrm" action="" method="post" >
<DIV id="content" style="width:712px;" >

<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="lightgray"
 style="border:2px solid black;  margin-left:250px;" >
<tr>
<td height="60">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="10">
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="<c:url value='/calendar' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
				<font size="12px" color="red"><b>&lt;&lt;</font></b><!-- 이전해 -->
			</a>
			<%if(month > 0 ){ %>
			<a href="<c:url value='/calendar' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
				<font size="7px" color="blue"><b>&lt;</font></b><!-- 이전달 -->
			</a>
			<%} else {%>
				<font size="7px" color="blue"><b>&lt;</font></b>
			<%} %>
			&nbsp;&nbsp;
			<font size="12px"><%=year%>년<%=month+1%>월</font>
			<%if(month < 11 ){ %>
			<a href="<c:url value='/calendar' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
				<font size="7px" color="blue"><!-- 다음달 --><b>&gt;</font></b>
			</a>
			<%}else{%><font size="7px"  color="blue">
				<b>&gt;</b></font>
			<%} %>
			<a href="<c:url value='/calendar' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
				<font size="12px"  color="red"><!-- 다음해 --><b>&gt;&gt;</font></b>
			</a>
		</td>
	</tr>
	</table>
	<input type="button" onclick="javascript:location.href='<c:url value='/calendar' />'" value="오늘"/>
</td>
</tr>
</table><br>

<!-- 달력 그리기 -->

<table width="100%" border="1" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF" style= "margin-left:250px;">
<THEAD>
<TR bgcolor="#CECECE">
	<TD width='100px'>
	<DIV align="center"><font color="red">일</font></DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">월</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">화</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">수</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">목</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center">금</DIV>
	</TD>
	<TD width='100px'>
	<DIV align="center"><font color="#529dbc">토</font></DIV>
	</TD>
</TR>
</THEAD>
<TBODY>
<TR>
<%

for(int index = 1; index < start ; index++ )
{
  out.println("<TD >&nbsp;</TD>");				//처음 빈공간 표시
  newLine++;
}

for(int index = 1; index <= endDay; index++)	
{
	String color = "";

	if(newLine == 0){			color = "RED";
	}else if(newLine == 6){ 	color = "#529dbc";
	}else{						color = "BLACK"; };

	String sUseDate = Integer.toString(year);

	sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

	int iUseDate = Integer.parseInt(sUseDate);
	
	String backColor = "#EFEFEF";
	if(iUseDate == intToday ) {
		backColor = "yellow";
	}
	else if(iUseDate < intToday){
		backColor = "peachpuff";
	}
	else{
		backColor = "aqua";
	}
	out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
%>
	<font color='<%=color%>'>
		<a href="write2?year=<%=year%>&month=<%=month+1%>&day=<%=index%>"><%=index %></a>   <!-- 달력에 날짜 표시 -->
	</font>
	
<%
	out.println("<BR>");
%>
	<!-- 각 날짜에 등록된 일정의 제목 표시 -->
	<c:set var="date"><%=year%>-<%=month + 1%>-<%=index%></c:set>
	<c:set var="id" value="<%=id%>"/>
	<c:forEach var="eiljung" items="${eiljungs}" varStatus="status">
		<c:choose>
			<c:when test="${eiljung.id eq id }">
				<c:if test="${eiljung.date eq date}">
					<c:out value="${eiljung.subject}" /><br>
				</c:if>
			</c:when>
		</c:choose>
	</c:forEach>
<% 
	out.println("<BR>");
	out.println("</TD>");   //기능 제거
	newLine++;

	if(newLine == 7)
	{
	  out.println("</TR>");
	  if(index <= endDay)
	  {
	    out.println("<TR>");
	  }
	  newLine=0;
	}
}

while(newLine > 0 && newLine < 7)   //마지막 공백 표시
{
  out.println("<TD>&nbsp;</TD>");
  newLine++;
}
%>
</TR>
</TBODY>
</TABLE>
</DIV>
</form>
</BODY>
</HTML>
