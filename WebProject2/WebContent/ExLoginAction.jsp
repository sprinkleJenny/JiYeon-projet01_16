<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = new MemberDao();
	boolean result = dao.loginCheck(id, pw);
	
	if(result){
		session.setAttribute("loginId" , id); //키, 값
%>
	<script>
		alert("로그인 되었습니다.")
		location.href = "ExBoard.jsp";
	</script> 
<% 
	} else { 
%>
	<script>
		alert("로그인 실패");
		/* location.href="ExLogin.jsp" */
		history.back();
	</script>

<% 
	} 
%>