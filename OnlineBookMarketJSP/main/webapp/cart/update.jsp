<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="cart.*"
    pageEncoding="UTF-8"%>
    
    <%@ include file = "/common/isLoggedin.jsp" %>
<%
 
String idStr = request.getParameter("id");
String quanStr = request.getParameter("quantity");

if(idStr == null || idStr.isEmpty() || quanStr == null ||quanStr.isEmpty()) {
	response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookNoError=1");
	return;
}
//CartService service = new HJCartService(new ListCartDAO());
	CartService service = new HJCartService(new OracleCartDAO());
if(Integer.parseInt(quanStr) <= 0) {
	if(service.remove(Integer.parseInt(idStr), memberNo)) {
		response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
	} else{
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookNoError=1");
	}
	return;  
}

if(service.update(Integer.parseInt(idStr), memberNo, Integer.parseInt(quanStr))) {
	response.sendRedirect(request.getContextPath() + "/cart/main.jsp");
} else{
	response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?bookNoError=1");
}

%>