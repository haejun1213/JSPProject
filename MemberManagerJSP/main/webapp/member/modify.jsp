<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*"
    pageEncoding="UTF-8"%>
<%   
	String noStr = request.getParameter("no");
	String oldPwd = request.getParameter("old_password");
	String newPwd = request.getParameter("new_password");
	String nickname = request.getParameter("nickname");
	 
	if(noStr == null) {
	 	response.sendRedirect("main.jsp");
	}   
	else if(oldPwd == null || newPwd == null || nickname == null) {
	 	response.sendRedirect("detailPage.jsp?no=" + noStr);
	} else {
	 	MemberService service = new MemberService(new MemberDAO());
	 	Member member = new Member(null, newPwd, nickname);
	 	member.setNo(Integer.parseInt(noStr));
	 	if (service.edit(member, oldPwd)) {
	 		response.sendRedirect("detailPage.jsp?no=" + noStr);
	 	} else {
	 		response.sendRedirect("modifyPage.jsp?no=" + noStr);
	 	}
	}
%>   
