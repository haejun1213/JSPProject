<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="member.*" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

if (id == null || password == null) {
	response.sendRedirect(request.getContextPath() + "/common/errorPage.jsp?loginError=1");
} else if (id.isEmpty() || password.isEmpty()) {
	response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp?loginError=1");
} else {

	final String adminId = "admin";
	final String adminPwd = "1234";

	if (id.equals(adminId) && password.equals(adminPwd)) {

		session.setAttribute("AdminId", adminId);
		session.setAttribute("AdminName", "관리자");
		response.sendRedirect(request.getContextPath() + "/admin/main.jsp");
		
	} else {

		MemberService service = new MemberService(new MemberDAO());
		Member member = service.login(id, password);
		if (member != null) {
			session.setAttribute("MemberId", member.getId());
			session.setAttribute("MemberName", member.getNickname());
			session.setAttribute("MemberNo", member.getNo());
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/member/loginPage.jsp?loginError=1");
		}
	}
}
%>