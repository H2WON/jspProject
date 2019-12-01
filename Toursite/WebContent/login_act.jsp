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
	String id = request.getParameter("id");
	String pw = request.getParameter("pwd");
%>
<%
	//Connection 객체 만들기 
	Connection conn = null;
	
	//sql문 수행할 객체 (preparedStatement)
	PreparedStatement pstmt=null;
	
	ResultSet rs = null;
	
	//sql문
	String str="";
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		//mysql에 대한 db불러들이는 것 (드라이버 로드)
		Class.forName ("com.mysql.jdbc.Driver");
		
		//connection연결 getConnection("URL","id","password");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		//sql문 만들기 
		String sql="select * from member where id = ?";
		
		//sql문 수행 연결 
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		//id와 pw받아오기 
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String dbPW = rs.getString("passwd");
		
			if(id !=null && dbPW.equals(pw))
			{
				
				session.setAttribute("userid", id);
				session.setAttribute("login","yes");
				
				response.sendRedirect("login_index.jsp");
			}
			
			if(!dbPW.equals(pw))
			{
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다.')");
				out.println("location.href='index.jsp?target=login'");
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