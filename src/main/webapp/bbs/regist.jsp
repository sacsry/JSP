<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<style>
table, tr, td {
	border: 1px solid black;
}
table {
	width: 90%;
}
</style>
</head>
<body>
<h2>게시판 등록 페이지</h2>
<form name="frmRegist" id="frmRegist" action="regist_ok.jsp" method="post">
<table>
	<tr>
		<td width="200">작성자 :</td>
		<td width="600"><input type="text" name="user_id" id="user_id" value=<%=session.getAttribute("userId") %> readonly /></td>
	</tr>
	<tr>
		<td width="200">제목</td>
		<td colspan="3"><input type="text" name="title" id="title" value=""  maxlength="100"/></td>
	</tr>
	<tr>
		<td width="200">내용</td>
		<td colspan="3">
			<textarea name="content" id="content" rows="10" cols="80">
			</textarea>
		</td>
	</tr>
</table>
<table style="border-collapse: collapse">
<tr>
	<td>
		<input type="submit" name="btn_submit" id="btn_submit" value="글등록"/>
		<input type="reset" name="btn_cancel" id="btn_cancel" value="취소" />
		<input type="button" name="btn_list" id="btn_list" value="이전페이지로" />
	</td>
</tr>
</table>
</form>
<script>
document.querySelector("#btn_list").addEventListener("click", function(e) {
	window.location.replace("list.jsp");
}, false);

</script>
</body>
</html>