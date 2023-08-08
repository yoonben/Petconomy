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
<h2>나의 병원 정보</h2>

<form id='H_ProfileForm' name='H_Profile' action='/peco/hospitalProfile_Update?m_id=${member.m_id}' method='post'>

	<c:set var="HospitalVO" value="${hospital }"/>

	<table border='1px' width='400px' height='450px'>

		<tr>
			<th>병원번호</th>
			<td>${hospital.h_id }</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td>${hospital.m_id }</td>
		</tr>
		<tr>
			<th>병원명</th>
			<td>${hospital.pname }</td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td>${hospital.addr }</td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td>${hospital.openhour}</td>
		</tr>
		<tr>
			<th>주차여부</th>
			<td>${hospital.parkyn}</td>
		</tr>
		<tr>
			<th>승인여부</th>
			<td>${hospital.checkyn}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td>${hospital.homepage}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${hospital.phone}</td>
		</tr>

	</table>
							
	<input type="submit" value="수정하기" class="btn" >
		
	<!-- TODO : 삭제 버튼 클릭시 기존 등록된 업체글 모두 삭제될 수 있도록  처리 매퍼에서 쿼리문 조인으로 작성-->
	<input type="button" value="삭제"><br><br>
</form>

<!-- ↓ ↓ ↓  예약정보 구현 ↓ ↓ ↓  -->
<h2>병원 예약 고객정보</h2>

</body>
</html>