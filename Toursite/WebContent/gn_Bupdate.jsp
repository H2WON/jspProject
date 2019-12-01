<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int postid = Integer.parseInt(request.getParameter("postid"));
	Timestamp register = new Timestamp(System.currentTimeMillis());
%>
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
	Integer pg = Integer.parseInt(request.getParameter("pg"));
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		String Mtitle = request.getParameter("title");
		String Mcontent = request.getParameter("content");
	
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql = "update gn_board set gn_title=?, gn_content=?, gn_date=? where gn_postid="+postid;
		pstmt= conn.prepareStatement(sql);
			
		pstmt.setString(1, Mtitle);
		pstmt.setString(2, Mcontent);
		pstmt.setTimestamp(3, register);
		
		pstmt.executeUpdate();
		
		%>
		  <script type="text/javascript">
		  	self.window.alert("글이 수정되었습니다.");
		  	location.href='gn_Bview.jsp?postid=<%=postid%>&pg=<%=pg%>';
		  </script>
		<%
		
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