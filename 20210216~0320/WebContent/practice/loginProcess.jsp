<%@page import="abc.ABCDTO"%>
<%@page import="abc.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProcess.jsp - 로그인 과정</title>
</head>
<body>
	<jsp:useBean id="dao" class="abc.DAO"></jsp:useBean>
 	<jsp:useBean id="login" class="abc.ABCDTO"></jsp:useBean>
 	<jsp:setProperty property="*" name="login"/>
	<c:set var = "list" value = "${dao.selectabc(login)}"></c:set>
	
	<c:if test="${list != null }">
		<c:set var="login" scope="session">로그인</c:set>
		<%
			String storeid = request.getParameter("storeid");
			String userid = request.getParameter("userid");
		
			Cookie csi = new Cookie("storeid", storeid);
			Cookie cui = new Cookie("userid", userid);
		
		
			if(storeid != null){
				csi.setMaxAge(60 * 60);
				cui.setMaxAge(60 * 60);
			}
			else{
				csi.setMaxAge(0);
				cui.setMaxAge(0);
			}
			response.addCookie(csi);
 			response.addCookie(cui);
		%>
		<script>
			alert('로그인 성공했습니다');
			location.replace('main.jsp');	
		</script>
	</c:if>
	<c:if test="${list == null }">
		<script>
			alert('로그인 실패했습니다');
			location.replace('login.jsp');	
		</script>
	
	
	</c:if>
	
	
	
	<%
		
		
// 		DAO dao = new DAO();
// 		ABCDTO dto = dao.selectabc(login);
		
		
// 		if(dto != null){
// 			out.print("<script>");
// 			out.print("alert('로그인 성공!!!!');");
		
// 			session.setAttribute("login", dto);
// 			String storeid = request.getParameter("storeid");
// 			String userid = request.getParameter("userid");
			
// 			Cookie csi = new Cookie("storeid", storeid);
// 			Cookie cui = new Cookie("userid", userid);
			
			
// 			if(storeid != null){
// 				csi.setMaxAge(60 * 60);
// 				cui.setMaxAge(60 * 60);
// 			}
// 			else{
// 				csi.setMaxAge(0);
// 				cui.setMaxAge(0);
// 			}
			
// 			response.addCookie(csi);
// 			response.addCookie(cui);
			
// 			response.sendRedirect("main.jsp");
// 			out.print("</script>");
// 		}else{
// 			out.print("<script>");
// 			out.print("alert('로그인 실패!!!!');");
// 			out.print("location.replace('login.jsp');");
// 			out.print("</script>");
// 		}
	
%>



</body>
</html>