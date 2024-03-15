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
	<%
	BbsDAO dao = new BbsDAO(application);
	BbsDTO dto = new BbsDTO();
	
	dto.setIdx(Integer.parseInt(request.getParameter("idx")));
	
	int result = dao.bbsDelete(dto);
	dao.close();
	if(result>0){
		response.sendRedirect("list.jsp");
	}
	else{
		out.print("오류 발생");
	}
	%>
</body>
</html>