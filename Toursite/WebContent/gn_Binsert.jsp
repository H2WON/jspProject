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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String)session.getAttribute("userid");
	Timestamp register = new Timestamp(System.currentTimeMillis());
%>

<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl, dbId, pwd);
		
		String sql="insert into gn_board(gn_title,gn_writer,gn_content,gn_date,gn_hit,gn_ref,gn_indent,gn_step) values(?,?,?,?,0,0,0,0)";
		
		//sql문 수행 연결 
		pstmt = conn.prepareStatement(sql);
		
		//?연결 시키기
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, content);
		pstmt.setTimestamp(4, register);
		
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
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="gn_Blist.jsp"; 
</script>


</body>
</html>