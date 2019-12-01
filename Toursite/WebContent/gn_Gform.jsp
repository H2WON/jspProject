<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		function guestbookgn_check(){
			frm = document.guestbookgn;
			if(frm.guestbook.value=="")
			{
				alert("내용을 입력해주세요.");
				frm.guestbook.focus();
				return;
			}
			frm.submit();
		}
	</script>
</head>
<body>
<center/>
<form name="guestbookgn" action="gn_Ginsert.jsp" method="post">
	<table>
		<tr>
			<td>
				<textarea rows="5" cols="40" name="guestbook"></textarea>
			</td>
		</tr>
		<tr>
			<td class="button">
				<input type="button" value="글 올리기" onclick="javascript:guestbookgn_check()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>