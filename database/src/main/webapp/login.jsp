<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>

	table {
		margin : auto;
		width : 300px;
		border : 1px solid gray;
		test-align : center;
	}	
	.td_title {
		forn-weight : bold;
		font-size : large;
		text-align : center;
	}
	
</style>
</head>
<body>
	<form name = "login" action = "login_pro.jsp" method = "post">
		<table>
			
			<tr>
				<td colspan = "2" class = "td_title">	로그인 페이지</td>
			</tr>
			
			<tr>
				<td><label for = "id">아이디 : </label></td>
				<td><input type = "text" name = "id" id = "id" /></td>
			</tr>
			
			<tr>
				<td><label for = "pass">비밀번호 : </label></td>
				<td><input type = "password" name = "pass" id = "pass" /></td>
			</tr>
			
			<tr>
				<td colspan = "2">
					<a href = "javascript:login.submit()">로그인</a>&nbsp;&nbsp;
					<a href = "join.jsp">회원가입</a>
				</td>
			</tr>		
		
		</table>	
	</form>
</body>
</html>