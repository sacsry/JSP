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
	
	String bbs_idx = request.getParameter("idx");
	
	int idx = 0;
	idx = (bbs_idx !=null && !bbs_idx.isEmpty() ? Integer.parseInt(bbs_idx) : 0);
	BbsDAO dao = new BbsDAO(application);
	BbsDTO dto = new BbsDTO();
	
	String content = request.getParameter("content");
	content = (content != null ? content.replace("\r\n", "<br>") : "");
	content = (content != null ? content.replace(" ", "&nbsp;") : "");
	
	dto.setIdx(idx);
	dto.setUser_id(request.getParameter("user_id"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(content);
	int bordernum = Integer.parseInt(request.getParameter("bordernum"));
	
	int result = dao.bbsModify(dto);
	dao.close();
	if(result>0){
		response.sendRedirect("view.jsp?idx="+dto.getIdx()+"&bordernum="+bordernum);
	}
	else{
		out.print("오류 발생");
	}
	%>
</body>
</html>