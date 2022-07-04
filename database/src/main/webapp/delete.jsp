<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<%
	String driver = "org.mariadb.jdbc.Driver";  //★드라이버 연결-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	String url = "jdbc:mysql://localhost:3306/board"; //★드라이버 연결 설정-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	Connection conn = null; //Connection conn 선언
	PreparedStatement pstmt = null; //PreparedStatement의 객체 pstmt 선언
	ResultSet rs = null; //ResultSet 객체(rs)선언
	
	Class.forName(driver);  //★선언한 드라이버 연결된 것을 로드함-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	
	conn = DriverManager.getConnection(url, "java","java");  //★드라이버 매니저 연결(선언한 url로 연결,아이디,비번)-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	
	
	int id = Integer.parseInt(request.getParameter("id")); //어디선가 id값 가져오기
	String sql = "DELETE FROM message WHERE id=?"; //id값 받아온 것의 모든 데이터를 삭제
	pstmt = conn.prepareStatement(sql); //Statement stmt = conn.createStatement(); + 실행문 
	pstmt.setInt(1,id); //request.getParameter("id")를 이용해서 가져온 id를 첫번째물음표(1) sql문에 넣어줌
	pstmt.executeUpdate(); //데이터 받아와서 실행함(update)
	
	
	response.sendRedirect("list.jsp"); //실행 후 리스트로 돌아감
	
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