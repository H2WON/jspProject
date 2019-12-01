<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<style>
		table{
			text-align:center;
			}
		.empty{
			height:50;
			backgroud-color:RGB(255,255,255);
			}
		.login{
			text-align:right;
			color:white;
		}
		.idbtn{
		background-color:RGB(0,0,0);
		border:none;
		color:white;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String login=(String)session.getAttribute("login");
	String userid=(String)session.getAttribute("userid");

	if(userid != null && login.equals("yes"))
	{%>
		<div class="login"><%=userid %> 님 환영합니다. <input type="button" value="내 정보" class="idbtn" onclick="window.location='my_page.jsp'"><input type="button" value="로그아웃" class="idbtn" onclick="window.location='logout_act.jsp?logout=yes'"></div>
	<% }
%>
<center/>
<div style="position: absolute; left:50%; transform:translateX(-50%);">

        <div style="position: relative; text-align:center; "><img src="imgs/junggu-index.png" width="100%" height="250"></img></div>
        
		<jsp:include page="menu_commingsoon.jsp" flush="false" />

</div>
<img src="imgs/dongdaemoon.png" width="100%" height="500">

<p>

<table width="100%">
	<tr>
		<td>
			<font color="white"><h1>COMMING SOON!!</h1></font>
			&nbsp;<p>
			&nbsp;<p>
		</td>
	</tr>
	<tr class="empty">
		<td>
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="snslink.jsp" flush="false" />
		</td>
	</tr>
</table>

</body>
</html>