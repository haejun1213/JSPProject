<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
    
    <%@ include file = "/common/isLoggedin.jsp" %>
<%
	String noStr = request.getParameter("no");
	if(noStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		MemberService service = new MemberService(new MemberDAO());
		Member member = service.read(Integer.parseInt(noStr));
		if(member == null) {
			response.sendRedirect("main.jsp");
		} else {
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 페이지</title>
</head>

<body>
<%@ include file = "/common/header.jsp" %>
	<h3>회원 삭제</h3>
		<ul>
		<li>회원 번호 : <%= member.getNo() %></li>
		<li>아이디 &nbsp;: <%= member.getId() %></li>
		<li>비밀 번호: <%= member.getPassword() %></li>
		<li>닉네임 &nbsp;: <%= member.getNickname() %></li>
		<li>등록일 &nbsp;: <%= member.getRegdate() %></li>
	</ul>
	<br>
	<a href="remove.jsp?no=<%= member.getNo() %>"><button>탈퇴</button></a>
	<a href="detailPage.jsp?no=<%= member.getNo() %>"><button>취소</button></a>
	<%@ include file = "/common/footer.jsp" %>
</body>
</html>
<% } 
} %>