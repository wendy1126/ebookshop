<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String driver = "org.mariadb.jdbc.Driver";  //★드라이버 연결-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	String url = "jdbc:mysql://localhost:3306/board"; //★드라이버 연결 설정-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	Connection conn = null; //Connection conn 선언
	PreparedStatement pstmt = null; //PreparedStatement의 객체 pstmt 선언
	
	try {
		Class.forName(driver);  //★선언한 드라이버 연결된 것을 로드함-데이터연결 시 필요하므로 꼭 필요함(기본구문)
		
		conn = DriverManager.getConnection(url, "java","java");  //★드라이버 매니저 연결(선언한 url로 연결,아이디,비번)-데이터연결 시 필요하므로 꼭 필요함(기본구문)
		
		
		String id = request.getParameter("id"); //id로 id값 받아오기(joinForm.jsp에서)
		String pass = request.getParameter("pass"); //pass로 pass값 받아오기(joinForm.jsp에서)
		String name = request.getParameter("name"); //name로 name값 받아오기(joinForm.jsp에서)
		String email = request.getParameter("email");
		
		
		String sql = "INSERT INTO user VALUES(?,?,?,?,?)"; //데이터 입력 sql 구문 
		pstmt = conn.prepareStatement(sql); //Statement stmt = conn.createStatement(); + 실행문, 위의 sql구문을 pstmt로 받음
		pstmt.setString(1,id); //위의 sql구문에 들어갈 내용들
		pstmt.setString(2,pass); //위의 sql구문에 들어갈 내용들
		pstmt.setString(3,name); //위의 sql구문에 들어갈 내용들
		pstmt.setString(4,email);
		pstmt.setInt(5,1); //위의 sql구문에 들어갈 내용들
		pstmt.executeUpdate(); //데이터 다 받아서 업데이트(실행)함
		
		
		response.sendRedirect("login.jsp"); //회원가입 완료되면 loginForm.jsp로 이동
		
	} catch(Exception e) { //위의 조건이 실행되지 않을경우
		e.printStackTrace(); //오류 메세지 화면출력
		response.sendRedirect("join.jsp"); //joinForm.jsp로 이동
	}	
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>