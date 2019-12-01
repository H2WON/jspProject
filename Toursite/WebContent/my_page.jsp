<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String target = request.getParameter("target"); //target변수로 된 값을 target변수에 저장
if(target==null) target = "member_index";
String targetPage = target + ".jsp"; // 받아온 값에 .jsp를 추가해서 (중앙의 화면만 바뀌도록 해줌)
//<jsp:include page="menu_dosim.jsp" flush="false" />
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		body{
			color:white;
			backgroud-color:RGB(0,0,0);
		}
		.empty{
			height:50;
			backgroud-color:RGB(255,255,255);
			}
		table{
			text-align:center;
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
<title>Insert title here</title>
</head>
<body>
<%
	String login=(String)session.getAttribute("login");
	String userid=(String)session.getAttribute("userid");

	if(userid != null && login.equals("yes"))
	{%>
		<div class="login"><%=userid %> 님 환영합니다. <input type="button" value="메인 화면" class="idbtn" onclick="window.location='login_index.jsp'"><input type="button" value="로그아웃" class="idbtn" onclick="window.location='logout_act.jsp?logout=yes'"></div>
	<% }
%>
<center/>
<div style="position: absolute; left:50%; transform:translateX(-50%);">
		&nbsp;<p>
        <div style="position: relative; text-align:center; "><img src="imgs/seoul-logo.png" width="100%" height="250"></img></div>
        
        &nbsp;<p>
        &nbsp;<p>
        <jsp:include page="menu_mypage.jsp" flush="false" />

</div>
<img src="imgs/doklibmoon.png" width="100%" height="500">

<p>

<table width = 100%>
	<tr>
		<td>
			<jsp:include page="<%= targetPage %>" flush="false" />
		</td>
	</tr>
	<tr>
		<td height="50">
			&nbsp;
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