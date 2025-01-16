<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();
	int bno = Integer.parseInt(request.getParameter("bno"));
	dao.deleteBoardByBno(bno);
%>
<script>
	alert("삭제되었습니다."); 
	location.href = "ExBoard.jsp"; 
</script>