<%@page import="dto.ReplyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
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
<%
	int bno = 0;
	try{
		
	bno = Integer.parseInt(request.getParameter("bno"));
	}catch(NumberFormatException e) {
		RequestDispatcher rd = request.getRequestDispatcher("ExBoard.jsp");
		rd.forward(request, response);
	}
	
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.getBoardDtoByBno(bno);
	
	ArrayList <ReplyDto> listReplies = dao.getReplyList(bno);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			$("#btn_list").click(function(){
				//location.href="ExBoard.jsp";
				history.back(-1); //열어던 페이지로 되돌아간다.
			});
			$("#a_del").click(function() {
				location.href="ExBoradDeleteAction.jsp?bno=<%= dto.getBno()%>";
			});
			$("#a_mod").click(function() {
				location.href = "ExBoardModify.jsp?bno=<%= dto.getBno()%>";
			});
		});
	</script>
	<style>
		p { border: 1px solid grey; }
	</style>
</head>
<body>
	<h1>게시글 보기</h1>
	<p>게시번호 : <%=dto.getBno() %></p>
	<p>제목 : <%=dto.getTitle() %></p>
	<p>내용 : <%=dto.getContent() %></p>
	<a id="btn_list"">목록</a>
	<a id="a_del">삭제</a>
	<a id="a_mod">수정</a>
	<br/>
	<div>
		<form action="ExBoardReplyWriteAction.jsp" method="post">
			<input type="hidden" name="bno" value="<%=dto.getBno()%>"/>
			댓글 작성
			<textarea name="content"></textarea>
			<input type="submit" value="작성완료"/>
		</form>	
	</div>
	<div>
		<% for(ReplyDto Bdto : listReplies) { %>
			<div>
				<%= Bdto.getContent() %> - <%=Bdto.getWriter() %> (<%=Bdto.getWritedate() %>)
			</div>
		<% } %>
	</div>	
</body>
</html>