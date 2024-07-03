<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="book.*"
    import="book.haejun.*"
    import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	
	//*************************************** 골bin코드
	if(no == "" || id == null || title == null || author == null || publisher == null || price == null) {
		response.sendRedirect("insertPage.jsp");
	} else {
		BookService service = new HaejunBookService(new OracleBookDAO());
		Book member = new Book(id, title, author, publisher, Integer.parseInt(price));
		if (service.insert(member)) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("insertPage.jsp");
		}
	}
%>
