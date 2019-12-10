<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Choose Page</title>
</head>
<%
	String id = (String)session.getAttribute("userid"); // 세션에 저장된 아이디 값을 불러옴

%>

<body style="background-color: powderblue;">
   <br>
	<h2 style ="font-weight:bold; text-align:right"><%=id%>님&nbsp;<a href="login">로그아웃</a></h2> 
         <img src="https://www.skuniv.ac.kr/share/img/page/emblem/powerfriends_emoticon/006.gif"
            style="float : left; width : 200px; height : 175px; margin-left : 30px;">
            
         <img
            src="https://www.skuniv.ac.kr/share/img/page/emblem/powerfriends_emoticon/002.gif"
            alt="SKON" style="float: left; width: 230px; height: 195px; margin-left: 350px;">
            
         <img src ="https://www.skuniv.ac.kr/share/img/page/emblem/powerfriends_emoticon/004.gif"
           style="float : right; width : 200px; height : 175px; margin-right : 40px;">
         

            
   <br>
   <span style="line-height: 300%"><br></span>
   <br>

   <span>
      <div style="width: 150px; height: 150px; float: left; margin-right: 300px; margin-left: 350px;">
         <div>
            <img 
               src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZmqMfUrVss8i4hxVlok9_zu4SeUAAq2RJpAseKtCkXYI7QmGb-g"
               alt="" style="width: 250px; height: 250px">
         </div><br><br>
         <div>
         <button class="btn btn-success btn-lg" type="button" style="width : 250px; height: 100px;">
            <font size="32px"><a href="calendar"> 캘린더 </a></font>
         </button>
         </div>
      </div>
   </span>

   <span>
      <div style="width: 150px; height: 150px; float: left; ">
         <div>
            <img
               src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOqu6_ZJsBnUPhdKPqxsisj8qefG0B-ZrYWei-ca2UHvBBsJ4C"
               alt="" style="width: 250px; height: 250px">
         </div><br><br>
         <button class="btn btn-warning btn-lg" type="button" style="width : 250px; height: 100px;">
            <font size="32px"><a href="hc_main">시간표</a> </font>
         </button>
      </div>
   </span>
</body>
</html>