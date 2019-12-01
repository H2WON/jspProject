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
			frm = document.Bmodify;
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
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	Integer pg = Integer.parseInt(request.getParameter("pg"));
	
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
			%>
			<form method="post" name="Bmodify" action="gn_Bupdate.jsp?postid=<%=postid%>&pg=<%=pg%>">
			<table width="800">
				<tr>
					<td>
						no.<%=postid %>
					</td>
					<td align="right">
						조회수 : <%=hit %>
					</td>
				</tr>
					<td>
						 작성자 : <%=writer %>
					</td>
					<td align="right">
						작성일 : <%=date %>
					</td>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="<%=title%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="15" cols="50" name="content"><%=content %></textarea>
					</td>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" onclick="check()"><input type="button" value="취소" OnClick="javascript:history.back(-1)">
					</td>
				</tr>
			</table>
			</form>
			<%
			String sqlhit = "update gn_board set gn_hit="+hit+" where gn_postid="+postid;
			pstmt = conn.prepareStatement(sqlhit);
			pstmt.executeUpdate();
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