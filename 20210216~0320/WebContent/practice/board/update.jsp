<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class ="board.BoardDAO"></jsp:useBean>
<c:set var = "dto"  value="${dao.selectOne(param.idx)}"></c:set>
<!DOCTYPE html>
	<html>
		<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../../css/board.css">
		<link rel="stylesheet" href="../../css/site.css">
		</head>
		<body>	
			<main>
				<c:if test = "${pageContext.request.method == 'GET' }">
					<div  class = "vbox w1200 write">
						<form method = "post">
							<input type = "hidden" name = "ipaddr" value ="${pageContext.request.remoteAddr }">
							<div class ="w1200 fs">
								<p>
									<input type ="text" name ="title" placeholder="제목" 
									autofocus required value="${dto.title }">
								</p>
								<p>
									<input type ="text" name ="writer" placeholder="작성자" 
									required value="${dto.writer }">
								</p>
								<div class ="w1200 h500 boda">
									<textarea name="content" placeholder="내용을 작성하세요" required>${dto.content }</textarea>
								</div>
									
							</div>
							<div class ="w1200 sb hbox">
								<div>
									<input type="button" value="돌아가기" class="btn" onclick="history.back()">
								</div>
								<div>
									<input type="submit" valuse="작성" class="btn">
								</div>
							</div>
						</form>
					
					</div>	
			
				</c:if>
					<c:if test="${pageContext.request.method == 'POST' }">
		
					 <jsp:useBean id="write" class="board.BoardDTO"></jsp:useBean>
					 <jsp:setProperty property="*" name="write"/>
					 
					 
					 <c:set var="row" value="${dao.updateBoard(write) }"></c:set>
					 
					 <c:if test="${row == 1 }">
					 	<c:redirect url="view.jsp?idx=${write.idx }"></c:redirect>
					 </c:if>
					 <c:if test="${row == 0 }">
					 	<script>
							alert("존재하지않는 게시물입니다.")
							location.replace("board.jsp");
						</script>
					 </c:if>
					 <c:redirect url="board.jsp"></c:redirect>
<%-- 					 <c:redirect url="/view.jsp?idx=${idx } }"></c:redirect> --%>
					 
					 
				
				</c:if>
			</main>
		</body>
	</html>