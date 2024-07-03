<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	if(noStr == null){
		response.sendRedirect("main.jsp");
	} else {
		BookService service = new HaejunBookService(new OracleBookDAO());
		if(service.remove(Integer.parseInt(noStr))){
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("detailPage.jsp?no = " + noStr);	
		}
	}
%>
