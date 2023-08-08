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

<h1>사업자 페이지</h1>
<h2>나의 펜션 정보</h2>

<form id='P_ProfileForm' name='P_Profile' action='/peco/pensionProfile_Update?m_id=${pension.m_id}' method='post'>

	<c:set var="PensionVO" value="${pension}"/>

	<table border='1px' width='400px' height='450px'>

		<tr>
			<th>펜션번호</th>
			<td>${PensionVO.p_id }</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td>${PensionVO.m_id }</td>
		</tr>
		<tr>
			<th>펜션명</th>
			<td>${PensionVO.pname }</td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td>${PensionVO.addr }</td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td>${PensionVO.openhour}</td>
		</tr>
		<tr>
			<th>주차여부</th>
			<td>${PensionVO.parkyn}</td>
		</tr>
		<tr>
			<th>승인여부</th>
			<td>${PensionVO.checkyn}</td>
		</tr>
		<tr>
			<th>위도</th>
			<td>${PensionVO.latitude}</td>
		</tr>
		<tr>
			<th>경도</th>
			<td>${PensionVO.longitude}</td>
		</tr>
	</table>
							
	<input type="submit" value="수정하기" class="btn" >
		
	<!-- TODO : 삭제 버튼 클릭시 기존 등록된 업체글 모두 삭제될 수 있도록  처리 매퍼에서 쿼리문 조인으로 작성-->
	<input type="button" value="삭제"><br><br>
</form>

<!-- ↓ ↓ ↓  예약정보 구현 ↓ ↓ ↓  -->
<h2>펜션 예약 고객정보</h2>

</body>
</html>