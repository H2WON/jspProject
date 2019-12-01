<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			color:white;
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
	<script type="text/javascript">
		function check(){
			frm = document.Bform;
			if(frm.title.value=="")
			{
				alert("제목을 입력하세요");
				frm.title.focus();
				return;
			}
			if(frm.content.value=="")
			{
				alert("내용을 입력하세요");
				frm.content.focus();
				return;	
			}
			frm.action="gn_Binsert.jsp";
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
		<div class="login"><%=userid %> 님 환영합니다. <input type="button" value="내 정보" class="idbtn" onclick="window.location='my_page.jsp'"><input type="button" value="로그아웃" class="idbtn" onclick="window.location='logout_act.jsp?logout=yes'"></div>
	<% }
%>
<center/>
<div style="position: absolute; left:50%; transform:translateX(-50%);">

        <div style="position: relative; text-align:center; "><img src="imgs/gangnam-index.png" width="100%" height="350"></img></div>
        
		<jsp:include page="menu_gangnam.jsp" flush="false" />

</div>
<img src="imgs/gangnam.png" width="100%" height="500">

<p>
<form method="post" name="Bform" >
<table>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea rows="15" cols="50" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록" onclick="check()"><input type="reset" value="취소">
		</td>
	</tr>
</table>
&nbsp;<p>
<table width="100%">
	<tr class="empty">
		<td>
		</td>
	</tr>
</table>
<jsp:include page="snslink.jsp" flush="false" />
</form>
</body>
</html>