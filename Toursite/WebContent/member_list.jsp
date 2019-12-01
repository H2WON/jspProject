<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
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
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center/>
<h1>Member List</h1>
<table class='ltable'>
	<tr>
		<th class='lt'>
			사용자 이름
		</th>
		<th class='lt'>
			이름
		</th>
		<th class='lt'>
			가입일자 
		</th>
	</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	String str="";
	ResultSet rs = null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		String sql="select * from member";
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String id = rs.getString("id");
			String name = rs.getString("name");
			String regdate = rs.getString("reg_date");
			%>
				<tr >
					<td class='lt'>
						<%=id %>
					</td>
					<td class='lt'>
						<%=name %>
					</td>
					<td class='lt'>
						<%=regdate %>
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
</body>
</html>