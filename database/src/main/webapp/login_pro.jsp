<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	String id = request.getParameter("id"); //login에서 id값 받아오는 구문
	String pass = request.getParameter("pass");//login에서 pass값 받아오는 구문

	String driver = "org.mariadb.jdbc.Driver"; //★드라이버 연결-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	String url = "jdbc:mysql://localhost:3306/board"; //★드라이버 연결 설정-데이터연결 시 필요하므로 꼭 필요함(기본구문)
	 
	Class.forName(driver); //★데이터연결 시 필요하므로 꼭 필요함(기본구문)
		
	Connection conn = DriverManager.getConnection(url, "java","java"); //★데이터연결 시 필요하므로 꼭 필요함(기본구문)
	PreparedStatement pstmt = null;  //★데이터연결 시 필요하므로 꼭 필요함(기본구문)		
	
	
	String sql = "SELECT * FROM user WHERE id=?"; //데이터베이스에서 가져오는 내용(select...)을 sql이라는 String 문자열에 넣음
	
	pstmt = conn.prepareStatement(sql); //Statement stmt = conn.createStatement();와 실행문을 합친것
	pstmt.setString(1, id); //첫번째(1)에 id값을 넣어줌
	ResultSet rs = pstmt.executeQuery(); //테이블의 내용(sql)을 rs에 담아서 실행
	
	
	while(rs.next()){//rs에 데이터가 있는 동안
		String id1= rs.getString(1); //mem테이블에 있는 id를 id1값에 넣음
		String password = rs.getString(2); //mem테이블에 있는 pass를 password값에 넣음
		String name = rs.getString(3); //mem테이블에 있는 name을 name에 넣음
		String email = rs.getString(4);
		int level = rs.getInt(5);
		
		if(id.equals(id1)&&pass.equals(password)){ //입력한 id,pass가 테이블에 있는 id1과 password가 동일하다면
			session.setAttribute("id",name); //id라는 이름으로 세션에 name값을 setting 해줌(id를 받아서 name을 가져옴)
			session.setAttribute("id1", id1);
			session.setAttribute("level",level); //id라는 이름으로 세션에 name값을 setting 해줌(id를 받아서 name을 가져옴)
			session.setAttribute("email", email);
			response.sendRedirect("index.jsp"); //위 조건이 맞으면 list.jsp로 화면이 넘어감
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("비밀번호를 확인하세요.");
history.back();
</script>

</body>
</html>