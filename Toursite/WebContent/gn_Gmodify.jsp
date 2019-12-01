<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<style>
		table{
			color:white;
		}
		.guestbook{
			border: 1px solid white;
			height:80pt;
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
		function modify_check(){
			frm = document.modifyform;
			if(frm.content.value=="")
			{
				alert("내용을 입력해주세요.");
				frm.content.focus();
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
<center/>
	<font color="white"><h1>Guestbook Modify</h1></font>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";

		String no = request.getParameter("no"); 
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql="select * from guestbook_gn where no_gn="+no;
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String content = rs.getString("content_gn");
			%>
			<table>
			<form method="post" name="modifyform" action="gn_Gupdate.jsp?no=<%=no%>">
			<tr>
				<td>&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="5" cols="40" name="content"><%=content %></textarea>
				</td>
			</tr>
			<tr>
			<td class="button">
				<input type="button" value="수정하기" onclick="javascript:modify_check()">
			</td>
		</tr>
			<% 
		}
		
		
		
	}catch(Exception e){//에러가 났을 때 나오는 메시지
		e.printStackTrace();
	}finally{
		if(pstmt != null)
		{
			try{pstmt.close();}catch(Exception e){}
		}
		if(conn != null)
		{
			try{pstmt.close();}catch(Exception e){}
		}
	}
%>
	</form>
</table>

	&nbsp;<p>
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