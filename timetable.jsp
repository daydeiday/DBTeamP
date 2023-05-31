<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"  %>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<style>
table {
	border: 2px solid #d2d2d2;
	border-collapse: collapse;
	font-size: 0.9em;
}

th, td {
	border: 1px solid #d2d2d2;
	border-collapse: collapse;
}

th {
	height: 5px;
}

td {
	width: 75px;
	height: 60px;
}
</style>
</head>
<body>
<%@ include file="top.jsp" %>
<%  if (session_id==null) { %>
	<script>
		alert("로그인 해주세요.");
		location.href = "login.jsp";
	</script> 
<% }
%>
	<table width=400 height="600" style="color: #121212">
		<caption>▶ 강의 시간표 ◀</caption>
		<tr width=19%>
			<th></th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
		</tr>
	<%
      Connection myConn = null;
      Statement stmt = null;
      ResultSet myResultSet = null;
      String mySQL = "";
      String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
      String user = "c##ty"; 
      String passwd = "1811184";
      String dbdriver = "oracle.jdbc.driver.OracleDriver";
      String[][] timetable = new String[7][10];
      
      try {
          Class.forName(dbdriver);
          myConn =  DriverManager.getConnection (dburl, user, passwd);
          stmt = myConn.createStatement();   
        } catch(SQLException ex) {
           System.err.println("SQLException: " + ex.getMessage());
        }
        mySQL = "select e.c_id, e.c_id_no, c.c_name, c.c_unit, t.t_day, t.t_time, t.t_place from course c, enroll e, teach t where e.s_id='"+ session_id +"' and e.c_id = c.c_id and c.c_id = t.c_id and e.c_id_no = c.c_id_no and c.c_id_no =  t.c_id_no and e.t_semester = Date2EnrollSemester(sysdate) and e.t_year = Date2EnrollYear(sysdate) ORDER BY t_day,t_time ";
       myResultSet = stmt.executeQuery(mySQL);
       
       if (myResultSet != null) {
          while (myResultSet.next()) {   
             String c_id = myResultSet.getString("c_id");
             int c_id_no = myResultSet.getInt("c_id_no");         
             String c_name = myResultSet.getString("c_name");
             int c_unit = myResultSet.getInt("c_unit"); 
             int c_day = myResultSet.getInt("t_day");
             int c_time = myResultSet.getInt("t_time");
             timetable[c_day][c_time] = c_name;
         }
      }
       
       for (int c_time = 1; c_time <= 9; c_time++) {
           out.print("<tr>");
           out.print("<th>" + c_time + "</th>");
           for (int c_day = 1; c_day < 6; c_day++) {
               String subject = timetable[c_day][c_time];
               if (subject != null) {
                   out.print("<td>" + subject + "</td>");
               } else {
                   out.print("<td></td>");
               }
           }
           out.print("</tr>");
       }
       
      stmt.close();  myConn.close();   
      %>
	</table>

</body>
</html>