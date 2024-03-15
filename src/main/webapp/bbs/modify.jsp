<%@page import="common.CommonUtil"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
BbsDAO dao = new BbsDAO(application);
int idx = Integer.parseInt(request.getParameter("idx"));
BbsDTO bbsView = dao.bbsView(idx);
dao.close();

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
	/* content = (content != null ? content.replace("\r\n", "<br>") : "");
	content = (content != null ? content.replace(" ", "&nbsp;") : ""); */
	content = bbsView.getContent();
}
%> --%>
<%	
	boolean login = CommonUtil.loginCheck(session);
	if(login){
	int idx = Integer.parseInt(request.getParameter("idx"));
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	content = (content != null ? content.replace("\r\n", "<br>") : "");
	content = (content != null ? content.replace(" ", "&nbsp;") : "");
	int bordernum = Integer.parseInt(request.getParameter("bordernum"));
%>
<h2>게시판 수정 페이지</h2>
<form name="frmRegist" id="frmRegist" action="modify_ok.jsp" method="post">
<input type="hidden" name="idx" value=<%= idx %>>
<input type="hidden" name="bordernum" value=<%= bordernum %>>
<table>
	<tr>
		<td width="200">작성자 :</td>
		<td width="600"><input type="text" name="user_id" id="user_id" value="test3" readonly /></td>
	</tr>
	<tr>
		<td width="200">제목</td>
		<td colspan="3"><input type="text" name="title" id="title" value = <%=title %>  maxlength="100"/></td>
	</tr>
	<tr>
		<td width="200">내용</td>
		<td colspan="3">
			<textarea name="content" id="content" rows="10" cols="80">
			<%= content %>
			</textarea>
		</td>
	</tr>
</table>
<table style="border-collapse: collapse">
<tr>
	<td>
		<input type="submit" name="btn_submit" id="btn_submit" value="글수정"/>
		<input type="reset" name="btn_cancel" id="btn_cancel" value="취소" />
		<input type="button" name="btn_list" id="btn_list" value="글목록 페이지로" />
	</td>
</tr>
</table>
</form>
<script>
document.querySelector("#btn_list").addEventListener("click", function(e) {
	window.location.replace("list.jsp");
}, false);

document.querySelector("#btn_cancel").addEventListener("click", function(e) {
	window.location.replace("list.jsp");
}, false);
</script>
<%
}else{
	out.print("<script>alert('어딜 들어오누?');location.href='../login/login.jsp';</script>");}%>

</body>
</html>