<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
    
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
	<h1>도서 관리 메인 페이지</h1>
	<a href ="insertPage.jsp"><button>도서 등록</button></a>
	<br>
	<h3>도서 목록</h3>
	
	<% if(bookList.size() == 0) { %>	
	<p>등록되어 있는 도서가 없습니다.</p>
	<% } else { %>
	<table border = "1">
		<tr><th>도서번호</th><th>도서아이디</th><th>제목</th><th>저자</th><th>출판사</th><th>가격</th><th>등록일</th></tr>
		<% for(Book book : bookList) { %>
			<tr>
				<th><%= book.getNo() %></th>
				<td><a href="detailPage.jsp?no=<%=book.getNo()%>"><%= book.getBookId() %></a></td>
				<td><%= book.getTitle() %></td>
				<td><%= book.getAuthor() %></td>
				<td><%= book.getPublisher() %></td>
				<td><%= book.getPrice() %></td>
				<td><%= book.getRegdate() %></td>
			</tr>
		<% } %>
	</table>
	<% } %>
</body>
</html>