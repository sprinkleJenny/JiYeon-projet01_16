<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	request.setCharacterEncoding("utf-8");
	MemberDao dao = new MemberDao();
	String id = request.getParameter("id");
	
%> 
 
 <script>
	alert("수정되었습니다."); 
	location.href = "member_correction.jsp?id=<%=id%>"; 
</script>