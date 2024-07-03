<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*"
	import="book.*"
	import="book.haejun.HaejunBookService"
	import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	String inventory = request.getParameter("inventory");
	
	if(noStr == null) {
		response.sendRedirect("main.jsp");
	}
	else if(title == null || author == null || publisher == null || price == null) {
		response.sendRedirect("detailPage.jsp?no=" + noStr);
	} else {
		BookService service = new HaejunBookService(new OracleBookDAO());
		Book book = new Book(title, author, publisher, Integer.parseInt(price), Integer.parseInt(inventory));
		book.setNo(Integer.parseInt(noStr));
		if (service.edit(book)) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("modifyPage.jsp?no=" + noStr);
		}
	}
%>
