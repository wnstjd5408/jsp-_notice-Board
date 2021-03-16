<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp 로그인화면</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.naver.com/favicon.ico?1">
</head>
<body>
	<c:if test="${login == null }">
		<c:redirect url="index.jsp"></c:redirect>
	</c:if>
	


	<iframe width="700" height="586" 
	src="https://www.youtube.com/embed/gFGZ_gPGels?list=PLL3hcqGWa8Zrmzf9X9ggeMgx8hcQW7r5A?rel=0;apm;autoplay=1" 
	frameborder="0" allow="accelerometer; autoplay; 
	clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</body>

</html>