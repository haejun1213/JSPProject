<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	if(noStr == null || noStr.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?noError=1");
	} else {
		BookService service = new HaejunBookService(new OracleBookDAO());
		Book book = service.read(Integer.parseInt(noStr));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세 페이지</title>
</head>
<body>
<%@ include file = "/common/header.jsp" %>
	<h3>도서 상세 정보</h3>
<% if(book == null) {  %>
	<p>해당 도서 정보가 없습니다.</p>
<% } else { %>
			<ul>
				<li>도서 번호 : <%= book.getNo() %></li>
				<li>제목 : <%= book.getTitle() %></li>
				<li>저자 : <%= book.getAuthor() %></li>
				<li>출판사 : <%= book.getPublisher() %></li>
				<li>가격 : <%= book.getPrice() %></li>
				<li>재고 : <%= book.getInventory() %></li>
			</ul>
			<br>
			<%
				if(session.getAttribute("AdminId") != null) { %>
					<a href="modifyPage.jsp?no=<%= book.getNo() %>"><button>도서정보수정</button></a>
					<a href="removePage.jsp?no=<%= book.getNo() %>"><button>도서 삭제</button></a>
					<a href="<%=request.getContextPath() %>/book/main.jsp"><button>뒤로가기</button></a>
					<%
				} else if(session.getAttribute("MemberId") != null) { %>
					<a href="<%=request.getContextPath() %>/cart/add.jsp?no=<%= book.getNo() %>"><button>장바구니 담기</button></a>
					<a href="../"><button>뒤로가기</button></a>
				<% } %>
			
<% } %>
<%@ include file = "/common/footer.jsp" %>
</body>
</html>
<% } %>