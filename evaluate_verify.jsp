<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%
int rate = Integer.parseInt(request.getParameter("rate"));

Connection myConn = null;    String	result = null;	
String dburl  = "jdbc:oracle:thin:@localhost:1521:xe";
String user="c##ty";   String passwd="1811184";
String dbdriver = "oracle.jdbc.driver.OracleDriver";    
CallableStatement cstmt;

try {
	Class.forName(dbdriver);
    myConn =  DriverManager.getConnection (dburl, user, passwd);
} catch(SQLException ex) {
	 System.err.println("SQLException: " + ex.getMessage());
}

boolean stu_mode = true;
String r1="";
String session_id= (String)session.getAttribute("user");
String s_id = (String)session.getAttribute("user");
String c_id = request.getParameter("cid");	

cstmt = myConn.prepareCall("{call insertEval(?,?,?,?)}");
cstmt.setString(1, s_id);
cstmt.setString(2, c_id);
cstmt.setInt(3,rate);
cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
try  {  	
	cstmt.execute();	
	r1 = cstmt.getString(4);
%>
<script>	
	alert("<%=r1%>");
	location.href="evaluate.jsp";
</script>
<%
	} catch(SQLException ex) {		
		 System.err.println("SQLException: " + ex.getMessage());
	}  
	finally {
	    if (cstmt != null) 
            try { myConn.commit(); cstmt.close();  myConn.close(); }
 	      catch(SQLException ex) { }
     }





%>

</body>
</html>