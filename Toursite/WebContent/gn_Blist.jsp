<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	final int ROWSIZE = 5;
	final int BLOCK = 3;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int start = (pg*ROWSIZE) - (ROWSIZE-1);
	int end = (pg*ROWSIZE);
	
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;

%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			color:white;
		}
		.ltable {
			width:800;
			border-top : 1px solid white;
			border-collapse: collapse;
		}
		.lt {
			border-bottom: 1px solid white;
			padding : 10px;
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
<font color="white"><h1>Board</h1></font>
<form method="post" action="gn_Bform.jsp">
	<table width="800" class='ltable'>
		<tr class='lt' height="30">
			<td width="10%" align="center">no</td>
			<td width="40%">제목</td>
			<td width="10%">작성자</td>
			<td width="30%">작성일자</td>
			<td width="10%" align="center">조회수</td>
		</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	int total = 0;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String count = "select count(*) from gn_board";
		pstmt = conn.prepareStatement(count);
		rs= pstmt.executeQuery();
		
		if(rs.next())
		{
			total = rs.getInt(1);
		}
		
		allPage = (int)Math.ceil(total/(double)ROWSIZE);
		
		if(endPage > allPage) {
			endPage = allPage;
		}
		
		out.print("총 페이지 수 : "+total+"개");
		pstmt.close();
		rs.close();
		
		String sql="select * from gn_board where gn_postid >="+start + " and gn_postid <= "+ end +" ORDER BY gn_postid DESC";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			int postid = rs.getInt("gn_postid");
			String title = rs.getString("gn_title");
			String writer = rs.getString("gn_writer");
			String time = rs.getString("gn_date");
			int hit = rs.getInt("gn_hit");
			
			Date date = new Date(); 
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
			String year = (String)simpleDate.format(date); 
			String yea = time.substring(0,10);
			%>
				<tr class='lt'  height="30">
					<td align="center"><%=postid %></td>
					<td><a href="gn_Bview.jsp?postid=<%=postid%>&pg=<%=pg%>"><%=title %></a>
					<%
						if(year.equals(yea)){
					%>
								&nbsp;<img src='imgs/new.jpg' />
					<%
							}  
					%>
					</td>
					<td><%=writer %></td>
					<td><%=time %></td>
					<td align="center"><%=hit %></td>
				</tr>
			<% 
		}
		
		
		
	}catch(Exception e){//에러가 났을 때 나오는 메시지
		e.printStackTrace();
	}finally{
		if(pstmt != null)
		{
			try{pstmt.close(); rs.close();}catch(Exception e){}
		}
		if(conn != null)
		{
			try{pstmt.close(); rs.close();}catch(Exception e){}
		}
	}
%>
		<tr>
  			<td colspan="5" height="5"></td>
  		</tr>
  		<tr align="right">
   			<td colspan="5"><input type="submit" value="글쓰기"></td>
  		</tr>
	</table>
<table>
  <tr><td colspan="5" height="5"></td></tr>
  <tr>
	<td align="center">
		<%
			if(pg>BLOCK) {
		%>
			[<a href="gn_Blist.jsp?pg=1">◀◀</a>]
			[<a href="gn_Blist.jsp?pg=<%=startPage-1%>">◀</a>]
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="gn_Blist.jsp?pg=<%=i %>"><%=i %></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="gn_Blist.jsp?pg=<%=endPage+1%>">▶</a>]
			[<a href="gn_Blist.jsp?pg=<%=allPage%>">▶▶</a>]
		<%
			}
		%>
		</td>
	</tr>
</table>
</form>

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