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
	String replyid = request.getParameter("replyid");
	int postid = Integer.parseInt(request.getParameter("postid"));
	Integer pg = Integer.parseInt(request.getParameter("pg"));
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		
		Class.forName ("com.mysql.jdbc.Driver");
		
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql = "delete from gn_reply where gn_replyid = ?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, replyid);
			
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
<script type="text/javascript">
   self.window.alert("해당 댓글이 삭제되었습니다.");
   location.href="gn_Bview.jsp?postid=<%=postid%>&pg=<%=pg%>";
 </script>
</body>
</html>