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
<h2>나의 펜션 정보 수정</h2>

<%
String p_id = request.getParameter("p_id");
String m_id = request.getParameter("m_id");
String pName = request.getParameter("pName");
String Addr = request.getParameter("Addr");
String openHour = request.getParameter("openHour");
String ParkYN = request.getParameter("ParkYN");
String checkYN = request.getParameter("checkYN");

System.out.println("p_id : " + p_id);
System.out.println("m_id : " + m_id);

%>

<form id='P_ProfileUpdateForm' name='P_ProfileUpdate' action='/peco/pensionProfile' method='post'>
	<c:set var="PensionVO" value="${pension }"/>
		<table border='1px' width='400px' height='450px'>
		<tr>
			<th>펜션번호</th>
			<td><input type='text' name='p_id' readonly value='${PensionVO.p_id }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type='text' name='m_id' readonly value='${PensionVO.m_id }'  style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>펜션명</th>
			<td><input type='text' name='pname' value='${PensionVO.pname }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td><input type='text' name='addr' value='${PensionVO.addr }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td><input type='text' name='openhour' value='${PensionVO.openhour}' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>주차여부</th>
			<td><input type='text' name='parkyn' value='${PensionVO.parkyn}'  style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>승인여부</th>
			<td><input type='text' name='checkyn' value='${PensionVO.checkyn}' style="height:100%; width:99%"></td>
		</tr>
	</table>
	
	<input type="submit" value="확인" class="btn">
	<input type="reset" value="초기화">

</form>

</body>
</html>