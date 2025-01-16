<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="js/jquery-3.7.1.min.js"></script>
	</head>
	<body>
		<h1>회원가입</h1>
		<form action="MemberNewAction.jsp" method="post">
			ID : <input type="text" id="id" name="id" required/><br/>
			PW : <input type="password" id="pw" name="pw"required/><br/>
			Name: <input type="text" id="name" name="name" required/><br/>
			<input type="submit" value=작성완료 />
		</form>
	</body>
</html>