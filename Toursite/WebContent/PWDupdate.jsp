<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;

	String newpwd = request.getParameter("newpwd");
	String newpwd1 = request.getParameter("newpwd1");
	
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String dbPwd="jsppass";
		String userid=(String)session.getAttribute("userid");
	
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		out.println(newpwd);
		out.println(newpwd1);
	
			if(!newpwd.equalsIgnoreCase(newpwd1))
			{
				out.println("<script>");
				out.println("alert('새로운 비밀번호가 일치한지 확인해 주세요 ')");
				out.println("location.href='pwd_modify.jsp'");
				out.println("</script>");
			}
			
			String sql = "update member set passwd=? where id=?";
			pstmt= conn.prepareStatement(sql);
				
			pstmt.setString(1, newpwd);
			pstmt.setString(2, userid);
			
			pstmt.executeUpdate();
		
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
<script language=javascript>
   self.window.alert("비밀번호가 변경되었습니다.");
   location.href="my_page.jsp?target=member_index"; 
</script>
</body>
</html>