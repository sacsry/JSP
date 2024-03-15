<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		
		
		String driver = application.getInitParameter("Driver");
		String url = application.getInitParameter("URL");
		String dbId = application.getInitParameter("dbId");
		String dbPwd = application.getInitParameter("dbPwd");
		
		
		MemberDAO dao = new MemberDAO(driver,url,dbId,dbPwd);
		MemberDTO dto =	dao.getMemberInfo(id,pwd);
		dao.close();
		
		if(dto.getMemberId() != null){
			session.setAttribute("userId",dto.getMemberId());
			session.setAttribute("userName",dto.getName());
			response.sendRedirect("../bbs/list.jsp");
		}
		else{
			out.print("<script>alert('정보가 잘못되었습니다.');");
			out.print("location.href='login.jsp';</script>");
		}
		
	%>
</body>
</html>