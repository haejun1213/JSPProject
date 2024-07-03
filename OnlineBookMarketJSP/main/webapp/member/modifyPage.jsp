<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
    
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
<%@ include file = "/common/header.jsp" %>
<title>회원 정보 수정 페이지</title>
</head>
<body>
<h3>회원 정보 수정</h3>
	<form action="modify.jsp" method="post">
		<input type="hidden" name="no" value="<%= member.getNo() %>">
		<input type = "text" name = "id" value="<%= member.getId() %>"placeholder="아이디 입력" disabled><br>
		<input type = "password" name = "old_password" placeholder="기존 비밀번호 입력"><br>
		<input type = "password" name = "new_password" placeholder="새 비밀번호 입력"><br>
		<input type = "text" name = "nickname"  value="<%= member.getNickname() %>" placeholder="닉네임 입력"><br>
		<br>
		<input type ="submit" value ="정보 수정">
		<a href = "detailPage.jsp?no=<%= member.getNo() %>"><input type="button" value="취소"></a>
	</form>
	<%@ include file = "/common/footer.jsp" %>
</body>
</html>
<%
	}
}
%>