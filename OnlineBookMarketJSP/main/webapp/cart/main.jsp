<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="cart.*"
    import="book.*"
    import="book.oracle.*"
    import="book.haejun.*"
    import="java.util.List"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/isLoggedin.jsp" %>
<%
//CartService service = new HJCartService(new ListCartDAO());
	CartService service = new HJCartService(new OracleCartDAO());
List<CartItem> itemList = service.listAll(memberNo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	input[type="number"] {
		width : 2.5em
	}
	
	table {
		border-collapse : collapsed;
	}
</style>
</head>
<body>
<%@ include file = "/common/header.jsp" %>
<h3>장바구니</h3>
<% if (itemList.size() == 0) { %>
<p>장바구니가 비어있습니다</p>
<% } else { 
	BookService bookService = new HaejunBookService(new OracleBookDAO());
%>
	<table border = 1>
		<tr><th>ID</th><th>도서 번호</th><th>제목</th><th>저자</th><th>출판사</th><th>가격</th><th>수량</th></tr>
		<% int numItems = 0, totalPrice = 0;
		for (CartItem item : itemList) { 
			Book book = bookService.read(item.getBookId());
			numItems += item.getQuantity();
			totalPrice += book.getPrice() * item.getQuantity();
		%>
			<tr>
			<th><%= item.getId() %></th>
			<td><%= item.getBookId() %></td>
			<td><a href="<%= request.getContextPath() %>/book/detailPage.jsp?no=<%=book.getNo()%>"><%= book.getTitle() %></a></td>
			<td><%= book.getAuthor() %></td>
			<td><%= book.getPublisher() %></td>
			<td><%= String.format("%,d", book.getPrice()) %></td>
			<td>
			<form action = "<%= request.getContextPath() %>/cart/update.jsp" method = "post" onsubmit = "return isValidForm()">
				<input type="hidden" name = "id" value="<%= item.getId() %>">
				<input type="number" name="quantity" value="<%=item.getQuantity()%>">
				<input type="submit" value="수정">			
			</form>
			</td>
			<td><button onclick="askConfirmRemove(<%= item.getId()%>)">삭제</button></td>
			</tr>  
			
		<% } %>
    </table>
    <br>
    <p> 총 가격 : <%= String.format("%,d",totalPrice) %> 원(<%= numItems %> 권)</p>
    <button onclick="askConfirmOrder()">주문하기</button>
    <button onclick="askConfirmClear()">장바구니 비우기</button>
    
    
    
<% } %>

<%@ include file = "/common/footer.jsp" %>
<script>
	function askConfirmOrder() {
		if(confirm("장바구니의 모든 도서를 주문합니다."))
			location = "<%= request.getContextPath() %>/order/orderPage.jsp"
	}
	
	function askConfirmClear() {
		if(confirm("장바구니의 모든 도서를 삭제합니다."))
			location = "<%= request.getContextPath() %>/cart/clear.jsp"
	}
	
	function askConfirmRemove(cartId) {
		if(confirm(cartId + "번 도서를 장바구니에서 도서를 삭제합니다."))
			location = "<%= request.getContextPath() %>/cart/remove.jsp?id=" + cartId;
	}
	
</script>
</body>
</html>