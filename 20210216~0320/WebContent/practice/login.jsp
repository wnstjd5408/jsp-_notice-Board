<%-- <%@page import="info.Login"%> --%>
<%@page import="abc.ABCDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>로그인</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="https://www.naver.com/favicon.ico?1">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
  
  	<c:if test="${login !=null }">
		<c:redirect url="main.jsp"></c:redirect>
	</c:if>
    <%
    	Cookie[] cookies = request.getCookies();
    	
    	String storeid = null;
    	String userid = null;
    	
    	
    	if(cookies != null){
    		
    		for(Cookie c : cookies){
    			if("storeid".equals(c.getName())) storeid = c.getValue();
    			if("userid".equals(c.getName())) userid = c.getValue();
    		}
    	}
    	
    	
    %>
<main class="form-signin">
  <form action = "loginProcess.jsp" method="post">
    <a href = "index.jsp"><img class="mb-4" src="../assets/brand/naver.PNG" alt="" width="291" height="56"></a>
    <label for="inputEmail" class="visually-hidden">ID</label>
    <input name = "userid" id="inputEmail" class="form-control"placeholder="아이디" required autofocus value=<%= storeid != null ? userid : "" %> >
    <label for="inputPassword" class="visually-hidden">Password</label>
    <input name ="userpw" type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" name ="storeid" <%=storeid != null ? "checked" : "" %>> ID 저장
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
  </form>
</main>



    
  </body>
</html>
