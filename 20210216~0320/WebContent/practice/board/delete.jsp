<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="board.BoardDAO"></jsp:useBean>
<c:set var ="row" value="${dao.deleteBoard(param.idx)}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
		<%--
		insert, update, delete가 int 형의 row(행)을 반환하게 하는 이유
		
		작업이 잘 처리되었는지 결과를 확인하고,
		결과에 따라서 다른 동작이 되게 끔 코드를 작성할 수 있다.
		
		ex) row(=행)이 0 제대로 삭제 되지않음 => 경고창 보여주며 메인 페이지로 이동
			row가 1이 이상이 반환되면 삭제가 됨 = >메인 페이지로 이동 하게끔
	
	--%>
	<c:if test="${row == 1 }">
	
		<c:redirect url ="board.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${row == 0 }">
		<script>
			alert("존재하지않는 게시물입니다")
			location.replace("board.jsp");
		</script>
	</c:if>
</body>
</html>