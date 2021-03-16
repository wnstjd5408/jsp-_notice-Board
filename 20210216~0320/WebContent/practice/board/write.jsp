<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("utf-8"); %>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="dao" class="board.BoardDAO"></jsp:useBean>
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일 " var="today"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 - 새 글 작성</title>
	<link rel="stylesheet" href="../../css/board.css">
	<link rel="stylesheet" href="../../css/site.css">
</head>
<body>
	<main>
		<c:if test="${pageContext.request.method =='GET' }">
			<div class="vbox w1200 write">
				<form method="POST">
					<input type ="hidden" name ="ipaddr" value="${pageContext.request.remoteAddr }">
					<input type = "hidden" name = "date"  value = "${today }">
					<div class="w1200 fs">
						<p><input type="text" name ="title" placeholder="제목" autofocus required></p>
						<p><input type="text" name ="writer" placeholder="작성자" required></p>
						<div class= "w1200 h500 boda">
							<textarea name="content" placeholder="내용을 작성하세요" required></textarea>
						</div>
					</div>
					<div class = "w1200 sb hbox">
					
						<div>
							<input type ="button" value="돌아가기" class="btn" onclick="history.back()">
						
						</div>
						<div>
							<input type="submit" valuse="작성" class="btn">
						
						</div>
					</div>
				
				</form>
			</div>
		
		
		</c:if>
		<c:if test="${pageContext.request.method =='POST' }">
	
			<jsp:useBean id="write" class="board.BoardDTO"></jsp:useBean>
			<jsp:setProperty property="*" name="write"/>
		
		
			<c:set var = "idx" value="${dao.insertBoard(write) }"></c:set>
			<c:redirect url = "board.jsp"></c:redirect>
		
		</c:if>
	</main>
</body>
</html>