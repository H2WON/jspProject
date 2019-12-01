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
	String postid = request.getParameter("postid");
	String cPwd = request.getParameter("cpwd");
	Integer pg = Integer.parseInt(request.getParameter("pg"));
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest";
		String dbId="jspid";
		String pwd="jsppass"; 
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
			String sql = "delete from gn_board where gn_postid="+postid;
			pstmt= conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("alert('해당 글이 삭제되었습니다.')");
			out.println("location.href=gn_Blist.jsp';");
			out.println("</script>");
			
			//response.sendRedirect("index_gangnam.jsp?target=gn_Blist");
		}
		else
		{
			out.println("<script>");
			out.println("self.window.alert('비밀번호가 틀렸습니다.')");
			out.println("history.back(-1)");
			out.println("</script>");
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
 <script language=javascript>
   self.window.alert("글이 삭제 되었습니다.");
   location.href="gn_Blist.jsp?pg=<%=pg%>"; 
</script>
</body>
</html>