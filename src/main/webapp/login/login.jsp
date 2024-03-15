<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
	label{
		float:left;
		width:100px;
	}
	ul{
		
	}
	li{
		
		list-style:none;
		margin:10px;
		
	}
</style>
<body>

<h2>로그인 페이지</h2>
<form action="login_ok.jsp" method="post">
	<fieldset>
		<ul>
			<li><label for="user_id">아이디:</label><input type ="text" name="user_id" id="user_id" maxlength="20" value=""></li>
			<li><label for="pwd">비밀번호:</label><input type ="password" name="pwd" id="pwd" maxlength="30"></li>
			<li><input type="submit" value="로그인" id="loginbtn" name="loginbtn"> <input type="checkbox" id="idcheck" name="idcheck" >아이디 저장하기</li>
		</ul>
	</fieldset>
</form>
</body>
</html>