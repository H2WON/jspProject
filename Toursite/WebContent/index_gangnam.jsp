<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String target = request.getParameter("target"); //target변수로 된 값을 target변수에 저장
if(target==null) target = "gn_map";
String targetPage = target + ".jsp?userid=userid"; // 받아온 값에 .jsp를 추가해서 (중앙의 화면만 바뀌도록 해줌)
//<jsp:include page="menu_dosim.jsp" flush="false" />
%>
<!DOCTYPE html>
<html>
<head>
	<style>
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
<body align="center">
<%
	String login=(String)session.getAttribute("login");
	String userid=(String)session.getAttribute("userid");

	if(userid != null && login.equals("yes"))
	{%>
		<div class="login"><%=userid %> 님 환영합니다. <input type="button" value="내 정보" class="idbtn" onclick="window.location='my_page.jsp'"><input type="button" value="로그아웃" class="idbtn" onclick="window.location='logout_act.jsp?logout=yes'"></div>
	<% }
%>
<center>
<div style="position: absolute; left:50%; transform:translateX(-50%);">

        <div style="position: relative; text-align:center; "><img src="imgs/gangnam-index.png" width="100%" height="350"></img></div>
        
		<jsp:include page="menu_gangnam.jsp" flush="false" />

</div>
<img src="imgs/gangnam.png" width="100%" height="500">

<p>

<table width="100%">
	<tr>
		<td>
			<jsp:include page="<%= targetPage %>" flush="false" />
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
</center>

</body>
</html>