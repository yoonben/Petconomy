<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	    
	<!-- 별점 cdn -->
	<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
	
	<script>
	  var jq = jQuery.noConflict();
	</script>
	
    <title>펫코노미 홈페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
  </head>
<style>
.main-banner {
    background-image: url(/resources/img/puppy.jpg);
}
.gaming-library .item ul li h4 {
    font-size: 15px;
    /* margin-bottom: 5px; */
}
.gaming-library {
    margin-top: 20px;
}
.main-button a {
    margin-top: 20px;
}
</style>
<script>
window.addEventListener('load',function(){
    
	// 로그인 폼 출력
    btn2.addEventListener('click',function(){
      pensionList.style.display='none';
      hospitalList.style.display='';
    })
	
    // 회원가입폼 출력
    btn1.addEventListener('click',function(){
    	pensionList.style.display='';
      hospitalList.style.display='none';
    })
})
</script>

<script>
jQuery(function ($) {
	jq(".test-score1").score();
})


</script>
<body>

  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- 헤더영역 시작-->
	<%@include file="../common/header.jsp" %>
  <!-- 헤더영역  끝-->

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <h2 style="color:white;">Welcome To Petconomy</h2>
                  <h4 style="color:white;"><em>Browse</em> Our Popular Ameneties Here</h4>
                  <div class="main-button">
                    <a href="browse.html">예약 바로가기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

              <div class="main-button" style="display:inline-block">
                <a id="btn1" style="color:white; font-size:1.5em">펜션</a>
              </div>
              
              <div class="main-button" style="display:inline-block">
                <a id="btn2" style="color:white; font-size:1.5em">병원</a>
              </div>
              


          <!-- ***** 펜션 리스트 시작  ***** -->
		  <form name="pensionList" >
		   <div class="gaming-library">
            <div class="col-lg-12" >
              <div class="heading-section">
                <h4><em>Top10</em> 펜션</h4>
               
              </div>
             <c:forEach items="${plist }" var="pvo">
              <div class="item">
                <ul>
                  <li style="width: 3%;"><h3>${pvo.rn }</h3></li>
                  <li style="width: 27%;"><h3>${pvo.pname }</h3></li>
                  <li style="width: 53%;"><h3>${pvo.addr }</h3></li>
                  <li style="width: 15%; font-size:1.5em; color:white;"><div class="test-score1" data-max="5" data-rate="${pvo.star }"></div>
                  (${pvo.cnt })</li>
                </ul>
              </div>
              </c:forEach>
             
            </div>
          </div>
		  </form>
		  <!-- 펜션 리스트 끝 -->

		  <!--  병원 리스트 시작 -->
		  	<form name="hospitalList" style='display:none'>
		    <div class="gaming-library">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>Top10</em> 병원</h4>
              </div>
	             <c:forEach items="${hlist }" var="hvo">
	              <div class="item">
	                <ul>
	                  <li style="width: 3%;"><h3>${hvo.rn }</h3></li>
	                  <li style="width: 25%;"><h3>${hvo.pname }</h3></li>
	                  <li style="width: 55%;"><h3>${hvo.addr }</h3></li>
	                  <li style="width: 15%; font-size:1.5em; color:white;"><div class="test-score1" data-max="5" data-rate="${hvo.star }"></div>
	                  (${hvo.cnt })</li>
	                </ul>
	              </div>
	              </c:forEach>
            </div>
          </div>
		  </form>
		  <!--  병원 리스트 끝 -->

          <div class="most-popular">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>오늘의 BEST</em> 짤</h4>
                </div>
                <div class="owl-features owl-carousel">
                
            <c:forEach items="${blist}" var="bvo" >
				  <div class="item">
				    <div class="thumb bestthumb">
				    
            		<a onclick="requestAction('/peco/board/view', ${bvo.bno })">
				      <img src="/peco/display?fileName=${bvo.s_savePath}" alt="" class="thumbnail-image">
				    </a>
				    
				      <div class="hover-effect">
				        <i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg" style="color: #ffa200;"> <h4> ${bvo.likecount }</h4></i>
				      </div>
				      
				    </div>
					    <div class="down-content">
		                    <div class="avatar">
		                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
		                    </div>
		                    <span style="color:white;"><i class="fa fa-check"></i> ${bvo.nickname}
		                    <h4 class="besttitle">${bvo.title } </h4></span>
		                    <a onclick="requestAction('/peco/board/view', ${bvo.bno })">
		                    </a>
		                </div> 
				  </div>
			</c:forEach>



            
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Most Popular End ***** -->


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

   <script src="/resources/assets/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>

</html>
