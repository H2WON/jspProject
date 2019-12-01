<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String logout = request.getParameter("logout");

	if(logout != null && logout.equals("yes"))
	{
		session.removeAttribute("userid");
		session.removeAttribute("login");
		
		response.sendRedirect("index.jsp");
	}
%>

</body>
</html>