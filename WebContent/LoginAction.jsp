<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = new MemberDao();
	boolean result = dao.loginCheck(id, pw);
	System.out.println(id +", " +pw);
	System.out.println("result : " + result);
	
	if(!"admin".equals(id)){
		session.setAttribute("loginId", id);
%>
		<script>
			alert("로그인 되었습니다.")
			location.href = "main.jsp";
		</script>
	<% 
		} else {
			session.setAttribute("loginId", id);
	
	%>
		<script>
			location.href = "management.jsp";
		</script>
	<%
		}
	%>

