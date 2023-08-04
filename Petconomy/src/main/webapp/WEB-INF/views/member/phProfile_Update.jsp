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
<h2>마이페이지</h2>

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

<form id='phProfileUpdateForm' name='phProfileUpdate' action='/member/phProfile' method='post'>
	<c:set var="pensionVO" value="${pension }"/>
		<table border='1px' width='400px' height='300px'>
		<tr>
			<th>펜션번호</th>
			<td><input type='text' name='p_id' readonly value='${pension.p_id }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type='text' name='m_id' readonly value='${pension.m_id }'  style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>펜션명</th>
			<td><input type='text' name='pName' value='${pension.getPName() }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td><input type='text' name='Addr' value='${pension.getAddr() }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td><input type='text' name='openHour' value='${pension.openHour }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>주차여부</th>
			<td><input type='text' name='ParkYN' value='${pension.getParkYN()}'  style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>승인여부</th>
			<td><input type='text' name='checkYN' value='${pension.getCheckYN()}' style="height:100%; width:99%"></td>
		</tr>
	</table>
	
	<input type="submit" value="확인" class="btn">
	<input type="reset" value="초기화">

</form>

</body>
</html>