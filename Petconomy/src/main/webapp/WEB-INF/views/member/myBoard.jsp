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
<script type="text/javascript">
	console.log("board 넘어오는지===========: " + board);
</script>

<h2>내 글 목록 (게시글 / 댓글)</h2>	
<div id="myBoardList">
	<c:set var="boardVO" value="${board}"/>
	<table border='1px' width='90%' height='100px'>
		
			<tr height='30px'>
	
				<th>번호</th>
				<th>작성자</th>
				<th  colspan=2 >제목</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
			<tr>
				<td>${bno}</td>
				<td>${writer}</td>
				<td  colspan=2 >${title}</td>
				<td>${regdate}</td>
				<td>${visitcount}</td>
			</tr>
		</table>
		<!-- 페이징처리-->
</div>
	
</body>
</html>