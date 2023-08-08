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
    margin-bottom: 20px;
}
.gaming-library .item ul li h4 {
    font-size: 15px;
    /* margin-bottom: 5px; */
}

.gaming-library .main-button {
    text-align: left;
    margin-bottom: -53px;
}

.gaming-library{
	margin : 10px;
}
</style>
<script>
jQuery(function ($) {
	jq(".test-score1").score();
})

		window.onload = function(){
    	// 로그인 폼 출력
        btn1.addEventListener('click',function(){
		var btn1= document.querySelector(".btn1");
          hospitalList.style.display='none';
          pensionList.style.display='';
        })
		
        // 회원가입폼 출력
        btn2.addEventListener('click',function(){
        	var btn2= document.querySelector(".btn2");
        	hospitalList.style.display='';
        	pensionList.style.display='none';
        })
      }
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

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        <img src="assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="../main/pension">펜션/병원</a></li>
                        <li><a href="details.html">커뮤니티</a></li>
                        <li><a href="streams.html">업소등록</a></li>
                        <li><a href="profile.html">로그인 <img src="assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <h2>Welcome To Petconomy</h2>
                  <h4><em>Browse</em> Our Popular Ameneties Here</h4>
                  <div class="main-button">
                    <a href="browse.html">예약 바로가기</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->

          <!-- ***** Gaming Library Start ***** -->
            <div class="col-lg-12">
              <div class="main-button">
                <a class="btn1">펜션</a>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="main-button">
                <a class="btn2">병원</a>
              </div>
            </div>
            
		          <form name='pensionList'>
		          <div class="gaming-library">
		            <div class="col-lg-12">
		              <div class="heading-section">
		                <h4><em>Top10</em> 펜션</h4>	                
		              </div>
		             <c:forEach items="${plist }" var="pvo">
		              <div class="item">
		                <ul>
		                  <li style="width: 3%;"><h3>${pvo.rn }</h3></li>
		                  <li style="width: 25%;"><h3>${pvo.pname }</h3></li>
		                  <li style="width: 53%;"><h3>${pvo.addr }</h3></li>
		                  <li style="width: 15%; font-size:1.5em; color:white"><div class="test-score1" data-max="5" data-rate="${pvo.star }"></div>
		                  (${pvo.cnt })
		                  </li>
		                </ul>
		              </div>
		              </c:forEach>
		            </div>
		          </div>
		          </form>
		          
		          <form name='hospitalList' style='display:none'>
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
		                  <li style="width: 53%;"><h3>${hvo.addr }</h3></li>
		                  <li style="width: 15%; font-size:1.5em; color:white"><div class="test-score1" data-max="5" data-rate="${hvo.star }"></div>
		                  (${hvo.cnt })
		                  </li>
		                </ul>
		              </div>
		              </c:forEach>
		            </div>
		          </div>
		          </form>
          <!-- ***** Gaming Library End ***** -->

          <!-- ***** Most Popular Start ***** -->
          <div class="most-popular">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>오늘의 BEST</em> 짤</h4>
                </div>
                <div class="row carousel slide" id="carouselExampleSlidesOnly" data-bs-ride="carousel">
                
                  <div class="col-lg-3 col-sm-6">
                    <div class="item">
                      <img src="assets/images/popular-01.jpg" alt="">
                      <h4>Fortnite<br><span>Sandbox</span></h4>
                      <ul>
                        <li><i class="fa fa-star"></i> 4.8</li>
                        <li><i class="fa fa-download"></i> 2.3M</li>
                      </ul>
                    </div>
                  </div>
                  
                  <div class="col-lg-3 col-sm-6">
                    <div class="item">
                      <img src="assets/images/popular-02.jpg" alt="">
                      <h4>PubG<br><span>Battle S</span></h4>
                      <ul>
                        <li><i class="fa fa-star"></i> 4.8</li>
                        <li><i class="fa fa-download"></i> 2.3M</li>
                      </ul>
                    </div>
                  </div>
                  
                  <div class="col-lg-3 col-sm-6">
                    <div class="item">
                      <img src="assets/images/popular-03.jpg" alt="">
                      <h4>Dota2<br><span>Steam-X</span></h4>
                      <ul>
                        <li><i class="fa fa-star"></i> 4.8</li>
                        <li><i class="fa fa-download"></i> 2.3M</li>
                      </ul>
                    </div>
                  </div>
                  
                  <div class="col-lg-3 col-sm-6">
                    <div class="item">
                      <img src="assets/images/popular-04.jpg" alt="">
                      <h4>CS-GO<br><span>Legendary</span></h4>
                      <ul>
                        <li><i class="fa fa-star"></i> 4.8</li>
                        <li><i class="fa fa-download"></i> 2.3M</li>
                      </ul>
                    </div>
                  </div>


                  <div class="col-lg-12">
                    <div class="main-button">
                      <a href="browse.html">Discover Popular</a>
                    </div>
                  </div>
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
