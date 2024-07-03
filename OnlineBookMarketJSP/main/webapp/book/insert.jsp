<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="book.*"
    import="book.haejun.*"
    import="book.oracle.*"
    pageEncoding="UTF-8"%>
<%
	//String no = request.getParameter("no");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	String inventory = request.getParameter("inventory");
	
	//*************************************** 골bin코드
	if(/*no == "" || no == null ||*/ title == null || author == null || publisher == null || price == null || inventory == null || title == "" || author == "" || publisher == "" || price == "" || inventory == "") {
		response.sendRedirect("insertPage.jsp");
	} else {
		BookService service = new HaejunBookService(new OracleBookDAO());
		Book book = new Book(title, author, publisher, Integer.parseInt(price), Integer.parseInt(inventory));
		if (service.insert(book)) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("insertPage.jsp");
		}
	}
%>
