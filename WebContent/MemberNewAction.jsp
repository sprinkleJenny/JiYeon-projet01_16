<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int point = 1000;
	
	MemberDao dao = new MemberDao();
	try{
		dao.memberNew(id, pw, name, point);
	
%>
	<script>
		alert("가입되었습니다.로그인 해주세요");
		location.href ="login.jsp";
	</script>
<%

	}catch(Exception e){
		out.println("<script>alert('오류 발생: " + e.getMessage()+"'); history.back();</script>");
		return;
	}
%>