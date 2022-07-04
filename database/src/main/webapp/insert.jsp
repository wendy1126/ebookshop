<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
	java.util.Date thisDate = new java.util.Date();
	
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String now = date.format(thisDate); //현재날짜
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String subject, memo;
		String name = (String)session.getAttribute("id");
		String email = (String)session.getAttribute("email");
		subject = request.getParameter("subject");
		memo = request.getParameter("memo");
		
		ResultSet rs = null;
		String sql;
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/board";
			con = DriverManager.getConnection(url, "java", "java");
		}
		catch(Exception e) { 
			out.println("데이터베이스 접속에 문제가 있습니다.<hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		stmt = con.createStatement();
		
		sql = "insert into message " +
				"(subject, name, time, memo, email)" +
				"values("+"'"+subject+"','"+name+"','"+ now + "','"+memo+"','"+email+"');";
		try {
			stmt.executeUpdate(sql);
		}
		catch(Exception e) {
			out.println("데이터베이스 삽입 연산이 실패하였습니다.<hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
	<h3>게시글이 등록되었습니다.</h3>
	<a href = "list.jsp">게시글 리스트 보기</a>

</body>
</html>