<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	
	<%
		//String error = request.getParameter("loginError");
		//if(error != null && error.equals(("1"))) {
		if(request.getParameter("loginError") != null)	{
	%>
	
	<script>
		alert("로그인 실패")
	</script>
	
	<%
		}
	%>
	
	<form action = "login.jsp" method = "post">
		<input type = "text" name = "id" placeholder = "아이디 입력"><br>
		<input type = "password" name = "password" placeholder = "비밀번호 입력"><br>
		<input type = "submit" value="로그인">
	</form>
</body>
</html>