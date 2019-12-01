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
	String gn_rcontent = request.getParameter("reply");
	String gn_rwriter = (String)session.getAttribute("userid");
	Timestamp gn_rdate = new Timestamp(System.currentTimeMillis());
	int postid = Integer.parseInt(request.getParameter("postid"));
	Integer pg = Integer.parseInt(request.getParameter("pg"));
%>
<%
	//Connection 객체 만들기 
	Connection conn = null;
	
	//sql문 수행할 객체 (preparedStatement)
	PreparedStatement pstmt=null;
	
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
		
		out.println("데이터 베이스 연결 성공");
		
		//sql문 만들기 
		String sql="insert into gn_reply (gn_rwriter,gn_rcontent,gn_rdate,gn_rpostid) values(?,?,?,?)";
		
		//sql문 수행 연결 
		pstmt = conn.prepareStatement(sql);
		
		//?연결 시키기
		pstmt.setString(1,gn_rwriter);
		pstmt.setString(2,gn_rcontent);
		pstmt.setTimestamp(3, gn_rdate);
		pstmt.setInt(4, postid);
		
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
   self.window.alert("입력하신 댓글이 저장되었습니다.");
   location.href="gn_Bview.jsp?postid=<%=postid%>&pg=<%=pg%>";
 </script>

</body>
</html>