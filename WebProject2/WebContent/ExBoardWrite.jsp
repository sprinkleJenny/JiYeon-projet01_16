<%@page import="dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginId")==null){
%>
	<script>
		alert("로그인 하세요!");
		location.href="ExLogin.jsp";
	</script>
<% } %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>새 글쓰기</h1>
	<form action="ExBoardWriteAction.jsp">
		제목 : <input type="text" name="title"/><br/>
		내용 : <textarea name="content"></textarea><br/>
		<input type="submit" value="작성완료"/>
	</form>
</body>
</html>