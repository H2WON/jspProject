<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		body{
			text-align:center;
		}
		.ltable {
			width:100%;
			border-top : 1px solid white;
			border-collapse: collapse;
		}
		.lt {
			border-bottom: 1px solid white;
			padding : 10px;
			text-align: center;
			color:white;
		}
		.btn{
			width:80px;
			background-color:RGB(86,118,165);
			border:none;
			color:white;
			padding:5px 0;
			text-algin:center;
			display:inline-block;
			font-size:15px;
			margin:4px;
			cursor:pointer;
			border-radius:5px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center/>
<h1>My page</h1>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	String str="";
	ResultSet rs = null;
	
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		String userid=(String)session.getAttribute("userid");
		
		Class.forName ("com.mysql.jdbc.Driver");
		
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql="select * from member where id= ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,userid);
		
		//?연결 시키기
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String id = rs.getString("id");
			String name = rs.getString("name");
			String regdate = rs.getString("reg_date");
			%>
			<table class = "ltable">
				<tr>
					<th class="lt">ID</th>
					<td class="lt"><%=id %></td>
				</tr>
				<tr>
					<th class="lt">NAME</th>
					<td class="lt"><%=name %></td>
				</tr>
				<tr height="20">
					<td></td>
				</tr>
				<tr>
					<td colspan=2>
						<input type="button" class="btn" value="수정하기" onclick="window.location='my_page.jsp?target=member_check'">
					</td>
				</tr>
			</table>
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
</body>
</html>