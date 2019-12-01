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
		String no = request.getParameter("no"); 
		String content = request.getParameter("content");
		Timestamp date_gn = new Timestamp(System.currentTimeMillis());
	
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql = "update guestbook_gn set date_gn=?, content_gn=? where no_gn="+no;
		pstmt= conn.prepareStatement(sql);
			
		pstmt.setTimestamp(1, date_gn);
		pstmt.setString(2, content);
		
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
		  	self.window.alert("방명록이 수정되었습니다.");
		  	location.href='gn_Glist.jsp';
  </script>
</body>
</html>