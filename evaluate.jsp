<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"  %>
<html>
<head>
   <title>수강신청 조회</title>
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
<div align="center"> <br>현재 수강 신청 중인 수업은 평가할 수 없습니다. </div>
   <table width="75%" align="center" id = "select">
   <br>
   <tr>
      <th>수강년도</th>
      <th>과목번호</th>
      <th>과목명</th>
      <th>수업평가</th>
   </tr>
   <%
      Connection myConn = null;
      Statement stmt = null;
      CallableStatement ntmt = null;
      ResultSet myResultSet = null;
      ResultSet sResultSet = null;
      String mySQL = "";
      String sSQL = "";
      String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
      String user = "c##ty"; 
      String passwd = "1811184";
      String dbdriver = "oracle.jdbc.driver.OracleDriver";
      
      
      
      try {
         Class.forName(dbdriver);
         myConn =  DriverManager.getConnection (dburl, user, passwd);
         stmt = myConn.createStatement();    
       } catch(SQLException ex) {
          System.err.println("SQLException: " + ex.getMessage());
       }
       mySQL = "select distinct t.t_year, t.t_semester, e.c_id, c.c_name from teach t, enroll e, course c where e.c_id not in (select e.c_id from enroll e where e.t_semester = Date2EnrollSemester(sysdate) and e.t_year = Date2EnrollYear(sysdate)) and e.s_id = '" + session_id + "' and c.c_id = e.c_id and t.t_year = e.t_year and t.t_semester = e.t_semester";
       myResultSet = stmt.executeQuery(mySQL);

      
      if (myResultSet != null) {
         while (myResultSet.next()) {   
            String c_id = myResultSet.getString("c_id");       
            String c_name = myResultSet.getString("c_name");
            int t_year = myResultSet.getInt("t_year");
            ntmt = myConn.prepareCall("{? =call beenEval(?,?)}");
            
            ntmt.setString(2, session_id);
            ntmt.setString(3, c_id);
            
            ntmt.registerOutParameter(1, java.sql.Types.INTEGER);
            
            ntmt.execute();
            int t = ntmt.getInt(1);
      %>
      <tr>
        <td align="center"><%= t_year %></td>
        <td align="center"><%= c_id %></td>
        <td align="center"><%= c_name %></td>
        <%
        if(t == 0){
        %>
        <td align="center">완료</td>
        <%}else{ %>
        <td align="center"><a id="Wcolor"
				href="evaluate2.jsp?c_id=<%=c_id%>&c_name=<%=c_name%>">
					평가</a></td>
					<%} %>
      </tr>
      <%
        }
      }
      ntmt.close();
      stmt.close();  myConn.close();   
      %>
   </table>

 
</body>
</html>