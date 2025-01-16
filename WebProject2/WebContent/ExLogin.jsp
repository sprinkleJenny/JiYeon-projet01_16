<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
	<style type="text/css">
		form{}
	</style>
</head>
<body>
	<form action="ExLoginAction.jsp" method="post">
		id : <input type="text" name="id"/><br/>
		pw : <input type="password" name="pw"/><br/>
		<input type="submit" value="로그인"/>
	</form>
</body>
</html>