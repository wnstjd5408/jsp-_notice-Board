<%@page import="abc.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="join" class="abc.ABCDTO"></jsp:useBean>
<jsp:setProperty property="*" name="join"/>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="abc.DAO"></jsp:useBean>
<c:set var="join" value="${dao.insertABC(join)}"></c:set>
	<%
// 		DAO dao = new DAO();
// 		int row = dao.insertABC(join);
	
// 		if(row >= 1){
// 			out.print("<script>");
// 			out.print("alert('회원가입 성공!!!!');");
// 			out.print("location.replace('index.jsp');");
// 			out.print("</script>");
// 		}else{
// 			out.print("<script>");
// 			out.print("alert(\'회원가입 실패입니다!!!\');");
// 			out.print("location.replace('join_form.jsp');");
// 			out.print("</script>");
// 		}
		
		
	%>
	<c:if test="${join >= 1 }">
		<script>
			alert('회원가입 성공!!!');
			location.replace('index.jsp');
		</script>
	</c:if>
	<c:if test="${join < 1 }">
		<script>
			alert('회원가입 실패입니다!!!!!!');
			location.replace('join_form.jsp');
		</script>
	</c:if>
	

</body>
</html>