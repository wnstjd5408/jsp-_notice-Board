<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp - 앞에 로그인 화면</title>
<style>
	.practice{
			width : 500px;
			height : 500px;
			margin: auto;
			}
</style>
</head>
<body>
	<c:if test="${login !=null }">
		<c:redirect url="main.jsp"></c:redirect>
	</c:if>
	<div class ="practice">
				<ul>
					<li><p>DB에 연결이 되어 있어야 한다 : <b>Connection</b></p></li>
					<li><p>SQL 명령어를 전달해야한다 : <b>Statement</b></p></li>
					<li>
						<p>결과를 받아서 자바 변수( = DTO객체)에 저장해야한다</p>
						<ol>
							<li><b>ResultSet --> Select문의 결과로 사용</b>
							<li><b>int --> insert, update, delete 문의 결과로 사용</b>
						
						
						</ol>
				
				</ul>
			
			</div>
	
	
</body>
</html>