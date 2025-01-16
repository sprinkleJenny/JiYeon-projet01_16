<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	RequestDispatcher rd = request.getRequestDispatcher("b.jsp");
 	//rd.forward(request, response);
 	request.setAttribute("result","true");
 	response.sendRedirect("b.jsp");
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%-- <script> location.href="b.jsp"</script> --%>
		<%-- <a href="b.jsp">클릭?</a> --%>
	</body>
</html>