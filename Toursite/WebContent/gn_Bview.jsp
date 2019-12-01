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
		.login{
			text-align:right;
			color:white;
		}
		.empty{
			height:50;
			backgroud-color:RGB(255,255,255);
			}
		.reply{
			border:1px solid white;
			height:80pt;
		}
		.board{
			border:1px solid white;
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
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	int postid = Integer.parseInt(request.getParameter("postid"));
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);

		String search="select * from gn_board where gn_postid="+postid;
		pstmt = conn.prepareStatement(search);
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			String writer = rs.getString("gn_writer");
			String title = rs.getString("gn_title");
			String content = rs.getString("gn_content");
			String date = rs.getString("gn_date");
			int hit = rs.getInt("gn_hit");
			hit++;
			%>
			<table width="600" class="board">
				<tr>
					<td>
						no.<%=postid %>
					</td>
					<td align="right">
						조회수 : <%=hit %>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr>
					</td>
				</tr>
				<tr>
					<td>
						 작성자 : <%=writer %>
					</td>
					<td align="right">
						작성일 : <%=date %>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr>
					</td>
				</tr>
				<tr>
					<td colspan="2">제목: <%=title %></td>
				</tr>
				<tr>
					<td colspan="2">
					<hr>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="left">
						<%=content %>
					</td>
				</tr>
			</table>
			<table>
			<tr>
					<td colspan="2" align="center">
						<input type=button value="목록" OnClick="window.location='gn_Blist.jsp?pg=<%=pg%>'">
						<%
							if(userid.equals(writer))
							{
						%>
							<input type=button value="수정" OnClick="window.location='gn_Bmodify.jsp?postid=<%=postid%>&pg=<%=pg%>'">
							<input type=button value="삭제" OnClick="window.location='gn_Bcheck.jsp?postid=<%=postid%>&pg=<%=pg%>'">
						<%
							}
						%>
					</td>
				</tr>
			</table>
			<%
			String sqlhit = "update gn_board set gn_hit="+hit+" where gn_postid="+postid;
			pstmt = conn.prepareStatement(sqlhit);
			pstmt.executeUpdate();
		}
		%>
		<table weight="600">
		<tr>
			<td height="20">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="gn_Rform.jsp?postid=<%=postid %>&pg=<%=pg %>" flush="false" />
			</td>
		</tr>
		<%
		String sql="select * from gn_reply where gn_rpostid="+postid+" ORDER BY gn_replyid DESC";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			int replyid = rs.getInt("gn_replyid");
			String rwriter = rs.getString("gn_rwriter");
			String rcontent = rs.getString("gn_rcontent");
			String rdate = rs.getString("gn_rdate");
			
			%>
			<tr>
				<td>&nbsp;
				</td>
			</tr>
			<tr>
				<td class="reply">
					작성자 : <%=rwriter %>
					&emsp;&emsp;&emsp;&emsp;작성 시간 : <%=rdate %>
					<%
						if(userid.equals(rwriter))
						{
					%>
							<a href="gn_Rdelete.jsp?replyid=<%=replyid%>&postid=<%=postid%>&pg=<%=pg%>">삭제</a>
					<%
						}
					%>
					<p><hr><%=rcontent %></br>
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
	
<table width="100%">
	<tr class="empty">
		<td>
		</td>
	</tr>
</table>
<jsp:include page="snslink.jsp" flush="false" />

</body>
</html>