<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/isAdminLoggedin.jsp"%>
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
<title>도서 정보 수정 페이지</title>
</head>
<body>
<%@ include file = "../common/header.jsp" %>
<h3>도서 정보 수정</h3>
	<form action="modify.jsp" method="post">
		제목 : <input type = "text" name = "title" value="<%= book.getTitle() %>" placeholder="제목 입력"><br>
		저자 : <input type = "text" name = "author" value="<%= book.getAuthor() %>" placeholder="저자 입력"><br>
		출판사 : <input type = "text" name = "publisher" value="<%= book.getPublisher() %>" placeholder="출판사 입력"><br>
		가격 : <input type = "text" name = "price" value="<%= book.getPrice() %>" placeholder="가격 입력"><br>

		<a href = "detailPage.jsp?no=<%= Integer.parseInt(noStr)%>"><input type="submit" value="정보 수정"><input type="button" value="취소"></a>
	</form>
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>
<%
	}
}
%>