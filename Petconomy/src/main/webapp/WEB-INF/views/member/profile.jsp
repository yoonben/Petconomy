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
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
       <div class="page-content">
		 <div class="row">
			<!-- 나의 정보 시작  -->
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                    <div class="main-info header-text">
                      <h4>나의 정보</h4>
                    </div>
                <!-- 프로필 사진 시작-->
                  <div class="col-lg-3">
                    <img id='img_profile' src="/peco/display?fileName=${profile}" alt="" style="border-radius: 23px;">
                  </div>
                 <!-- 프로필 사진 끝--> 
                  <div class="col-lg-2 align-self-center">
                  </div>
                  <!-- 나의 세부정보 시작 -->
                  <div class="col-lg-6 align-self-center">
                    <form id='profileForm' name='profile' action='/peco/profile_Update' method='post'>
						<c:set var="memberVO" value="${member}"/>
						<input type="text" name="m_id" value="${member.m_id}">
							<table border='1px' width='90%' height='450px'>
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
						      <div class="main-button">
								  <a><input type="submit" value="수정하기" class="btn"></a><br><br>
									<button id="pension" name="pension" onclick="location.href='/peco/pensionProfile?m_id=${member.m_id}'">나의 펜션 관리</button>
									<button id="hospital" name="hospital" onclick="location.href='/peco/hospitalProfile?m_id=${member.m_id}'">나의 병원 관리</button>
									<button id="myBoard" name="myBoard" onclick="location.href='/peco/myBoard?m_id=${member.m_id}'">나의 글 목록</button>
				              </div>
					</form>
                  </div>
                  <!-- 나의 세부정보 끝 -->
                </div>
          	 </div>
          </div>
         
		  <!-- 나의 정보 끝 -->
		<br><br><br><br>
 		<h1>나의 예약정보</h1>
		<!-- 펜션예약 시작 -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>펜션 예약내역</h4>
              </div>
             
				<table border='1px' width='90%' height='250px'>
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
				</table><br>
				<!-- 페이징처리-->
              
              <table>
                <tr>
                  <th><h5>번호</h5><span>Sandbox</span></th>
                  <th><h5>이미지</h5><span>Sandbox</span></th>
                  <th><h5>업체명</h5><span>Sandbox</span></th>
                  <th><h5>예약일</h5><span>Sandbox</span></th>
                  <th><h5>예약자명</h5><span>Sandbox</span></th>
                  <th><h5>예약번호</h5><span>Sandbox</span></th>
                </tr>
              </table>
              
              <div class="item">
                <ul>
                  <li><img src="/resources/assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>Dota 2</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>24/08/2036</span></li>
                  <li><h4>Hours Played</h4><span>634 H 22 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">예약취소</a></div></li>
                </ul>
              </div>
           </div>
         </div>
          <!-- 펜션예약 끝 -->
          
          <!-- 병원예약 시작-->
           <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>병원 예약내역</h4>
              </div>
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
					</table>
					<!-- 페이징처리-->
					
              <table>
                <tr>
                  <th><h5>번호</h5><span>Sandbox</span></th>
                  <th><h5>이미지</h5><span>Sandbox</span></th>
                  <th><h5>업체명</h5><span>Sandbox</span></th>
                  <th><h5>예약일</h5><span>Sandbox</span></th>
                  <th><h5>예약자명</h5><span>Sandbox</span></th>
                  <th><h5>예약번호</h5><span>Sandbox</span></th>
                </tr>
              </table>
              
              <div class="item">
                <ul>
                  <li><img src="/resources/assets/images/game-01.jpg" alt="" class="templatemo-item"></li>
                  <li><h4>Dota 2</h4><span>Sandbox</span></li>
                  <li><h4>Date Added</h4><span>24/08/2036</span></li>
                  <li><h4>Hours Played</h4><span>634 H 22 Mins</span></li>
                  <li><h4>Currently</h4><span>Downloaded</span></li>
                  <li><div class="main-border-button border-no-active"><a href="#">예약취소</a></div></li>
                </ul>
              </div>
              <div class="col-lg-12">
                <div class="main-button">
                  <a href="#"><i class="fa-solid fa-arrow-up-wide-short fa-2xl" style="color: #ffa238;"></i></a>
                </div>
              </div>
            </div>
          </div>
           <!-- 병원예약 끝-->
          
        </div>
    </div>
  </div>
 </div>
</div>
  
 


  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved. 
          
          <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </footer>
	
	
	
 <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>






 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  
</body>
</html>