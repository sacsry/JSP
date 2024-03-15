<%@page import="common.CommonUtil"%>
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
<h2><a href="list.jsp" style="text-decoration:none;">게시판 목록</a></h2>
<%
BbsDAO dao = new BbsDAO(application);
int idx = Integer.parseInt(request.getParameter("idx"));
int bordernum = Integer.parseInt(request.getParameter("bordernum"));
BbsDTO bbsView = dao.bbsView(idx);
dao.close();
%>
<%
int read_cnt = 0;
String user_id = "";
String reg_date = "";
String title = "";
String content = "";
if (bbsView != null) {	
	read_cnt = bbsView.getRead_cnt();
	user_id = bbsView.getUser_id();
	reg_date = bbsView.getReg_date().toString();
	title = bbsView.getTitle();
	//content = (content != null ? content.replace("\n\r", "<br>") : "");
	//content = (content != null ? content.replace(" ", "&nbsp;") : "");
	content = bbsView.getContent();
}

boolean login = CommonUtil.loginCheck(session);
%>
<table>
	<tr>
		<td>번호 : <%= bordernum %></td>
		<td>작성자 : <%= user_id %></td>
		<td>조회수 : <%= read_cnt %></td>
		<td>작성일 : <%= reg_date %></td>
	</tr>
	<tr>
		<td>제목 : </td>
		<td colspan="3"><%= title %></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td colspan="3"><%= content %></td>
	</tr>
</table>
<form action="modify.jsp">
	<input type="hidden" name="idx" value=<%= idx %>>
	<input type="hidden" name="id" value=<%= user_id %>>
	<input type="hidden" name="title" value=<%= title %>>
	<input type="hidden" name="content" value="<%= content %>">
	<input type="hidden" name="bordernum" value=<%= bordernum %>>
	
	<% if(user_id.equals(session.getAttribute("userId"))){ %>
	<input type="submit" value="수정">
	<input type="button" name="btn_cancel" id="btn_cancel" value="삭제" />
	<%} %>
	<input type="button" name="btn_list" id="btn_list" value="이전페이지로" />
</form>

<script>
document.querySelector("#btn_list").addEventListener("click", function(e) {
	if(<%=login%>){
		location.href="list.jsp";
	}
	else{
		alert("로그인 하셔야 합니다.");
		location.href="../login/login.jsp";
	}
});

document.querySelector("#btn_cancel").addEventListener("click", function(e) {
	if(confirm("정말 삭제하시겠습니까?")){
		location.href="delete_ok.jsp?idx="+<%=idx%>;
	}
	else{
		console.log("실패");
	}
	
});


</script>
</body>
</html>










