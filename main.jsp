<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title>
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
	<link rel="stylesheet" href="main.css">
</head>
<body>
	<nav class="navbar">
		<span class="navbar_toggle"><i class="fa-solid fa-bars"></i></span>
		<div class="navbar_logo">
			<a onClick="window.location.reload()" style="cursor: pointer;">�����ڴ��б�</a>
		</div>
		<div class="navbar_session">
			<jsp:useBean id="userName" class="user.UserInfo" scope="session"/>
			<% if (session_id != null) { %>
			<div><%=session_id %>�� �湮�� ȯ���մϴ�.�� �湮�� ȯ���մϴ�.
			</div>
			<% } else { %>
			<div>�α��� �� ����Ͻʽÿ�.</div>
			<% } %>
		</div>
	</nav>
	<main>
		<aside class="asidebar">
			<ul class="aside_menu">
				<li></li>
				<li><a href="insert.jsp">������û �Է�</a></li>
				<li><a href="select.jsp">������û Ȯ��</a></li>
				<li><a href="timetable.jsp">���νð�ǥ</a></li>
				<li><a href="evaluate.jsp">���� �˻�</a></li>
				<li><a href="condition.jsp">���� ��</a></li>
			</ul>
			<ul class="aside_session">
				<li><%=log%></li>
				<li><a href="">���� ����</a></li>
			</ul>
		</aside>
		<section class="main_section_img">
			<img
				src="https://www.sookmyung.ac.kr/sites/sookmyungkr/images/sub/contents/ui_signature_07.png">
		</section>
	</main>
</body>
</html>