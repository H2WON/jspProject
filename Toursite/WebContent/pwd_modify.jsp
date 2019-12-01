<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			color:white;
		}
		.login{
			text-align:right;
			color:white;
		}
		.btn{
			width:80px;
			background-color:RGB(86,118,165);
			border:none;
			color:white;
			padding:5px 0;
			text-algin:center;
			display:inline-block;
			font-size:15px;
			margin:4px;
			cursor:pointer;
			border-radius:5px;
		}
		.idbtn{
		background-color:RGB(0,0,0);
		border:none;
		color:white;
		}
	</style>
	<script type="text/javascript">
		function check(){
			frm = document.pwdmodify;
			if(frm.newpwd1.value=="")
			{
				alert("비밀번호를 입력해주세요");
				frm.newpwd.focus();
				return;
			}
			if(frm.newpwd.value=="")
			{
				alert("비밀번호를 입력해주세요");
				frm.newpwd1.focus();
				return;
			}
			frm.submit();
		}
	</script>
<meta charset="UTF-8">
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
        <a href="login_index.jsp?target=memu_login"><div style="position: relative; text-align:center; "><img src="imgs/seoul-logo.png" width="100%" height="250"></img></a></div>
        
        &nbsp;<p>
        &nbsp;<p>
        <jsp:include page="menu_mypage.jsp" flush="false" />

</div>
<img src="imgs/doklibmoon.png" width="100%" height="500">

<p>
<form name="pwdmodify" method="post" action="PWDupdate.jsp">
<font color="white"><h1>Passwod Modify</h1></font color>
<table>
	<tr><td>NEW PASSWORD : <input type="password" name="newpwd" ></td></tr>
	<tr><td>NEW PASSWORD CHECK : <input type="password" name="newpwd1" ></td></tr>
	<tr><td align="center"><input type="button" class="btn" value="OK" onclick="javascript:check()"></td></tr>
</table>
</form>
	&nbsp;<p>
	
<table width="100%">
	<tr class="empty">
		<td>
		</td>
	</tr>
</table>
<jsp:include page="snslink.jsp" flush="false" />
</body>
</html>