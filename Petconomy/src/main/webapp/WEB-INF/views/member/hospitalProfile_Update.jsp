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
<h2>나의 병원 정보 수정</h2>

<form id='H_ProfileUpdateForm' name='H_ProfileUpdate' action='/peco/hospitalProfile' method='post'>
	<c:set var="HospitalVO" value="${hospital }"/>

	<table border='1px' width='400px' height='450px'>

		<tr>
			<th>병원번호</th>
			<td><input type='text' name='h_id' readonly value='${hospital.h_id }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type='text' name='m_id' readonly value='${hospital.m_id }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>병원명</th>
			<td><input type='text' name='pname' readonly value='${hospital.pname }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td><input type='text' name='addr' readonly value='${hospital.addr }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td><input type='text' name='openhour' readonly value='${hospital.openhour}' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>주차여부</th>
			<td><input type='text' name='parkyn' readonly value='${hospital.parkyn}' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>승인여부</th>
			<td><input type='text' name='checkyn' readonly value='${hospital.checkyn}' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td><input type='text' name='homepage' readonly value='${hospital.homepage}' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type='text' name='phone' readonly value='${hospital.phone}' style="height:100%; width:99%"></td>
		</tr>
	</table>
	
	<input type="submit" value="확인" class="btn">
	<input type="reset" value="초기화">

</form>

</body>
</html>