<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" %> 
<%
String session_id = (String)session.getAttribute("user");
String log;
if (session_id==null) log="<a href=login.jsp>�α���</a>";
else log="<a href=logout.jsp>�α׾ƿ�</a>";
%>

<!-- 
<table width="75%" align="center" bgcolor="#FFFF99" border>
<tr>
<td align="center"><b><%=log%></b></td>
<td align="center"><b><a href="update.jsp">����� ���� ����</b></td>
<td align="center"><b><a href="insert.jsp">������û �Է�</b></td>
<td align="center"><b><a href="select.jsp">������û Ȯ��</b></td>
<td align="center"><b><a href="timetable.jsp">�ð�ǥ Ȯ��</b></td>
<td align="center"><b><a href="evaluate.jsp">���� ��</b></td>
<td align="center"><b><a href="condition.jsp">���� �˻�</b></td>
</tr>
</table>

 -->
