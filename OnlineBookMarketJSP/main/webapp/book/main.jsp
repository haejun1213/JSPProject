<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/isAdminLoggedin.jsp" %>
<%
    BookService service = new HaejunBookService(new OracleBookDAO());
	List<Book> bookList = service.listAll();
	bookList.sort(Comparator.comparing(j -> j.getNo()));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>도서 관리</title>
</head>
<body>
	<%@ include file = "/common/header.jsp" %>
	<h1>도서 관리 메인 페이지</h1>
	<a href ="insertPage.jsp"><button>도서 등록</button></a>
	<br>
	<h3>도서 목록</h3>
	
	<% if(bookList.size() == 0) { %>	
	<p>등록되어 있는 도서가 없습니다.</p>
	<% } else { %>
	<table border = "1">
		<tr><th>도서번호</th><th>제목</th><th>저자</th><th>출판사</th><th>가격</th><th>재고</th></tr>
		<% for(Book book : bookList) { %>
			<tr>
				<td><a href="detailPage.jsp?no=<%=book.getNo()%>"><%= book.getNo() %></a></td>
				<td><%= book.getTitle() %></td>
				<td><%= book.getAuthor() %></td>
				<td><%= book.getPublisher() %></td>
				<td><%= book.getPrice() %></td>
				<td><%= book.getInventory() %></td>
			</tr>
		<% } %>
	</table>
	<% } %>
	<%@ include file = "/common/footer.jsp" %>
</body>
</html>