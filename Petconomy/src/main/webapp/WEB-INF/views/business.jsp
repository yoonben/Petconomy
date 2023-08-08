<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src='/resources/js/jquery-3.7.0.js'></script>

<title>페코 업소등록</title>

<script type="text/javascript">
window.addEventListener('load', function(){
	pensionSignup.addEventListener('click', function(e){
		// 기본 이벤트 제거
		e.preventDefault();
		
		// pensionPark 체크박스에 대한 NodeList를 가져옴
		let selectedPensionPark = document.querySelector('input[name="pensionPark"]:checked').value;	
		
		let m_id = `${member.m_id}`;
		let pname = pensionName.value;
		let addr = sample6_address.value+sample6_extraAddress.value+" "+sample6_detailAddress.value;
		let openhour  = pensionHour.value;
		let parkyn = selectedPensionPark; 
		let latitude = pensionLatitude.value;
		let longitude = pensionLongitude.value;
		
		obj = {
				m_id : m_id
				,pname : pname
				,addr : addr
				,openhour : openhour
				,parkyn  : parkyn
				,latitude : latitude
				,longitude : longitude
		}

		console.log('패션 가입 obj : ', obj);
		
		fetchPost('/peco/pensionInsert', obj, (map)=>{
					if(map.result == 'success'){
						document.querySelector('#p_id').value = map.p_id;
						
						let formData = new FormData(businessForm);
			 			 
						
						console.log("formData : ", formData);
						
						for(var pair of formData.entries()){
							console.log(pair);
							if(typeof(pair[1]) == 'object'){
								let fileName = pair[1].name;
								let fileSize = pair[1].size;
								// 파일 확장자, 크기 체크
								// 서버에 전송 가능한 형식인지 확인
								// 최대 전송가능한 용량을 초과하지 않는지
								if(!checkExtension(fileName,fileSize)){
									return false;
								}
								
								console.log('fileName',pair[1].name);
								console.log('fileSize',pair[1].size);
							
							}
						}
						
						fetch('/peco/PenssionloadActionFetch'
								,{ 
									method : 'post'
									, body : formData
						})
						.then(response=>response.json())
						.then(map => fileuploadRes(map));
					}else{
						signupMsg.innerHTML = map.msg;
					}
		});
		
	})
	
	function fileuploadRes(map){
		if(map.result == 'success'){
			alert(map.msg);
		}else{
			alert(map.msg);
		}
	}
	
	function checkExtension(fileName, fileSize) {
		let MaxSize = 1024 * 1024 *10;
		// .exe, .sh, .zip, .alz 끝나는 문자열
		// 정규표현식 : 특정 규칙을 가진 문자열을 검색하거나 치환 할때 사용
		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		if(MaxSize <= fileSize){
			alert("파일 사이즈가 초과하였습니다.");
			return false;
		}
		
		// 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 ㄹ먀ㅣ
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
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
	
})
</script>

<!-- Bootstrap core CSS -->
<%@include file="./commo/css.jsp"%>
</head>

<body>

	<!-- header -->
	<%@include file="./commo/header.jsp"%>
	
	
	<div class="container">
		<div class="page-content">
			<div class="page-business">
			<!-- ***** 업소 가입 ***** -->
			<form name='businessForm' id='businessForm'>

				<!-- 업소 등록 체크 인풋 -->
				<input type="text" name="p_id" id="p_id" value="">
				
				<h1 class="h3 mb-3 fw-normal">팬션 업소 등록</h1>
				<div id="signupMsg"></div>
				<div class="form-login">
					<div class="text-line">
						<input type="text" class="form-control" id="pensionName"	
						value="" placeholder="pension 이름"> 
					</div>
				</div>

					<div class="form-login">
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="도로명 주소"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
						
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
						    function sample6_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample6_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample6_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample6_postcode').value = data.zonecode;
						                document.getElementById("sample6_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample6_detailAddress").focus();
						            }
						        }).open();
						    }
						</script>
					</div>



					<div class="form-login"> 
						<div class="text-line">
							<input type="text" class="form-control" id="pensionHour"
							placeholder="운영시간" >
						</div>
					</div>

				<div class="form-login">
				    <div class="text-line">
				        <label><input type="radio" name="pensionPark" value="Y">추차 가능</label>
				        <label><input type="radio" name="pensionPark" value="N" checked="checked">추차 불가능</label>
				    </div>
				</div>


				<div class="form-login">
					<div class="text-btnline">
						<input type="text" class="form-control" id="pensionHomePage" placeholder="홈페이지 주소"> 
					</div>
				</div>
				
				<div class="text-line">
					<div class="form-login">
						<input type="text" class="form-control" id="pensionPhoneNum" placeholder="전화번호"> 
					</div>
				</div>
				
				<div class="text-line">
					<div class="form-tude">
						<input type="text" class="form-control" id="pensionLatitude" placeholder="위도"> 
					</div>
					<div class="text-line">
					<div class="form-tude">
						<input type="text" class="form-control" id="pensionLongitude" placeholder="경도"> 
					</div>
				</div>
				</div>
				
				<div class="form-login">
					<label for="signUpPwCheck">사업자 등록 이미지</label>
					<input type="file" class="form-control" id="files" name="files">
				</div>
				
				<div class="form-login">
					<label for="signUpPwCheck">펜션 이미지</label>
					<input type="file" class="form-control" id="files" name="pensionimg">
				</div>
				
				<div class="form-login">
					<label for="signUpPwCheck">펜션 방 이미지</label>
					<input type="file" class="form-control" id="files" name="roonimg">
				</div>
				
				<button class="w-100 btn btn-lg btn-primary" type="submit"  id="pensionSignup">업소 등록</button>
			</form>
			</div>
			<!-- ***** 회원가입 End ***** -->
		</div>
	</div>


	<footer> </footer>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"
		integrity="sha512-8Y8eGK92dzouwpROIppwr+0kPauu0qqtnzZZNEF8Pat5tuRNJxJXCkbQfJ0HlUG3y1HB3z18CSKmUo7i2zcPpg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/resources/assets/js/isotope.min.js"></script>
	<script src="/resources/assets/js/owl-carousel.js"></script>
	<script src="/resources/assets/js/tabs.js"></script>
	<script src="/resources/assets/js/popup.js"></script>
	<script src="/resources/assets/js/custom.js"></script>

</body>

</html>