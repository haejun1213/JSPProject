<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="member.*"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	if(id == null || password == null || nickname == null) {
		response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=1");
		
	} else if(id.isEmpty() || password.isEmpty() || nickname.isEmpty()) {
		response.sendRedirect(request.getContextPath() + "/member/joinPage.jsp?joinError=1");
		
	} else {
		MemberService service = new MemberService(new MemberDAO());
		Member member = new Member(id, password, nickname);
		if (service.regist(member)) {
			response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?joinError=2");
		}
	}
%>
