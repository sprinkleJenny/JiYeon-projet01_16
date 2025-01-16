<%@page import="java.util.ArrayList"%>
<%@page import="dto.*"%>
<%@page import="dao.*"%>
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
		<link rel="stylesheet" href="css/main.css"/>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script>
			/* $(document).ready(function(){
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
				$(function(){
					$("#logout_btn").click(function(){
						alert("로그인 되었습니다.");
						location.href = "logout.jsp";
					});
					
				});
		</script>
	</head>
	<body>
		<h1>메이페이지</h1>
		<div id="text_btn">
			<span><%=dto.getName() %>(<%=dto.getId() %>)</span>님 안녕하세요
			<button id="logout_btn" type="button">로그아웃</button><br/>
			포인트 : <span><%=dto.getPoint() %></span>점
		</div>
		<div id="img">
			<ul>
				<li>
					<div>
						<img src="img/Intro_350_408.png" />
						<br/>
						<span>100,000포인트</span>
					</div>
				</li>
				<li>
					<div>
						<img src="img/Java_350_408.png" />
						<br/>
						<span>500,000포인트</span>
					</div>
				</li>
				<li>
					<div>
						<img src="img/Cpp_350_408.png" />
						<br/>
						<span>100,000포인트</span>
					</div>
				</li>
			</ul>
		</div>
		<div id="bottom_img">
			<img src="img/korea_it.png"/>
		</div>
	</body>
</html>