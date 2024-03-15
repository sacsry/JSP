<%@page import="model1.bbs.BbsDAO"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
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
<%
	BbsDAO dao = new BbsDAO(application);
	BbsDTO dto = new BbsDTO();
	dto.setUser_id(request.getParameter("user_id")); 
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	int result = dao.bbsRegist(dto);
	dao.close();
	if(result >0){
		response.sendRedirect("list.jsp");
	}
	else{
		out.println("<script>");
		out.println("alert('오류 발생! 제목이랑 내용이 반드시 들어가야합니다!')");
		out.println("window.location.replace('list.jsp')");
		out.println("</script>");
	}
%>
</body>
</html>