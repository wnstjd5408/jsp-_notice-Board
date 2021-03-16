<%@page import="abc.ABCDTO"%>
<%@page import="abc.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 request.setCharacterEncoding("utf-8");
	
	%>
	<jsp:useBean id="check" class="abc.ABCDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="check"/>
	
	<%
		DAO dao = new DAO();
		int ch  = dao.idCheck(check);
	
		
		
		if(ch == 1){
			%>
			<br><br>
			<p> <%= check.getUserid() %> 는 사용 불가능한 아이디입니다 </p>
			<% 
		}else{
			%>
			<br><br>
			<p> <%= check.getUserid() %> 는 사용 가능한 아이디입니다</p>
			<%
		}
	
	%>
</body>
</html>