<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청 입력</title>
</head>
<body>

<%@ include file="top.jsp" %>
<%
if (session_id==null) response.sendRedirect("login.jsp");
char[] c_day = {'월','화','수','목','금'};
%>

<table width="75%" align="center" border>
<br>
<tr><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th>
<th>요일</th><th>교시</th><th>수강신청</th></tr>
<%
Connection myConn = null; Statement stmt = null;
ResultSet myResultSet = null; String mySQL = "";
String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
String user="c##ty"; String passwd="1811184";
String dbdriver = "oracle.jdbc.driver.OracleDriver"; 
try {
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
} catch(SQLException ex) {
System.err.println("SQLException: " + ex.getMessage());
}
mySQL = "select distinct c.c_id, c.c_id_no, c.c_name, c.c_unit, t.t_day, t.t_time from course c, teach t where t.t_year = Date2EnrollYear(SYSDATE) and t.t_semester = Date2EnrollSemester(SYSDATE) and c.c_id = t.c_id and c.c_id_no = t.c_id_no";
myResultSet = stmt.executeQuery(mySQL);
if (myResultSet != null) {
while (myResultSet.next()) {
String c_id = myResultSet.getString("c_id");
int c_id_no = myResultSet.getInt("c_id_no");
String c_name = myResultSet.getString("c_name");
int c_unit = myResultSet.getInt("c_unit");
int t_day = myResultSet.getInt("t_day");
int t_time = myResultSet.getInt("t_time");
%>
<tr>
<td align="center"><%= c_id %></td> <td align="center"><%= c_id_no %></td> 
<td align="center"><%= c_name %></td><td align="center"><%= c_unit %></td>
<td align="center"><%= c_day[t_day-1] %></td>
<td align="center"><%= t_time %></td>


<td align="center"><a href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= 
c_id_no %>">신청</a></td>
</tr>
<%
}
}
stmt.close(); myConn.close();
%>
</table></body></html>


</body>
</html>