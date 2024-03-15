<%@page import="common.CommonUtil"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<style>
	table,tr,td{
		border:1px solid black; 
		border-collapse:collapse;
		width:800px;
		margin:0px auto;
	}
	.searcharea{
		width:50%;
	}
	.searcharea>div{
		width:80%;
		margin:0px auto;
	}
	#btn_regist{
		float:right;
	}
	h2{
		margin:30px auto;
		width:150px;
	}
	
</style>
</head>
<body>
<% 
BbsDAO dao = new BbsDAO(application);
Map<String,Object> param = new HashMap<String,Object>();
String search_category = request.getParameter("search_category");
String search_word = request.getParameter("search_word");
if(search_word != null &&!search_word.isEmpty() && search_category !=null &&!search_category.isEmpty()){
	param.put("search_category", search_category);
	param.put("search_word", search_word);
}

int total_count = dao.bbsTotalCount(param);
List<BbsDTO> bbsList = dao.bbsList(param);
dao.close();

boolean login = CommonUtil.loginCheck(session);
System.out.println(login);
String loginval = "로그인";
if(login){
	loginval = "로그아웃";
}
else{
	loginval = "로그인";
}
%>
	<div><h2> 게시글 목록 </h2></div>
	
	<table id="search_table">
		<tr>
			<td class="searcharea">
				<div>
				<select name="search_category" id="search_category">
					<option value="" selected>선택</option>
					<option value="title" >제목</option>
					<option value="content" >글내용</option>
					<option value="user_id" >작성자</option>
				</select>
				<input type="text" name="search_word" id="search_word" value="" maxlength=""/>
				<input type="button" name="btn_search" id="btn_search" value="검색"/>
				</div>
			</td>
			<td class="registarea">
			<input type="button" name="btn_regist" id="btn_regist" value="글 등록"/>
			<%if(login){
				out.println(session.getAttribute("userId")+"님 어서오세요!");
			}
			%>
			<input type="button" name="login" id="login" value="<%=loginval %>"/>
			</td>
		</tr>
	</table>
	<table style="right:clear;">
		<thead>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		</thead>
		<tbody>
		<%if(bbsList.size()>=1){ %>
		<%for(int i = 0 ; i<bbsList.size(); i++){ %>
		<tr>
			<td><%=bbsList.size()-i %></td>
			<%if(login){%>
			<td><a href="view.jsp?idx=<%= bbsList.get(i).getIdx()%>&bordernum=<%=bbsList.size()-i %>"><%= bbsList.get(i).getTitle() %></a></td>
			<% }else if(!login){ %>
			<td><a href="../login/login.jsp" onclick="alert('로그인 해야 조회가능합니다.');"><%= bbsList.get(i).getTitle() %></a></td>
			<% } %>
			<td><%=bbsList.get(i).getUser_id() %></td>
			<td><%=bbsList.get(i).getRead_cnt() %></td>
			<td><%=bbsList.get(i).getReg_date() %></td>
		</tr>
		<%}
		}else{
			out.print("등록된 게시글이 없습니다");
		}
		%>
		</tbody>
	</table>
	
	<table>
		<tr>
			<td style="text-align:center;">
				<< < 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 > >> 
			</td>
		</tr>
	</table>
	
	<script>
 	btn_search =document.querySelector("#btn_search");
		btn_search.addEventListener('click', ()=>{
			search_category1 = document.querySelector("#search_category").value;
			search_word1 = document.querySelector("#search_word").value;
			
			location.href = "list.jsp?search_category="+search_category1+"&search_word="+search_word1;
		});
		
		document.querySelector("#btn_regist").addEventListener("click", ()=>{
			if(<%=login%>){
				location.href = "regist.jsp";
			}
			else{
				alert("로그인하셔야 작성 가능합니다.");
			}
			
		});
		
		let loginbtn = document.querySelector("#login");
		
		loginbtn.addEventListener("click", ()=>{
			if(loginbtn.value == "로그인"){
				location.href = "../login/login.jsp";
			}
			else{
				alert("로그아웃 성공");
				location.href = "../login/logout.jsp";
			}
		});
	</script>
</body>
</html>