<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
	pageEncoding="UTF-8"%>
	
	<%@ include file = "/common/isLoggedin.jsp" %>
    
 <%
 	//CartService service = new HJCartService(new ListCartDAO());
 	CartService service = new HJCartService(new OracleCartDAO());
 	
 	String bookNoStr = request.getParameter("no");
 	
 	if(bookNoStr == null || bookNoStr.isEmpty()) {
 		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookNoError=1");
 		return;
 	}

 	if(service.add(new CartItem(memberNo, Integer.parseInt(bookNoStr), 1))) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else{
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookNoError=1");
	}

 	
 	
 	
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>