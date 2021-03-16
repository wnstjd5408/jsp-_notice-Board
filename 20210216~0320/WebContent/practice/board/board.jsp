<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="../../css/board.css">
			<link rel="stylesheet" href="../../css/site.css">
		</head>
		<body>
			<jsp:useBean id="dao" class ="board.BoardDAO"></jsp:useBean>
			<c:set var = "list" value="${dao.selectAll()}"></c:set>
			
			<main>
				<table id="boardList">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th>
							<th>IP Address</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var ="board" items ="${list }">
						
							<tr>
								<td class ="idx">${board.idx }</td>
								<td class = "title">
									<a href="view.jsp?idx=${board.idx}">
										${board.title }
									</a>
								</td>
								<td class ="writer">${board.writer }</td>
								<td class = "creationDate">${board.creationDate }</td>
								<td class = "viewCount">${board.viewCount }</td>
								<td class = "ipaddr">${board.ipaddr }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="hbox pageing">
					페이징
				</div>
				<div class="hbox w1200 sb">
					<div></div>
					<div>
						<a href="write.jsp">
							<button>새글 작성</button>
						</a>
					
					</div>
				</div>
			
			</main>
		</body>
	</html>