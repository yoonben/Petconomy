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
<h2>나의 정보</h2>
<script type="text/javascript">

    	// 가상의 함수로 암호화된 비밀번호를 가져오는 것을 시뮬레이션합니다.
		function getEncryptedPasswordFromDatabase() {
	        return "7a24f95d72a81367e9ab6f13721c2bfa"; // 가상의 암호화된 비밀번호
	    }

    	//회원 비밀번호를 '*'로 표시하는 함수
	    function displayEncryptedPassword() {
	        let encryptedPassword = getEncryptedPasswordFromDatabase();
	        let maskedPassword = document.getElementById("maskedPassword");
	        
	        const maxStars = 10; // 원하는 '*' 개수를 설정합니다
	        
	        maskedPassword.value = "*".repeat(Math.min(encryptedPassword.length, maxStars));
	    }
	    
	window.addEventListener('load', function(){
		displayEncryptedPassword();
		
		})
		
</script>

<div> <!--  style=" text-align: center;"  위치조정 start(왼), center(중) , end(오) -->
	<form id='profileForm' name='profile' action='/peco/profile_Update' method='post'>
		<c:set var="memberVO" value="${member}"/>
		<input type="text" name="m_id" value="${member.m_id}">
			<table border='1px' width='90%' height='450px'>
				<tr>
					<th>프로필사진</th>
					<td><img id='img_profile' src="/peco/display?fileName=${profile}"></td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td>${member.m_id }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${member.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" id="maskedPassword" 
								value="${member.pw }" readonly style="height:100%; width:99%"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${member.mname}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${member.mphone}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${member.email}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${member.nickname}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${member.age}</td>
				</tr>
			</table>
															
		<input type="submit" value="수정하기" class="btn"><br><br>
	</form>
</div>

<div>
	<button id="pension" name="pension" onclick="location.href='/peco/pensionProfile?m_id=${member.m_id}'">나의 펜션 관리</button>
	<button id="hospital" name="hospital" onclick="location.href='/peco/hospitalProfile?m_id=${member.m_id}'">나의 병원 관리</button>
	<button id="myBoard" name="myBoard" onclick="location.href='/peco/myBoard?m_id=${member.m_id}'">나의 글 목록</button>
</div>	
<br><br>

<h2>나의 예약정보</h2>	
<table border='1px' width='90%' height='250px'>
	<tr height='50px'>
		<th colspan=6 >펜션 예약정보</th>
	</tr>
	<tr height='50px'>
		<th>펜션명</th>
		<th>예약객실</th>
		<th>예약번호</th>
		<th>예약날짜</th>
		<th>예약자명</th>
		<th>결제총액</th>
	</tr>
	<tr height='30px'>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr height='30px'>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table><br>
<!-- 페이징처리-->

<table border='1px' width='90%' height='250px'>
	<tr height='50px'>
		<th colspan=6 >병원 예약정보</th>
	</tr>
	<tr height='50px'>
		<th>병원명</th>
		<th>예약번호</th>
		<th  colspan=2 >예약날짜 및 시간</th>
		<th>예약자명</th>
		<th>결제총액</th>
	</tr>
	<tr height='30px'>
		<td></td>
		<td></td>
		<td   colspan=2 ></td>
		<td></td>
		<td></td>
	</tr>
	<tr height='30px'>
		<td></td>
		<td></td>
		<td   colspan=2 ></td>
		<td></td>
		<td></td>
	</tr>
</table>
<!-- 페이징처리-->


	

</body>
</html>