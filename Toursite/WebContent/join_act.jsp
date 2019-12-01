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
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	Timestamp register = new Timestamp(System.currentTimeMillis());
%>

<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	session.setAttribute("userid", id);
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);

		String search="select * from member";
		pstmt = conn.prepareStatement(search);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			String sId = rs.getString("id");
			if(sId.equals(id))
			{
				out.println("<script>");
				out.println("alert('중복된 사용자 이름입니다.')");
				out.println("location.href='index.jsp?target=join'");
				out.println("</script>");
			}
		}
		
		
		String sql="insert into member values(?,?,?,?)";
		
		//sql문 수행 연결 
		pstmt = conn.prepareStatement(sql);
		
		//?연결 시키기
		pstmt.setString(1, id);
		pstmt.setString(2,password);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, register);
		
		pstmt.executeUpdate();
		
		response.sendRedirect("index.jsp?target=login");
		
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