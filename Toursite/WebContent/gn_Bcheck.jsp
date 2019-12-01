<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int postid = Integer.parseInt(request.getParameter("postid"));
%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		body{
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
			frm = document.Dcheck;
			if(frm.cpwd.value=="")
			{
				alert("비밀번호를 입력하세요");
				frm.cpwd.focus();
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
	Integer pg = Integer.parseInt(request.getParameter("pg"));

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
<h1>Board Delete</h1>
<form name="Dcheck" method="post" action="gn_Bdelete.jsp?postid=<%=postid%>&pg=<%=pg%>">
PASSWORD &nbsp; <input type="password" name="cpwd"> <p>
<input type="button" value="삭제" onclick="javascript:check()">
<input type="button" value="취소" OnClick="javascript:history.back(-1)">
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