<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<HTML>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>������û �ý��� �α���</title>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="\login.css">
</head>
<body>
	<div class="outer">
		<div class="inner">
			<div class="logo-wrap">
				<div id="login-logo">LOGIN</div>
			</div>
			<div class="login-form">
				<form method="post" action="login_verify.jsp">
					<input type="text" name="userID" placeholder="���̵�"/>
					<input type="password" name="userPassword" placeholder="��й�ȣ"/>
					<input class="btn-login" TYPE="SUBMIT" NAME="Submit" VALUE="�α���"/>
					<input class="btn-reset" TYPE="RESET" VALUE="���" onClick="location.href='main.jsp'"/>
				</form>
			</div>
		</div>
	</div>
</body>
</HTML>