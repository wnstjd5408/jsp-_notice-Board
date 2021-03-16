<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="abc.ABCDTO"%>
<%@page import="abc.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<jsp:useBean id="dao" class="abc.DAO"></jsp:useBean>
	<c:set  var ="list" value="${dao.abcshow() }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinlist.jsp = 회원 리스트</title>
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	h2{
	text-align: center;
	
	}
</style>
</head>
<body>

  <h2>회원정보 </h2>
  <hr>
  
  
  <table class = "table">
  	<tr>
  		<th>ID</th>
  		<th>PW</th>
  		<th>이름</th>
  		<th>나이</th>
  		<th>성별</th>
  		<th>이메일</th>
  		<th>주소</th>
  	</tr>
  	<c:forEach var = "member" items="${list }">
	  	<tr>
	 		<td>${member.userid }</td>
	 		<td>${member.userpw }</td>
	 		<td>${member.username }</td>
	 		<td>${member.age }</td>
	 		<td>${member.gender }</td>
	 		<td>${member.email }</td>
	 		<td>${member.address }</td>
	  	</tr>  	
  		  		
  	</c:forEach>
  
  </table>
	<p><a href = "main.jsp"><button>돌아가기</button></a>


</body>
</html>