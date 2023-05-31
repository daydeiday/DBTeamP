<<<<<<< Updated upstream
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>
<body>

<%@ include file="top.jsp" %>
<jsp:useBean id="userName" class="user.UserInfo" scope="session"/>

<table width="75%" align="center" height="100%">
<% if (session_id != null){ 
%>
<tr>
<td align="center"><jsp:getProperty name="userName" property="user_ID"/>님 방문을 환영합니다.</td>
</tr>

<%} else{ %>
<tr>
<td align="center">로그인한 후 사용하세요.</td>
</tr>
<%
}
%>

</table>

</body>
=======
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
	<meta data-rh="true" name="viewport"
		content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap"
		rel="stylesheet">
	<script src="https://kit.fontawesome.com/98e3c5fbec.js"
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="\enroll\main.css">
</head>
<body>
	<nav class="navbar">
		<span class="navbar_toggle"><i class="fa-solid fa-bars"></i></span>
		<div class="navbar_logo">
			<a onClick="window.location.reload()" style="cursor: pointer;">숙제여자대학교</a>
		</div>
		<div class="navbar_session">
			<jsp:useBean id="userName" class="user.UserInfo" scope="session"/>
			<% if (session_id != null) { %>
			<div><%=session_id %>님 방문을 환영합니다.님 방문을 환영합니다.
			</div>
			<% } else { %>
			<div>로그인 후 사용하십시오.</div>
			<% } %>
		</div>
	</nav>
	<main>
		<aside class="asidebar">
			<ul class="aside_menu">
				<li></li>
				<li><a href="#">수강신청 입력</a></li>
				<li><a href="#">수강신청 삭제</a></li>
				<li><a href="#">신청내역 조회</a></li>
				<li><a href="#">개인시간표</a></li>
				<li><a href="#">강의 검색</a></li>
				<li><a href="#">강의 평가</a></li>
			</ul>
			<ul class="aside_session">
				<li><%=log%></li>
				<li><a href="">정보 수정</a></li>
			</ul>
		</aside>
		<section class="main_section_img">
			<img
				src="https://www.sookmyung.ac.kr/sites/sookmyungkr/images/sub/contents/ui_signature_07.png">
		</section>
	</main>
</body>
>>>>>>> Stashed changes
</html>