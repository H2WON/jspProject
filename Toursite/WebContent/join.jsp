<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
	table{
		color:white;
	}
	.log{background-color:RGB(71,66,62);
		padding : 15pt;
		padding-left : 233px ;
		padding-right: 233px ;
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
	.logbtn{
	width:80px;
		background-color:RGB(71,66,62);
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
	
	</style>
	<script type="text/javascript">
		function jCheck(){
			frm = document.join;
			if(frm.id.value=="")
			{
				alert("사용자 이름을 입력하세요");
				frm.id.focus();
				return;
			}
			if(frm.password.value=="")
			{
				alert("비밀번호를 입력하세요");
				frm.password.focus();
				return;	
			}
			if(frm.name.value=="")
			{
				alert("이름을 입력하세요");
				frm.name.focus();
				return;	
			}
			frm.action="join_act.jsp";
			frm.submit();
		}
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
&nbsp;<p>
&nbsp;<p>
<form name="join" method="post" action="join_act.jsp">
<div class="log">
<table>
	<tr>
		<td>
		<center><h1>JOIN</h1></center>
		</td>
	</tr>
	<tr>
		<td>
		관광지 소개와 친구들의 후기를 보려면 가입하세요.<p>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name = "id" maxlength="20" placeholder="사용자 이름"> &nbsp;&nbsp;
			<input type="password" name = "password" maxlength="15" placeholder="비밀번호">&nbsp;&nbsp;
			<input type="text" name="name" maxlength="12" placeholder="성명">&nbsp;&nbsp;
			<input type="button" class="btn" value="JOIN" onclick="jCheck()">
		</td>
	</tr>
</table>
</div>
&nbsp;<p>
<div class="log" align="center">
		계정이 있으신가요? <input type="button" value="로그인" class="logbtn" onclick="window.location='index.jsp?target=login'">
</div>

&nbsp;<p>
&nbsp;<p>
&nbsp;<p>

</form>
</body>
</html>