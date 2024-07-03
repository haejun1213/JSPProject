<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="book.*"
	import="book.haejun.*"
	import="book.oracle.*"
	import="cart.*"
	import="member.*"
	import="java.util.List"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/isLoggedin.jsp" %>
<%


	CartService cartService = new HJCartService(new OracleCartDAO());
	BookService bookService = new HaejunBookService(new OracleBookDAO());
	MemberService memberService = new MemberService(new MemberDAO());
	List<CartItem> itemList = cartService.listAll(memberNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/common/header.jsp"%>
<h2>주문하기</h2>
	<h4>도서목록</h4>
	<table border = 1>
	<tr><th>순번</th><th>책제목</th><th>가격</th><th>수량</th></tr>
	<%
	int numItems = 0, totalPrice = 0, i = 0;
	
	for(CartItem item : itemList) {
		Book book = bookService.read(item.getBookId());
		numItems += item.getQuantity();
		totalPrice += book.getPrice() * item.getQuantity(); 
		i++;
	
	%>
	<tr><th><%= i%></th><th><%= book.getTitle()%></th><th><%= book.getPrice()%></th><th><%= item.getQuantity()%></th></tr>
	<% } %>
	</table>
	<p> 총 상품 가격 : <%= String.format("%d", totalPrice) %>원 (총 <%=numItems %>권 )</p>
	<%
		Member member = memberService.read(memberNo);
	%>
	
	<h4>배송정보</h4>
	이름 : <%= member.getNickname() %><br>
	<form action="order.jsp" method="post">
		<input type= "hidden" name="memberNo" value="<%=memberNo %>">
		모바일 : <input type= "text" name="mobile" value="<%=member.get %>">
		이메일 주소 : <input type= "text" name= "email" value="<%=member %>">
		주소 : <input type= "text" name="address" value="<%=member %>">
		<input type= "checkbox" name="modifyMember" value = "<%=member %>">회원 정보 수정<br>
		<input type= "submit" value="주문">
	</form>
</body>
</html>