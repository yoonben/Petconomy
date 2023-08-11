<%@page import="com.peco.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/410d7ec875.js" crossorigin="anonymous"></script>
	
<title>Insert title here</title>

  	<!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    

</head>
<body>
  <!-- 헤더영역 시작-->
	<%@include file="../main/header.jsp" %>
  <!-- 헤더영역  끝-->

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