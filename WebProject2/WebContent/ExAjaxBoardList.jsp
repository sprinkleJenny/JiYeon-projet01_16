<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<script src="js/jquery-3.7.1.min.js"></script>
	<script>
		let current_page = 1;
		window.onscroll = function () {
		    const totalPageHeight = document.body.scrollHeight;
		    const scrollPoint = window.scrollY + window.innerHeight;
		    if (scrollPoint >= totalPageHeight) {
		        //alert("요청 page = " + ++current_page);
		        current_page++;
		        
		        $.ajax({
		        	type : 'post',
		        	url : 'ExAjaxBoardList',
		        	data : {"page_num" :current_page},
		        	success : function(obj){
		        		console.log(obj);
		        		for(let i=0; i<=obj.length-1; i++){
		        			let str = 
		        				'<tr>' +
		        				'	<td class="bno">' + obj[i].bno + '</td>'+
		        				'	<td>' + obj[i].title + '</td>'+
		        				'	<td>' + obj[i].content + '</td>'+
		        				'</tr>';
		        				
		        				$("#table1").append(str);
		        		}
		        	},
		        	error : function(r, s, e){
		        		alert("[에러] code : " + r.status + 
		        				", messge: "  + r.responseText 
		        				+ ", error : " + e);
		        		
		        	}
		        });
		    }
		}
		
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
	<h1>게시판 목록(무한스크롤)</h1>
	<table id="table1">
		<tr>
			<th>게시판 번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<% for(BoardDto dto : listBoard) { %>
		<tr>
			<td class="bno"><%= dto.getBno()%></td>
			<td><%= dto.getTitle() %>
			</td>
			<td><%= dto.getWriter() %></td>
		</tr>
		<% } %>
	</table>
	<button id="btn_write">새 글쓰기</button>
</body>
</html>