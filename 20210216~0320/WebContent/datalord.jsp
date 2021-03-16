<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>datalord.jsp = 데이터불러오기 표</title>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	</head>
	<body>
		<jsp:useBean id="dao" class = "lord.ABC_DAO"></jsp:useBean>
		<c:set var ="list" value ="${dao.show()}"></c:set>
	
		<h1>abc 파일 불러오기</h1>
		<table class = "table">
			<thead>
				<tr>
					<th></th>
					<th>userid</th>
					<th>username</th>
					<th>age</th>
					<th>gender</th>
					<th>email</th>
					<th>address</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "member" items="${list }" varStatus="vst">
					<tr>
						<td>${vst.count }</td>
						<td>${member.userid }</td>
						<td>${member.username }</td>
						<td>${member.age }</td>
						<td>${member.gender }</td>
						<td>${member.email }</td>
						<td>${member.address }</td>
					</tr>
				</c:forEach>
					
			</tbody>
		</table>
		
		
	</body>
	</html>