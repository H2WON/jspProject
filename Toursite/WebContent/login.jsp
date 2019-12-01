<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		.log{background-color:RGB(71,66,62);
			  padding : 15pt;
			  padding-left : 233px ;
			  padding-right: 233px ;}
		table{
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
	</style>
	<script type="text/javascript">
		function check(){
			frm = document.login_form;
			if(frm.id.value=="")
			{
				alert("아이디를 입력하세요");
				frm.id.focus();
				return;
			}
			if(frm.pwd.value=="")
			{
				alert("비밀번호를 입력하세요");
				frm.pwd.focus();
				return;	
			}
			frm.action="login_act.jsp";
			frm.submit();
		}
	</script>
<title>Insert title here</title>
</head>
<body>
&nbsp;<p>
&nbsp;<p>
<form name="login_form" method="post" action="javascript:check()">
<div class="log">
	<table>
		<tr>
			<td>
			<center>
				<h1>LOGIN</h1>
			</center>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="id" placeholder="ID"> &nbsp;&nbsp;
				<input type="password" name="pwd" placeholder="PWD"> &nbsp;&nbsp;
				<input type="button" value="LOGIN" class="btn" onclick="javascript:check()">
			</td>
		</tr>
	</table>
</div>
</form>
&nbsp;<p>
&nbsp;<p>
&nbsp;<p>
</body>
</html>