<%@page import="abc.ABCDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${login != null }">
		<c:redirect url="index.jsp"></c:redirect>
	</c:if>

	<h2>회원가입</h2>
	<hr>
	<form action ="join_Process.jsp" method="post" name ="joinform" onsubmit="return check()">
		<p>
			ID : <input name ="userid" placeholder="ID" required>
			<input type="button" value="중복확인" onclick="idcheck()">
		</p>
		<p>PW : <input name ="userpw" type="password" placeholder="PW"></p>
		<p>NAME : <input name ="username" placeholder="이름"></p>
		<p>생년월일 : <input name ="age" type="date"></p>
		<p>
		<label>남<input name ="gender" type="radio" value ="남"></label>
		<label>여<input name ="gender" type="radio" value ="여"></label>
		</p>
		<p>이메일 : <input name="email" type="email" placeholder="이메일"></p>
		<p>주소 : <input name="address" placeholder="주소"></p>
		<p><input type ="submit" value ="회원가입"></p>
	</form>
	<script>
	
		function check() {
			if(!document.joinform.userid.value){
				alert("ID를 입력하세요");
				return false;
			}
			if(!document.joinform.userpw.value){
				alert("password를 입력해주세요");
				return false;
			}
			if(!document.joinform.email.value){
				alert("이메일을 입력해주세요");
				return false;
			}
		}
		function idcheck(){
			var userid = document.joinform.userid.value;
			if(userid.length < 1 || userid == null){
				alert("중복체크할 아이디를 입력하십시오");
				return false;
			}
			
			var url = "idCheck.jsp?userid=" + userid;
			open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizable=no,width=300,height=200");
		}
	</script>

</body>
</html>