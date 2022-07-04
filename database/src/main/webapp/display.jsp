<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
int level =(Integer)session.getAttribute("level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시글 내용</h3>
	<%
		String subject="", memo="", name="", time="", email="";
		int id = Integer.parseInt(request.getParameter("id"));
		
		Connection con = null;
		Statement stmt = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/board";
			con = DriverManager.getConnection(url, "java", "java");
		}
		catch(Exception e) {
			out.println("데이터베이스 접속에 문제가 있습니다.<br>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		//데이터베이스를 쿼리한다
		stmt = con.createStatement();
		String sql = "SELECT * FROM message WHERE id = " + id;
		ResultSet rs = stmt.executeQuery(sql);
		
		//쿼리 결과에서 데이터를 추출한다
		while(rs.next()) {
			subject = rs.getString("subject");
			memo = rs.getString("memo");
			name = rs.getString("name");
			time = rs.getString("time");
			email = rs.getString("email");			
		}
	%>
	<table border = "2">
		<tr>
			<td>제목</td>
			<td><%=subject %></td>
		</tr>
		
		<tr>
			<td>작성자</td>
			<td><%=name %></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td><%=memo %></td>
		</tr>
		
		<tr>
		</tr>
		
		<tr>
			<td>날짜</td>
			<td><%=time %></td>
		</tr>
		
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>		
	</table>
	<br>
	<br>
	<a href = "list.jsp">게시글 리스트 보기</a>
	
	<%if(level>=3) {%>
		<a href =delete.jsp?id=<%=id %>>삭제하기</a>
		<%}else {%>
		<h3>글 삭제는 레벨3 부터 가능</h3>
		<%} %>
	
	
</body>
</html>