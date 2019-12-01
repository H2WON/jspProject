<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String postid = request.getParameter("postid");
Integer pg = Integer.parseInt(request.getParameter("pg"));%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.button{
			text-align:right;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function gnreply_check(){
			frm = document.replyform;
			if(frm.reply.value=="")
			{
				alert("내용을 입력해주세요.");
				frm.reply.focus();
				return;
			}
			frm.submit();
		}
	</script>
</head>
<body>
<center/>
<form name="replyform" action="gn_Rinsert.jsp?postid=<%=postid %>&pg=<%=pg %>" method="post">
	<table>
		<tr>
			<td>
				<textarea rows="5" cols="40" name="reply"></textarea>
			</td>
		</tr>
		<tr>
			<td class="button">
				<input type="button" value="댓글 쓰기 " onclick="javascript:gnreply_check()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>