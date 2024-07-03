<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/isAdminLoggedin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<ul>
		<li><a href="<%= request.getContextPath() %>/member/main.jsp">회원 관리</a></li>
		<li><a href="<%= request.getContextPath() %>/book/main.jsp">도서 관리</a></li>
	</ul>
	<%@ include file="/common/footer.jsp"%>
</body>
</html>