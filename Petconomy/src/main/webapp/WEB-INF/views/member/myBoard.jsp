<%@page import="com.peco.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>내 글 목록 (게시글 / 댓글)</h2>	
<div id="myBoardList">
	<form id="myBoardList" name="myBoardList" >
		 <table border='1px' width='90%' height='100px'>
				<tr height='30px'>
					<th>번호</th>
					<th>작성자</th>
					<th  colspan=2 >제목</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
		
		
		<c:forEach var="boardVO" items="${board}">
				<tr>
					<td>${boardVO.bno }</td>
					<td>${boardVO.writer }</td>
					<td  colspan=2 >${boardVO.title}</td>
					<td>${boardVO.regdate}</td>
					<td>${boardVO.visitcount}</td>
				</tr>
			</c:forEach>
			</table>
	</form>
<!-- 페이징 처리 -->
</div>

</body>
</html>