<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
    pageEncoding="UTF-8"%>
    <%@ include file = "/common/isLoggedin.jsp" %>
<%
	//CartService service = new HJCartService(new ListCartDAO());
	CartService service = new HJCartService(new OracleCartDAO());

if(service.clear(memberNo)){
	response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
} else {
	response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookNoError=1");
}
%>
