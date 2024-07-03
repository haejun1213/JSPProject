<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.List"
	import="java.util.Arrays"
	import="java.util.*"
	import="java.uril.concurrent.*"
	import="member.Member"
    import="member.MemberDAO"
	import="member.MemberService"
    pageEncoding="UTF-8"%>
<%
	MemberService service = new MemberService(new MemberDAO());
	List<Member> memberList = service.listAll();
	memberList.sort(Comparator.comparing(j -> j.getNo()));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>회원 관리</title>
</head>
<body>
	<h1>회원 관리 메인 페이지</h1>
	<br>
	<h3>회원 목록</h3>
	<a href="joinPage.jsp"><button>회원 등록</button></a>
	<% if(memberList.size() == 0) { %>	
	<p>등록되어 있는 회원이 없습니다.</p>
	<% } else { %>
	<table>
		<tr><th>회원번호</th><th>아이디</th><th>닉네임</th><th>등록일</th></tr>
		<% for(Member member : memberList) { %>
			<tr>
				<td><%= member.getNo() %></td>
				<td><a href="detailPage.jsp?no=<%=member.getNo()%>"><%= member.getId() %></a></td>
				<td><%= member.getNickname() %></td>
				<td><%= member.getRegdate() %></td>
			</tr>
		<% } %>
	</table>
	<% } %>
</body>
</html>