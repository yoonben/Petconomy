<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4793f7e09cabda709895d2261a8c2af&libraries=services"></script>

    <title>Cyborg - Awesome HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

	<!-- 별점 cdn -->
	<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
	
	<script>
	  var jq = jQuery.noConflict();
	</script>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<style>
.other-games {
    background-color: white;
}
body{
	height : 1800px;
}
</style>
<script>
	
	function regionSelect(){
		document.querySelector(".modal-body").innerHTML = ''
		+ '<select class="main-button" id="megaregion" name="megaregion" aria-label=".form-select-lg example">'
		+ '<option selected>시</option>'
		+ '<option value="gangwon">강원</option>'
		+ '<option value="gyeonggi">경기</option>'
		+ '<option value="gyeongsang">경상</option>'
		+ '<option value="busan">부산</option>'
		+ '<option value="incheon">인천</option>'
		+ '<option value="jeolla">전라</option>'
		+ '<option value="chungcheong">충청</option>'
		+ '<option value="jeju">제주</option>'
		+ '</select>';
		document.querySelector("$btnModalSave").style.display = 'none';
		
	const myModal = new bootstrap.Modal('#myModal', {
		  keyboard: false
		});

	myModal.show();
	}

	function go(page){
		document.selectForm.pageNo.value=page;
		document.selectForm.action = "/peco/main/pension";
		document.selectForm.submit();
	}


</script>
<script>
jQuery(function ($) {
	jq(".test-score1").score();
})
</script>
</head>
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
  
  <!-- 헤더영역 시작-->
	<%@include file="header.jsp" %>
  <!-- 헤더영역  끝-->
	
  <!-- ***** Header Area End ***** -->
 <div id="myModal" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" class="btnModalSave">저장</button>
      </div>
    </div>
  </div>
</div>


  <div class="container" style="height:2600px;">
    <div class="row" style="height:2600px;">
      <div class="col-lg-12" style="height:2600px;">
        <div class="page-content" style="height:2600px;">

          <!-- ***** Featured Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="feature-banner header-text">
                <div class="row">
                  <div class="col-lg-4">
                  </div>
                  <div class="col-lg-8">
                    <div class="thumb">
                      <a href="https://www.youtube.com/watch?v=r1b03uKWk_M" target="_blank"><i class="fa fa-play"></i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Featured End ***** -->

          <!-- ***** Details Start ***** -->
          <div class="game-details">
          <br>
            <input type="hidden" name="pageNo" id="pageNo" value="${param.pageNo }">  
			<input type="hidden" name="megaregion" value="${param.megaregion }">  
			<input type="hidden" name="smallregion" value="${param.smallregion }">  

              <div class="main-button" style="display:inline-block" >
                  <a href="/peco/main/pension">펜션</a>
              </div>
              <div class="main-button" style="display:inline-block">
                  <a href="/peco/main/hospital">병원</a>
              </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="content" style="background-color: white; margin-bottom: 0px;">
                  <div class="row" style="margin-bottom: 0px;">

                    
                    <div class="col-lg-12">
                      <div><%@include file="kakaomap.jsp"%></div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Details End ***** -->

          <!-- ***** Other Start ***** -->
          <div class="other-games" style="height:1700px">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">

   	           
   	           
         <div><%@include file="searchForm.jsp"%></div>
         <br>

         	총 ${totalCnt } 건
             <div style="height: 200px; display: flex; flex-wrap: wrap;">
            <c:forEach items="${list }" var="list" varStatus="status"> 
            
            <div class="card" style="width:265px; max-width: 25%; display: block; border:solid 0px" >
            
			  <img src="/peco/display?fileName=${list.savePath}" class="card-img-top" alt="..." style="height:300px; padding:10px">
         	   
			  <div class="card-body" style="margin-bottom: 20px">
			    <h5 class="card-title"> <a style="font-size:1.2em; color:black" href="/peco/detail/detailPage?p_id=${list.p_id }&pageNo=${pageDto.regioncri.pageNo }&megaregion=${pageDto.regioncri.megaregion}&smallregion=${pageDto.regioncri.smallregion}">${list.pname}</a></h5>
			    <p class="card-text">${list.addr }</p>
			    <p class="card-text"><div class="test-score1" data-max="5" data-rate="${list.star }"></div>(${list.cnt })</p>
			    <p class="card-text">1박당 요금 시작가 <br> <a style="color:red; font-weight:900;">KRW : ${list.min }</a></p>
			   
			  </div>
			</div>
			</c:forEach>
             </div>
                </div>
              </div>

            </div>

          </div>
					<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
          <!-- ***** Other End ***** -->
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <footer>
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-12">
		          <p style="color:black">Copyright © 2036 <a href="#" style="color:black">Cyborg Gaming</a> Company. All rights reserved. 
		          
		          <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates" style="color:black">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
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

