<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //무효한다는 것
%>
<script>
	alert("로그아웃 되었습니다. 다시 로그인해주세요");
	location.href="ExBoard.jsp";
</script>