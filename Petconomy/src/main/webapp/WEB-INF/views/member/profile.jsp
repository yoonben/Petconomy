<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
    
</script>
    
</head>
<body>
<h2>마이페이지</h2>
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


    
    

<form id='profileForm' name='profile' action='/peco/profile_Update?m_id=${member.m_id}' method='post'>
	<c:set var="memberVO" value="${member }"/>

	<table border='1px' width='400px' height='450px'>
		<tr>
			<th>프로필사진</th>
		
			<td><img id='img_profile' src="/peco/display?fileName=${profile}"></td> <!-- 회원가입시 등록한 프로필사진 -->
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
			<td><input type="text" id="maskedPassword" value="${member.pw }" readonly style="height:100%; width:98%"></td>
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
														
	<input type="submit" value="수정하기" class="btn" ><br><br>
</form>
	<button id="P&H"  onclick="location.href='/peco/phProfile'">내 업체 관리</button>

</body>
</html>