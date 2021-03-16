<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<h1>JSTL 연습해보기</h1>
			<hr>
			
			<c:if test="${empty param.age
			 }">
				<form method="post">
				
					<p> 나이를 입력하세요 : 
						<input type = "number" name ="age">
						<input type = "submit" value="전송">
					</p>
				</form>	
			
			</c:if>
			<c:if test="${param.age < 0 }">
				<h2>잘못입력하였습니다</h2>
				<a href = "ex01.jsp"><button>돌아가기</button></a>
			</c:if>
			<c:if test="${param.age < 20  and param.age > 0 }">
				<h2>당신은 미성년자입니다</h2>			
				<a href = "ex01.jsp"><button>돌아가기</button></a>
			</c:if>
			<c:if test="${param.age >= 20 }">
				<h2>당신은 성인입니다</h2>			
				<a href = "ex01.jsp"><button>돌아가기</button></a>		
			</c:if>
		</body>
	</html>