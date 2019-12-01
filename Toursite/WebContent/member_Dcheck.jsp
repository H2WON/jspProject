<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function check(){
			frm = document.pwdcheck;
			if(frm.pwd_check.value=="")
			{
				alert("비밀번호를 입력해주세요");
				frm.pwd_check.focus();
				return;
			}
			frm.submit();
		}
</script>
<title>Insert title here</title>
</head>
<body>
<center/>
<form name="pwdcheck" method="post" action="MDelete.jsp">
	<h1>Member Delete</h1>
	PASSWORD : <input type="password" name="pwd_check" > <input type="button" value="OK" onclick="check()">
</form>

</body>
</html>