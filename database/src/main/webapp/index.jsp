<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
		String id = (String)session.getAttribute("id");	
		int level =(Integer)session.getAttribute("level");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인 페이지</title>
</head>
<body>

	<h3>'<%=id %>'님 반갑습니다.</h3>
	<%if(level==1){ %>
		<h3>레벨1은 게시판 보기 및 쓰기 권한 없음</h3>
		<%}else { %>
		<a href="list.jsp">게시판 리스트 보기</a>
		<%} %>
		
	
			
</body>
</html>