<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"  %>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>������û ��ȸ</title>
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
	<link rel="stylesheet" href="\main.css">
</head>
<body>
<%  if (session_id==null) { %>
	<script>
		alert("�α��� ���ּ���.");
		location.href = "login.jsp";
	</script> 
<% }
%>
	<nav class="navbar">
		<span class="navbar_toggle"><i class="fa-solid fa-bars"></i></span>
		<div class="navbar_logo">
			<a onClick="window.location.reload()" style="cursor: pointer;">�������ڴ��б�</a>
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
				<li><a href="#">������û �Է�</a></li>
				<li><a href="#">������û ����</a></li>
				<li><a href="#">��û���� ��ȸ</a></li>
				<li><a href="#">���νð�ǥ</a></li>
				<li><a href="#">���� �˻�</a></li>
				<li><a href="#">���� ��</a></li>
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



















<html>
<head>
   <title></title>
</head>
<body>
<%@ include file="top.jsp" %>

<div align="center"> <br>���� ���� ��û ���� ������ ���� �� �����ϴ�. </div>
   <table width="75%" align="center" id = "select">
   <br>
   <tr>
      <th>�����⵵</th>
      <th>�����ȣ</th>
      <th>�����</th>
      <th>������</th>
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
        <td align="center">�Ϸ�</td>
        <%}else{ %>
        <td align="center"><a id="Wcolor"
				href="evaluate2.jsp?c_id=<%=c_id%>&c_name=<%=c_name%>">
					��</a></td>
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