<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class ="board.BoardDAO"></jsp:useBean>
<c:set var ="dto" value="${dao.selectOne(param.idx) }"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../../css/board.css">
		<link rel="stylesheet" href="../../css/site.css">
		<title>${dto.title }</title>
	</head>
	<body>
		<main>
			<div class ="vbox w1200">
				<div class ="w1200 fs">
					<p><b>${dto.title }</b></p>
				</div>
				<div class ="w1200 hbox sb">
					<div>${dto.writer}  (${dto.ipaddr}) | ${dto.creationDate }</div>
					<div>조회 ${dto.viewCount}</div>
				</div>
			
				<div class ="w1200 h500 boba">
					<pre>${dto.content }</pre>
				</div>
			</div>
			<div class ="hbox sb w1200">
			
				<div>
					<a href="board.jsp">
						<button class ="btn">목록으로</button>
					</a>
				</div>
				
				
				<div>
					<a href="update.jsp?idx=${dto.idx }">
					
						<button class = "btn">수정</button>
					</a>
					<button class ="btn" id ="deleteBtn">삭제</button>
				</div>
			</div>
			<script>
				const delteBtn = document.getElementById('deleteBtn');
				
				delteBtn.onclick = function() {
					const select = confirm('${dto.idx} 번 글을 정말 삭제하시겠습니까?');
					
					if (select) {
						location.replace('delete.jsp?idx=${dto.idx}');
					}
				};
			</script>
		</main>
	</body>
</html>