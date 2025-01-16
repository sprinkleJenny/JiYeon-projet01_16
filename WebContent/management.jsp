<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
 	if(session.getAttribute("loginId")==null){
 %>
 	<script>
 		alert("로그인하세요!");
 		location.href="login.jsp";
 	</script>
 <% 
	 } else{
		
		session.getAttribute("loginId");
	 
 %>
 <% 
	 }
 %>
<%	
	MemberDao dao = new MemberDao();
	String id = (String)session.getAttribute("loginId");
	MemberDto dto = dao.getMemberDtoId(id);
			
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script>
			 $(function(){
			 	$("#delet").click(function() {
					alert("!");
					location.href="DeleteAction.jsp?id=<%= dto.getId()%>"; 
				});
				$("#write").click(function(){
					alert("!");
					 location.href="ModifyAction.jsp?<%=dto.getId()%>";
				}); 
			/* 	
				$("#start").click(function(){
					$.ajax({
						type : '',
						url : '',
						date : '',
						success : function(data){
							
						},
						error : function(r, s, e){
							alert("[에러] code : " + r.status + 
			        				", messge: "  + r.responseText 
			        				+ ", error : " + e);
					}
				}); */
				
			});
		</script>
		
	</head>
	<body>
		<h1>회원관리</h1>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>PW</td>
				<td>Name</td>
				<td>point</td>
				<td>수정</td>
				<td>삭제</td>
				
			</tr>
			<tr>
				<th>admin</th>
				<th>a</th>
				<th>와이지</th>
				<th>1013</th>
				<th><button id="write" type="button">수정</button></th>
				<th><button id="delet" type="button">삭제</button></th>
			</tr>
				<th>ma</th>
				<th>kim</th>
				<th>김씨</th>
				<th>27019</th>
				<th><button id="write" type="button">수정</button></th>
				<th><button id="delet" type="button">삭제</button></th>
			<tr>
				<th>drum</th>
				<th>machine</th>
				<th>강씨</th>
				<th>1000</th>
				<th><button id="write" type="button">수정</button></th>
				<th><button id="delet" type="button">삭제</button></th>
			</tr>
			<tr>
				<th>ryu</th>
				<th>123</th>
				<th>류씨</th>
				<th>1003</th>
				<th><button id="write" type="button">수정</button></th>
				<th><button id="delet" type="button">삭제</button></th>
			</tr>
			<tr>
				<th>abc</th>
				<th>1234</th>
				<th>코리아</th>
				<th>1000</th>
				<th><button id="write" type="button">수정</button></th>
				<th><button id="delet" type="button">삭제</button></th>
			</tr>
			<tr>
				<th>c</th>
				<th>cc</th>
				<th>ccd</th>
				<th>1000</th>
				<th><button id="write" type="button">수정</button></th>
				<th><button id="delet" type="button">삭제</button></th>
			</tr>
		</table>
		<h1>스케줄러 관리</h1>
		<button id="start_btn" type="button">스케줄러(20초마다 포인트 1증가) 실행시작</button>
		<button id="close_btn" type="button">스케줄러 실행종료</button>
	</body>
</html>