<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>

<%String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");

%>
<!DOCTYPE html>


<%
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user="c##ty";
String passwd="1811184"; // 비밀번호
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Connection conn = null;
Statement stmt = null, mySQL = null;

try{
Class.forName(dbdriver);
out.println("jdbc driver 로딩 성공");
conn = DriverManager.getConnection(dburl, user, passwd);
out.println("오라클 연결 성공");
} catch (ClassNotFoundException e){
System.out.println("driver 로딩 실패");
} catch (SQLException e){
System.out.println("오라클 연결 실패");
System.out.println(e);
}
%>
<%
stmt = conn.createStatement();
String sql = "select s_id from student where s_id='" +userID + "' and s_pwd='" + userPassword + "'";
ResultSet myResultSet = stmt.executeQuery(sql);
if(myResultSet.next()){
	session.setAttribute("user", userID);
	response.sendRedirect("main.jsp");
}else {
	%>
	<script>
		alert("사용자 아이디 혹은 암호가 틀렸습니다.");
		location.href="login.jsp";
	</script>
	<% 
}
	stmt.close();
	conn.close();
	%>
