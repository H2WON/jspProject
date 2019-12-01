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
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		String cPwd = request.getParameter("pwd_check");
		String userid=(String)session.getAttribute("userid");
		
		Class.forName ("com.mysql.jdbc.Driver");
		
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String check="select * from member where id= ?";
		
		pstmt = conn.prepareStatement(check);
		
		pstmt.setString(1,userid);
		
		//?연결 시키기
		rs = pstmt.executeQuery();
		rs.next();
		
		String rPwd = rs.getString("passwd");
			
		if(rPwd.equals(cPwd))
		{
			String sql = "delete from member where id = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			session.removeAttribute("userid");
			session.removeAttribute("login");
			
			pstmt.executeUpdate();
		}
		
		if(!rPwd.equals(cPwd))
		{
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("location.href='my_page.jsp?target=member_check'");
			out.println("</script>");
		}
		
		response.sendRedirect("index.jsp");
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