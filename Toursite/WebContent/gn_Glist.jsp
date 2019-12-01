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

	<font color="white"><h1>Guestbook</h1></font>
	<table>
		<tr>
			<td>
				<jsp:include page="gn_Gform.jsp" flush="false" />
			</td>
		</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	int g_total = 0;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql="select * from guestbook_gn ORDER BY no_gn DESC";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			int no = rs.getInt("no_gn");
			String writer = rs.getString("writer_gn");
			String content = rs.getString("content_gn");
			String date = rs.getString("date_gn");
			session.setAttribute("no", no);
			
			%>
			<tr>
				<td>&nbsp;
				</td>
			</tr>
				<tr >
					<td class="guestbook">
						no.<%=no %>&nbsp;작성자 : <%=writer %>
						&emsp;&emsp;&emsp;&emsp;작성 시간 : <%=date %>
						<%
							if(userid.equals(writer))
							{
						%>
								&nbsp;&nbsp;<a href="gn_Gmodify.jsp?no=<%=no%>">수정</a>&nbsp;&nbsp;<a href="gn_GDelete.jsp?no=<%=no%>">삭제</a>
						<%
							}
						%>
						<hr>
						<p><%=content %></br>
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