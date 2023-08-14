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
                      <h1>나의 펜션정보</h1>
                    </div>
                    
					<div class="col-lg-6 align-self-center">
						<form id='P_ProfileForm' name='P_Profile' action='/peco/pensionProfile_Update?m_id=${member.m_id}' method='post'>
							<c:set var="PensionVO" value="${pension}"/>
							<table id="profileTable" width='100%' height='100%'>
						
								<tr>
									<th>펜션번호</th>
									<td>${PensionVO.p_id }</td>
								</tr>
								<tr>
									<th>회원번호</th>
									<td>${PensionVO.m_id }</td>
								</tr>
								<tr>
									<th>펜션명</th>
									<td>${PensionVO.pname }</td>
								</tr>
								<tr>
									<th>도로명주소</th>
									<td>${PensionVO.addr }</td>
								</tr>
								<tr>
									<th>운영시간</th>
									<td>${PensionVO.openhour}</td>
								</tr>
								<tr>
									<th>주차여부</th>
									<td>${PensionVO.parkyn}</td>
								</tr>
								<tr>
									<th>승인여부</th>
									<td>${PensionVO.checkyn}</td>
								</tr>
							</table>
													
							<input type="submit" value="수정하기" class="btn" >
								
							<!-- TODO : 삭제 버튼 클릭시 기존 등록된 업체글 모두 삭제될 수 있도록  처리 매퍼에서 쿼리문 조인으로 작성-->
							<input type="button" value="삭제"><br><br>
						</form>
	                </div>
          	 </div>
          </div>
          </div>
  
<br><br><br><br><br>                       
<!-- ↓ ↓ ↓  예약정보 구현 ↓ ↓ ↓  -->

		<!-- 펜션예약 시작 -->
          <div class="gaming-library profile-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4>펜션 예약 고객정보</h4>
              </div>
             <form name='mypResForm' onsubmit="return false">
              <table width='100%' >
				<tr>
					<th><h5>프로필</h5><span>Member</span></th>
					<th><h5>예약자명</h5><span>Reservation Name</span></th>
					<th><h5>예약번호</h5><span>Reservation Number</span></th>
					<th><h5>이용날짜</h5><span>Date</span></th>
					<th><h5>결제금액</h5><span>Payment Amount</span></th>
					<th><h5>연락처</h5><span>telephone</span></th>
					<th><h5>예약취소</h5><span>Cancellation</span></th>
				</tr>
				
				<c:if test="${fn:length(getPrList )==0}">
					<tr>
						<td  colspan="9">예약내역이 없습니다</td>
					</tr>
				</c:if>
				
				<c:forEach var="pr" items="${getPrList }" varStatus="status">
					<tr>
						<input type="hidden" value="${status.index}" id="index">
						<td><img src="/resources/assets/images/game-01.jpg" alt="" class="templatemo-item"></td>
						<td>${pr.pr_name }</td>
							<c:choose>
								<c:when test="${fn:length(pr.imp_uid) > 1}">
									<td><input type="text" class="index" id="imp_uid" data-puid="${status.index}" value="${fn:substring(pr.imp_uid,4,16)}" readonly></td>
								</c:when>
							</c:choose>
						<td>${pr.startdate }, ${pr.enddate }</td> 
						<td><input type="text" class="index" id="pcnt" data-pcnt="${status.index}" value="${pr.pricecnt }"readonly></td>
						<td style="border: none;"><button onclick="delPension(${status.index})">예약취소</button></td>
					</tr>
				</c:forEach>
				</table>
				</form>
         		<!-- 페이징처리-->
          <!-- 펜션예약 끝 -->
           </div>
         </div>

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