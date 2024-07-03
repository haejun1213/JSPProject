<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
    
<%
 	String noStr = request.getParameter("no");
	if(noStr == null) {
		response.sendRedirect("main.jsp");
	} else {
		BookService service = new HaejunBookService(new OracleBookDAO());
		Book book = service.read(Integer.parseInt(noStr)); 
		if(book == null) {
			response.sendRedirect("main.jsp");
		} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 페이지</title>
</head>
<body>
<h3>회원 정보 수정</h3>
	<form action="insert.jsp" method="post">
		도서 아이디 : <input type = "text" name = "id" value="<%= book.getBookId() %>" placeholder="도서 아이디 입력"><br>
		제목 : <input type = "text" name = "title" value="<%= book.getTitle() %>" placeholder="제목 입력"><br>
		저자 : <input type = "text" name = "author" value="<%= book.getAuthor() %>" placeholder="저자 입력"><br>
		출판사 : <input type = "text" name = "publisher" value="<%= book.getPublisher() %>" placeholder="출판사 입력"><br>
		가격 : <input type = "text" name = "price" value="<%= book.getPrice() %>" placeholder="가격 입력"><br>

		<a href = "detailPage.jsp"><input type="button" value="정보 수정"><input type="button" value="취소"></a>
	</form>
</body>
</html>
<%
	}
}
%>