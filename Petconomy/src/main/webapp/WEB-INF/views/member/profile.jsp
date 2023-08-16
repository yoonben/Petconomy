<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/410d7ec875.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<style>

#img_profile {
	width: 300px; 
	height: 300px;
	object-fit: cover;
	margin-left:100px;
	border-radius: 70px;
	box-shadow: 0px 3px 6px rgba(0, 0, 0.2, 0.2);
	border: 5px solid;
	border-color: #FF8C00;
	
	
	image-rendering:-webkit-optimize-contrast;
  	transform:translateZ(0);
  	backface-visibility:hidden;

}
#myprofileBtn-bottom-box{
	margin-top:20px;
	
}

#pension{
	width: 150px; 
	height: 50px;
	border-radius: 20px;
	margin: 0 24px;
	background-color: #FFFFFF;
}
#pension:hover {
	color: #FF8C00;
	background-color: #ffffff;
	margin: 0 24px;
}

#hospital{
	width: 150px; 
	height: 50px;
	border-radius: 20px;
	margin: 0 24px;
	background-color: #FFFFFF;
}
#hospital:hover {
	color: #FF8C00;
	background-color: #ffffff;
	margin: 0 24px;
}

#myBoard{
	width: 150px; 
	height: 50px;
	border-radius: 20px;
	margin: 0 24px;
	background-color: #FFFFFF;
}
#myBoard:hover {
	color: #FF8C00;
	background-color: #ffffff;
	margin: 0 24px;
}
#directRes{
	width: 300px; 
	height: 50px;
	border-radius: 20px;
	background-color: #FFFFFF;
}
#directRes:hover {
	color: #FF8C00;
	background-color: #ffffff;
}

.button-container {
    display: flex;
    justify-content: center;
    margin-top: 50px;
}

.main-button .btn{
	width: 150px; 
	height: 50px;
	border-radius: 20px;
	border: 2px solid;
	border-color: #black;
	background-color: #FFFFFF;	
	margin-top: 30px;
	
}
.main-button .btn:hover{
	color: #FF8C00;
	background-color: #ffffff;
	margin-top: 30px;
}

.main-button{
  display: flex;
  justify-content: center;
}

#profileTable{
	width : 100%; 
	height : 100%;
	margin-left : 40px;
}

#pensionImg{
	width: 100px; 
	height: 100px;
	border-radius: 70px;
}
#cancellation{
	width: 100px; 
	height: 40px;
	border-radius: 20px;
	border: 2px solid;
	border-color: #black;
	background-color: #FFFFFF;	
	margin: 10px;
}
#cancellation:hover{
	color: #FF8C00;
	background-color: #ffffff;
	margin: 10px;
}

</style>
	
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


<br><br><br>

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
                      <h1>나의 정보</h1>
                    </div>
                    
                <!-- 프로필 사진 시작-->
                  <div class="col-lg-3">
                    <img id='img_profile' src="/peco/display?fileName=${profile}" alt="프로필 사진" >
                    
                     </div>
                 <!-- 프로필 사진 끝--> 
                 
                  <div class="col-lg-2 align-self-center">
                  </div>
                  <!-- 나의 세부정보 시작 -->
                  <div class="col-lg-6 align-self-center">
                    <form id='profileForm' name='profile' action='/peco/profile_Update' method='post'>
						<c:set var="memberVO" value="${member}"/>
						<input type="hidden" name="m_id" value="${member.m_id}">
							<table id="profileTable">
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
									<td><input type="hidden" id="maskedPassword" 
												value="${member.pw }" readonly style="height:100%; width:99%">**********</td>
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
								  <input type="submit" value="수정하기" class="btn"><br><br>
				              </div>
					</form>
						<div id='myprofileBtn-bottom-box'>
							<button id="pension" name="pension" onclick="location.href='/peco/pensionProfile?m_id=${member.m_id}'">나의 펜션 관리</button>
							<button id="myBoard" name="myBoard" onclick="location.href='/peco/myBoard?m_id=${member.m_id}'">나의 글 목록</button>
                		 </div>
                  </div>
                  <!-- 나의 세부정보 끝 -->
                </div>
          	 </div>
          </div>
         

		  <!-- 나의 정보 끝 -->
		<br><br><br><br>

 		
		<!-- 펜션예약 시작 -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>펜션 예약내역</h4>
              </div>
             <form name='mypResForm' onsubmit="return false">
              <table width='100%' >
				<tr>
					<th><h5>펜션프로필</h5><span>Pension</span></th>
					<th><h5>펜션명</h5><span>Pension Name</span></th>
					<th><h5>예약번호</h5><span>Reservation Number</span></th>
					<th><h5>결제금액</h5><span>Payment Amount</span></th>
					<th><h5>이용날짜</h5><span>Date</span></th>
					<th><h5>예약자명</h5><span>Reservation Name</span></th>
					<th><h5>예약취소</h5><span>Cancellation</span></th>
				</tr>
				<c:if test="${fn:length(getPrList )==0}">
				<input type="text" name="m_id" value="${getPrList }">
					<tr>
						<td  colspan="9">예약내역이 없습니다</td>
					</tr>
				</c:if>
				
				<c:forEach var="pr" items="${getPrList }" varStatus="status">
					<tr>
						<input type="hidden" value="${status.index}" id="index"> 
						<td><img id='pensionImg' src="/peco/display?fileName=${pensionImg}" alt="펜션 프로필" ></td>
						<td>${pr.pname }</td> 
							<c:choose>
								<c:when test="${fn:length(pr.imp_uid) > 1}">
								<td><input type="hidden" class="index" id="imp_uid" data-puid="${status.index}" value="${fn:substring(pr.imp_uid,4,16)}" readonly>${fn:substring(pr.imp_uid,4,16)}</td>
									<td><input type="hidden" class="index" id="pcnt" data-pcnt="${status.index}" value="${pr.pricecnt }"readonly>${pr.pricecnt }</td>
								</c:when>
							</c:choose>
						<td>${pr.startdate } ~<br> ${pr.enddate }</td> 
						<td>${pr.pr_name }</td>
						<td><button id='cancellation' onclick="delPension(${status.index})">예약취소</button></td>
						
					</tr>
					
        
				</c:forEach>
				</table>
				</form>
         		<!-- 페이징처리-->
         		
          <!-- 펜션예약 끝 -->
           </div>
         </div>
         

          
          
          <!-- 병원예약 시작-->
           <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>병원 예약내역</h4>
              </div>
			
			<form name='myhResForm' onsubmit="return false">
 			<table width='100%' >

                <tr>
                  <th><h5>병원프로필</h5><span>Hospital</span></th>
                  <th><h5>병원명</h5><span>Hospital Name</span></th>
                  <th><h5>예약날짜</h5><span>Date</span></th>
                  <th><h5>예약시간</h5><span>Time</span></th>
                  <th><h5>결제금액</h5><span>Payment amount</span></th>
                  <th><h5>예약자명</h5><span>Reservation Name</span></th>
                  <th><h5>예약취소</h5><span>Cancellation</span></th>
                </tr>
				
				<c:if test="${fn:length(getHrList )==0}">
					<tr>
						<td  colspan="9">예약내역이 없습니다</td>
					</tr>
				</c:if>
				
				<c:forEach var="hr" items="${getHrList }" varStatus="status">
				<tr>
				<input type="hidden" value="${status.index}" id="index">
					<td><img src="/resources/assets/images/game-01.jpg" alt="" class="templatemo-item"></td>
					<td>${hr.hname }</td> 
					<c:choose>
						<c:when test="${fn:length(hr.imp_uid) > 1}">
							<td><input type="text" class="index" id="imp_uid" data-huid="${status.index}" value="${fn:substring(hr.imp_uid,4,16)}" readonly></td>
						</c:when>
					</c:choose>
					<td>${hr.hr_date }</td> 
					<td>${hr.hr_time }</td>
					<td><input type="text" class="index" id="pcnt" data-hcnt="${status.index}" value="${hr.pricecnt }"readonly></td>
					<td>${hr.hr_name }</td>
					<td style="border: none;"><button onclick="delHospital(${status.index})">예약취소</button></td>
				</tr>
				</c:forEach>
			</table>
		</form>		
         		<br><br>
              <div class="col-lg-12">
                <div class="main-button">
                  <a href="#" id="arrow-up"><i class="fa-solid fa-arrow-up-wide-short fa-2xl" style="color: #ffa238;"></i></a>
                </div>
              </div>
            </div>
          </div>
          <!-- 페이징처리-->
           <!-- 병원예약 끝-->
        </div>
    </div>
  </div>
 </div>
		      <div class="button-container">
		          <button type="button" id='directRes' onclick="location.href='/peco/main/pension'">예약하러가기</button>
		      </div>
</div>
  
 <script>
	//펜션 예약 취소
	function delPension(index) {
		var i = index;
		console.log(i);

		var imp_uid = 'imp_'+$('input[data-puid="'+index+'"]').val();
		var pay = $('input[data-pcnt="'+index+'"]').val();

		console.log(imp_uid);
		console.log(pay);
		console.log('삭제실행');
		
		$.ajax({

		      url: "payment/cancel", 
		      type: "Post",
		      data: ({
		        imp_uid: imp_uid, //주문번호
		        amount: pay, //결제금액
		        
	      })
	    }).done(function(result) { // 환불 성공시 로직 
	        alert("환불 성공");
	    
		        $.ajax({

		            url: "/peco/delete", 
		            type: "Post",
		            data: ({
		                  imp_uid: imp_uid //주문번호    
		            })
		        })
	    
	        alert("삭제완료");
		    location.reload();
	    
	    }).fail(function(error) { // 환불 실패시 로직
	      	alert("환불 실패");
	    });
		
	}
 </script>


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