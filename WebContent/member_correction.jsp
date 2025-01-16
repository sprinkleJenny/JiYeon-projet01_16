<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	if(session.getAttribute("admin")==null){
 %>
 	<script>
 		alert("로그인하세요!");
 		location.href="login.jsp";
 	</script>
 <% 
	 } else{
		
		session.getAttribute("admin");
	 
 %>
 <% } %>
<%	
	//id

	// dao -> MemberDto
	MemberDao dao = new MemberDao();
	String id = (String)session.getAttribute("admin");
	MemberDto dto = dao.getMemberDtoId(id);
			
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script>
			
		</script>
	</head>
	<body>
		<h1>회원 관리 - 수정관리자</h1>
		<form action="ModifyAction.jsp" method="post">
			ID <input type="text"	id="id" name="id" value="아이디"/><br/>
			PW <input type="text" id="pw" name="pw" value="비밀번호" /><br/>
			Name <input type="text" id="name" name="name" value="이름" /><br/>
			point <input type="text" id="point" name="point" value="포인트" /><br/>
			<input type="submit" id="in_btn" value="제출"/>
		</form>
	</body>
</html>