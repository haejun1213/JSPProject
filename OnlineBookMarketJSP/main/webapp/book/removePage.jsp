<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" import="book.*"
	import="book.haejun.HaejunBookService" 
	import="book.oracle.*"
	pageEncoding="UTF-8"%>
<%
String noStr = request.getParameter("no");
if (noStr == null) {
	response.sendRedirect("main.jsp");
} else {
	BookService service = new HaejunBookService(new OracleBookDAO());
	Book book = service.read(Integer.parseInt(noStr));
	if (book == null) {
		response.sendRedirect("main.jsp");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 삭제 페이지</title>
</head>
<body>
	<h3>도서 삭제</h3>
	<ul>
		<li>도서 번호 : <%=book.getNo()%></li>
		<li>제목 : <%=book.getTitle()%></li>
		<li>저자 : <%=book.getAuthor()%></li>
		<li>출판사 : <%=book.getPublisher()%></li>
		<li>가격 : <%=book.getPrice()%></li>
		<li>등록일 : <%=book.getInventory()%></li>
	</ul>
	<br>
	<a href="remove.jsp?no=<%=book.getNo()%>"><button>삭제</button></a>
	<a href="detailPage.jsp?no=<%=book.getNo()%>"><button>취소</button></a>
</body>
</html>
<%
}
}
%>