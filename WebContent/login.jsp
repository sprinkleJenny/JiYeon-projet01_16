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
		<h1>로그인</h1>
		<form action="LoginAction.jsp" method="post">
			ID : <input type="text" id="id" name="id" required/><br/>
			PW : <input type= "password" id="pw" name="pw" required/><br/>
			<input type="submit"  id="login_btn" value=로그인 /><br/>
			<input type="submit" id="new_mamber_btn" value=회원가입 />
		</form>
	</body>
</html>