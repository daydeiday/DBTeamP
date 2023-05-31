<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% session.invalidate(); %>
<!DOCTYPE html>
<script>
alert("로그아웃 되었습니다.");
location.href="main.jsp";
</script>