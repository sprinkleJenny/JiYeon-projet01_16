<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
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
	int pageNum = 1;
	try{
		pageNum = Integer.parseInt(request.getParameter("page"));
	}catch(NumberFormatException e){ }
	
	BoardDao dao = new BoardDao();
	ArrayList<BoardDto> listBoard = dao.getBoardListByPageNumber(pageNum);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$("td").click(function(){
				let bno = $(this).parent().find(".bno").text();
				location.href ="ExBoardDetail.jsp?bno=" + bno;
			});
			$("#btn_write").click(function() {
				location.href ="ExBoardWrite.jsp";
			});
			$("#btn_logout").click(function(){
				location.href = "logout.jsp";
			});
		});
	</script>
	<style>
		table { border-collapse: collapse; }
		td, th { font-size: 19px; padding: 9px; border: 1px solid grey; }
		td { cursor: pointer; }
		#div_pagination { padding-left: 80px; }
		.no_underline { text-decoration: none; }
		.reply_cnt{ color : red; }
	</style>
	</head>
<body>
	<button id="btn_logout">로그아웃</button>
	<h1>게시판 목록(<%= pageNum %>페이지)</h1>
	<table>
		<tr>
			<th>게시판 번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<% for(BoardDto dto : listBoard) { %>
		<tr>
			<td class="bno"><%= dto.getBno()%></td>
			<td><%= dto.getTitle() %>
				<% if(dao.getReplyCounByBno(dto.getBno())>0) {%>
					<span class="reply_cnt">[<%=dao.getReplyCounByBno(dto.getBno()) %>]</span>
				<% } %>
			</td>
			<td><%= dto.getWriter() %></td>
		</tr>
		<% } %>
	</table>
	<div class="pagination">
		<%
			int cntBoard = dao.getCountBoard();
			int lastPageNum = cntBoard / 10 + (cntBoard%10!=0 ? 1 : 0);
			int startPageNum = (pageNum/7*7 -(pageNum%7==0 ? 7: 0))+1;
			int endPageNum = startPageNum + 6;
			if(endPageNum > lastPageNum){
				endPageNum =  lastPageNum;
			}
		%>
		<% if(startPageNum > 1) { %>
			<a href="ExBoard.jsp?page=<%=startPageNum-1%>" class="no_underline">&lt;</a>
		<% } %>
		<% for(int i=startPageNum; i<=endPageNum; i++) { %>
			<% if(pageNum != i) { %>
			<a href="ExBoard.jsp?page=<%= i%>"><%= i%></a>
			<% } else { %>
				<span><%= i%></span>
			<% } %>	
		<% } %>
		<% if(lastPageNum >= startPageNum + 7) { %>
			<a href="ExBoard.jsp?page=<%=endPageNum+1%>" class="no_underline">&gt;</a>
		<% } %>
	</div>
	<button id="btn_write">새 글쓰기</button>
</body>
</html>