<%@ page contentType="text/html; charset=EUC-KR" %>

<HTML>
<head>
<title>수강신청 시스템 로그인</title>
</head>

<BODY>
<table width="80%" align="center" bgcolor="#FFFF99" border>
<FORM method="post" action="login_verify.jsp">

<tr>
<td>
<div align="center">ID</div>
</td>
<td>
<div align="center"><input type="text" name="userID"></div>
</td>
</tr>
<tr>
<td>
<div align="center">PW</div>
</td>
<td>
<div align="center"><input type="password" name="userPassword"></div>
</td>
</tr>

<tr>
<td colspan=2> <div align="center">
<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인">
<INPUT TYPE="RESET" VALUE="취소" onClick="location.href='main.jsp'">
</div></td>
</tr>

</FORM>
</table>
</BODY>

</HTML>