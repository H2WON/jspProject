<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String target =request.getParameter("target");
	if (target == null ) target = "join";
	String targetPage = target + ".jsp"; 
%>
<!DOCTYPE html>
<html>
<head>
	<style>
		table{
			width : 100% ;
			height: 100%;
			align : center;
			text-align:center;
			font-family:"나눔바른고딕OTF Light";
			}
		.empty{
			height:50;
			backgroud-color:RGB(255,255,255);
			}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
<div style="position: absolute; left:50%; transform:translateX(-50%);">

        <div style="position: relative; text-align:center; "><img src="imgs/seoul-logo.png" width="100%" height="350"></img></div>
        
        <jsp:include page="intro.jsp" flush="false" />

</div>
<img src="imgs/SEOUL_INDEX.png" width="100%" height="500">

<p>
<table>
	<tr>
		<td align = "center">
		<jsp:include page="<%= targetPage %>" flush="false" />
		</td>
	</tr>
	<tr class="empty">
		<td>
		</td>
	</tr>
	<tr>
	<tr>
		<td>
		<jsp:include page="snslink.jsp" flush="false" />
		</td>
	</tr>
</table>
</body>
</html>