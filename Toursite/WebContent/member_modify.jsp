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
		.btn{
			background-color:RGB(86,118,165);
			border:none;
			color:white;
			padding:5px 0;
			text-algin:center;
			display:inline-block;
			font-size:15px;
			margin:8px;
			cursor:pointer;
			border-radius:5px;
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		String userid=(String)session.getAttribute("userid");
		String cPwd=request.getParameter("pwd_check");
		
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
			String rPwd = rs.getString("passwd");
			String name = rs.getString("name");
			String regdate = rs.getString("reg_date");
			
			if(rPwd.equals(cPwd))
			{
			%>
			<center/>
			<form name="modify" method="post" action="Mupdate.jsp">
			<table class = "ltable">
				<tr>
					<th class="lt">ID</th>
					<td class="lt"><%=id %></td>
				</tr>
				<tr>
					<th class="lt">NAME</th>
					<td class="lt"><input type="text" name = "name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th class="lt">PASSWORD</th>
					<td class="lt"><input type="button" class="btn" value="비밀번호 변경" onclick="window.location='pwd_modify.jsp'"></td>
				</tr>
				<tr>
					<td colspan=2>
						<input type="submit"  class="btn"  value="수정 하기 ">
					</td>
				</tr>
			</table>
			</form>
			<% }
			else
			{
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다.')");
				out.println("location.href='my_page.jsp?target=member_check'");
				out.println("</script>");
			}
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