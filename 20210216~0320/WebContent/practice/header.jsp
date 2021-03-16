
<%@page import="abc.ABCDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.naver.com/favicon.ico?1">
<style>
	*{
		margin : 0;
		padding : 0;
	}
	
	body{
		width : 900px;
		height : 500px;
		margin : 0 auto;
		box-sizing: border-box;
	}
	
	nav {
		background-color: #18CE5F;
		width : 90%;
		height : 10%;
		display : flex;
		padding : 0 5%;
		justify-content: space-between;
		align-items: center;
		padding: 0 10px;
		
	}
	.logo{
		color : white;
		font-weight: bolder;
		fonr-size: 20px;
	}
	
	
	.menu{
		width : 50%;
		list-style: none;
		display : flex;
		justify-content: space-around;
	}
	
	a{
		text-decoration: none;
		color : white;
	}
	
	
	li > a:hover{
		color: white;
		border-bottom: 1px solid white;
	
	}
	
	form{
	
		width: 35%;
		margin: 0 auto;
		height: 30%;
	
	}
	
	

</style>
</head>
<body>
	<nav>
		<div class ="logo"><a href ="https://www.naver.com">NAVER</a></div>
		<ul class ="menu">
			<li><a href = "userlist.jsp">회원목록</a></li>
			<c:choose>
				<c:when test="${login == null }">
					<li><a href = "join_form.jsp">회원가입</a></li>
					<li><a href = "login.jsp">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><a href = "join_form.jsp"></a></li>
					<li><a href = "logout.jsp">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<br><hr><br>
	
	
</body>
</html>