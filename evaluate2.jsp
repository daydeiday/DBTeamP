<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수업평가</title>
</head>
<body>
<%@ include file="top.jsp"%>
<%
String c_id = request.getParameter("c_id");
String c_name = request.getParameter("c_name");
%>
   <form action="evaluate_verify.jsp">
    수업 코드:<input type="text" name="cid" id="cid" value=<%=c_id %> readonly/>
   <p>강의 점수를 입력해 주세요.</p>
  
   <input type="radio" name="rate" id="rate" value="1" checked="checked">1점
   <input type="radio" name="rate" id="rate" value="2">2점
   <input type="radio" name="rate" id="rate" value="3">3점
   <input type="radio" name="rate" id="rate" value="4">4점
   <input type="radio" name="rate" id="rate" value="5">5점
    <input type="submit" value="확인">
</form>


</body>
</html>