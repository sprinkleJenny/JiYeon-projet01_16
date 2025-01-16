<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	String id = request.getParameter("id");
	dao.deleteMemberById(id);
%>
<script>
	alert("삭제되었습니다!");
	location.href="management.jsp";
</script>