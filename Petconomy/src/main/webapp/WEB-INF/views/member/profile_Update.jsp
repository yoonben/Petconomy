<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		
		//비밀번호 '*'처리
		displayEncryptedPassword();
		
		
		// "사진 변경" 버튼 클릭 시
		  files.addEventListener('change', function() {
			console.log('파일 선택 이벤트 발생');
			  
		    let formData = new FormData(profileUpdateForm);
		    
		    formData.append('files', this.files[0]);
		    
			console.log("formData(1)=====================");
		    

		    fetch('/peco/profile_update_img', {
		      method: 'POST'
		      , body : formData
		    })
		    .then(response => {
			  if (!response.ok) {
			    throw new Error('Network response was not ok');
			  }
			console.log("formData(2)=====================");
			  return response.json(); // JSON으로 파싱하여 반환
			console.log("formData(3)=====================");
			})
		    .then(map => {
		      if (map.result === 'success') {
		        img_profile.src = '/peco/display?fileName=' + map.profileImg;
		         console.log("일단 여기까지는 된다");
		      } else {
		        console.error('프로필 사진 업데이트 실패');
		        alert("프로필 사진 업데이트 실패입니다.");
		      }
		    });
		  });
		  
		/*
		let btnUdate = document.getElementById("btnUdate");  
		
		//'확인' 버튼 클릭시 
		btnUdate.addEventListener('click', function(e){
			
			e.preventDefault();
			
			let my_m_id = m_id.value;
			let my_id = id.value;
			let my_pw = document.getElementById("maskedPassword").value;
			let my_name = mname.value;
			let my_nickname = nickname.value
			let my_emailValue  = email.value;
			let my_mage = age.value;
			let my_mphone = mphone.value;
	
			obj = {
					m_id : my_m_id
					,id : my_id
					,pw : my_pw
					,mname : my_name
					,age : my_mage
					,mphone  : my_mphone
					,email : my_emailValue 
					,nickname : my_nickname
			}
			
			console.log('회원기입 obj : ', obj);
	*/
			/*		
			fetchGet('/peco/profile', obj, (map)=>{
				if(map.result == 'success'){
					console.log("일단 여기까지==============")
					document.querySelector('#m_id').value = map.m_id;
					
					let formData = new FormData(profileUpdateForm);
					 
					
					console.log("formData : ", formData);
					
					for(var pair of formData.entries()){
						console.log(pair);
						if(typeof(pair[0]) == 'object'){
							let fileName = pair[0].name;
							let fileSize = pair[0].size;
							// 파일 확장자, 크기 체크
							// 서버에 전송 가능한 형식인지 확인
							// 최대 전송가능한 용량을 초과하지 않는지
							if(!checkExtension(fileName,fileSize)){
								return false;
							}
							
							console.log('fileName',pair[0].name);
							console.log('fileSize',pair[0].size);
						
						}
					}
*/
/*
					let formData = new FormData(profileUpdateForm);
					
					fetch('/peco/profileSave'
							,{ 
								method : 'post'
								, body : profileUpdateForm
					})
					.then(response=>response.json())
					.then(map => {
					      if (map.result === 'success') {
					        // 정보 업데이트 성공 시, 마이페이지로 이동
					        window.location.href = '/peco/profile';
					      } else {
					        updateMsg.innerHTML = map.msg;
					      }
				});	
					
					*/
/*			}
		})
		*/
	})

// post방식 요청
	function fetchPost(url, obj, callback){
		try{
			// url 요청
			fetch(url
					, {
						method : 'post'
						, headers : {'Content-Type' : 'application/json'}
						, body : JSON.stringify(obj)
					})
				// 요청결과 json문자열을 javascript 객체로 반환
				.then(response => response.json())
				// 콜백함수 실행
				.then(map => callback(map));			
		}catch(e){
			console.log('fetchPost', e);
		}
		
	}
	
	//get방식 요청
	function fetchGet(url, callback){
		try{
			// url 요청
			fetch(url)
				// 요청결과 json문자열을 javascript 객체로 반환
				.then(response => response.json())
				// 콜백함수 실행
				.then(map => callback(map));			
		}catch(e){
			console.log('fetchGet',e);
		}
	}
	
	function checkExtension(fileName, fileSize) {
		let MaxSize = 1024 * 1024 *10;
		// .exe, .sh, .zip, .alz 끝나는 문자열
		// 정규표현식 : 특정 규칙을 가진 문자열을 검색하거나 치환 할때 사용
		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		if(MaxSize <= fileSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		// 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다");
			return false;
		}
		return true;
	}
	
	function fileuploadRes(map){
		if(map.result == 'success'){
			alert(map.msg);
		}else{
			alert(map.msg);
		}
	}
})


</script>




</head>
<body>
<h2>마이페이지</h2>

<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String mName = request.getParameter("mName");
String mPhone = request.getParameter("mPhone");
String email = request.getParameter("email");
String nickname = request.getParameter("nickname");
String age = request.getParameter("age");

System.out.println("id : " + id);
System.out.println("pw : " + pw);

%>

<input type="text" id="updateMsg" name="updateMsg">
<form id='profileUpdateForm' name='profileUpdateForm' action='/peco/profile' method="post">
	<c:set var="memberVO" value="${member }"/>
		<table border='1px' width='400px' height='450px'>
		<tr>
			<th>프로필사진</th>
			<td style="height:150px">
				<img id='img_profile' src="/peco/display?fileName=${profile}">
				<div class="custom-file-input">
				  <input type="file" id="files" style="display: none;">
				  <label for="files" id="customFileLabel" style="display: inline-block; padding: 8px 20px; background-color: #007bff; color: #fff; cursor: pointer; border-radius: 5px;">사진 변경</label>
				</div>
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td><input type='text' name='m_id' id="m_id" readonly value='${member.m_id }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type='text' name='id' id="id" readonly value='${member.id }'  style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type='text' name='pw' id="maskedPassword" readonly value='${member.pw }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type='text' name='mname' id="mname" value='${member.mname }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type='text' name='mphone' id="mphone" value='${member.mphone }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type='text' name='email' id="email" value='${member.email }'  style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type='text' name='nickname' id="nickname" value='${member.nickname }' style="height:100%; width:99%"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type='text' name='age' id="age" value='${member.age }'  style="height:100%; width:99%" ></td>
		</tr>
	</table>
	
	<input type="submit" id = "btnUdate" value="확인" class="btn">
	<input type="reset" value="초기화">
</form>

</body>
</html>