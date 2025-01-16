<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	BoardDao dao = new BoardDao();
	int bno = Integer.parseInt(request.getParameter("bno"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	dao.modifyBoard(bno, title, content);
%>
<script>
	alert("수정되었습니다."); 
	location.href = "ExBoardDetail.jsp?bno=<%=bno%>"; 
</script>