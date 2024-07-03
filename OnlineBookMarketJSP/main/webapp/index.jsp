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
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "/common/header.jsp" %>
	<h3>도서목록</h3>
	<% if(bookList.size() == 0) { %>	
	<p>등록되어 있는 도서가 없습니다.</p>
	<% } else { %>
	<table border = "1">
		<tr><th>도서번호</th><th>제목</th><th>저자</th><th>출판사</th><th>가격</th><th>재고</th></tr>
		<% for(Book book : bookList) { %>
			<tr>
				<th><%= book.getNo() %></th>
				<td><a href="<%= request.getContextPath() %>/book/detailPage.jsp?no=<%=book.getNo()%>"><%= book.getTitle() %></a></td>
				<td><%= book.getAuthor() %></td>
				<td><%= book.getPublisher() %></td>
				<td><%= String.format("%,d", book.getPrice())%></td>
				<td><%= book.getInventory() %></td>
			</tr>
		<% } %>
	</table>
	<% } %>
	
	<%@ include file = "/common/footer.jsp" %>
</body>
</html>