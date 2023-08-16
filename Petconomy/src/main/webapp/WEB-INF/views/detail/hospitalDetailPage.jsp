<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

  <title>Cyborg - Awesome HTML5 Template</title>
  
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2dbde4358c655a0a343470e6d907b4a5&libraries=services"></script>

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>
  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
  <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
  <link rel="stylesheet" href="/resources/assets/css/owl.css">
  <link rel="stylesheet" href="/resources/assets/css/animate.css">
  <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
  <!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
  <style>
    body {
      background-color: rgb(255, 255, 255);
    }

    div>.page-content {
      background-color: rgb(247, 218, 218);
    }

    /* 탭 전체 스타일 */
    .tabs {
      margin-top: 50px;
      padding-bottom: 40px;
      border-radius: 23px;
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      width: 100%;
      margin: 0 auto;
    }

    /* 탭 스타일 */
    .tab_item {
      width: calc(100%/3);
      height: 50px;
      border-radius: 23px;

      background-color: #f8f8f8;
      line-height: 50px;
      font-size: 16px;
      text-align: center;
      color: #333333;
      display: block;
      float: left;
      text-align: center;
      font-weight: bold;
      transition: all 0.2s ease;
    }

    .tab_item:hover {
      opacity: 0.75;
    }

    /* 라디오 버튼 UI삭제*/
    input[name="tab_item"] {
      display: none;
    }

    /* 탭 컨텐츠 스타일 */
    .tab_content {
      display: none;
      padding: 40px 40px 0;
      clear: both;
      overflow: hidden;
    }


    /* 선택 된 탭 콘텐츠를 표시 */
    #all:checked~#all_content,
    #programming:checked~#programming_content,
    #design:checked~#design_content {
      display: block;
    }

    /* 선택된 탭 스타일 */
    .tabs input:checked+.tab_item {
      border-bottom: 3px solid #ec6090;
      color: #ec6090;
    }
    
    .edit-delete-buttons {
      text-align: right;
      display: inline-block; /* Add this line to keep the buttons inside the parent container */
    }

    .edit-delete-buttons .main-border-button {
      width: 50%;
      margin: 0px;
      float: right;
    }
  </style>

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
  	<script>
	  var jb = jQuery.noConflict();
	</script>

  <script>
  // This function replaces commas with line breaks
  
  
 window.addEventListener('load',function(){		
		
		// 답글등록 버튼
		 btnReplyWrite.addEventListener('click', function(){
			replyWrite();
		});
 
		
		// 댓글목록 조회및 출력
		getReplyList();
 
});

 function kakaoLoad() {

	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	     mapOption = {
	         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	         level: 3 // 지도의 확대 레벨
	     };  

	 // 지도를 생성합니다    
	 var map = new kakao.maps.Map(mapContainer, mapOption); 

	 // 주소-좌표 변환 객체를 생성합니다
	 var geocoder = new kakao.maps.services.Geocoder();

	 // 주소로 좌표를 검색합니다
	 geocoder.addressSearch(`${hospital.addr}`, function(result, status) {
	 	
	 	

	     // 정상적으로 검색이 완료됐으면 
	      if (status === kakao.maps.services.Status.OK) {
	     	 
	         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	         // 결과값으로 받은 위치를 마커로 표시합니다
	         var marker = new kakao.maps.Marker({
	             map: map,
	             position: coords
	         });

	         // 인포윈도우로 장소에 대한 설명을 표시합니다
	         var infowindow = new kakao.maps.InfoWindow({
	             content: '<div style="width:150px;text-align:center;padding:6px 0;">'+`${hospital.pname}`+'</div>'
	         });
	         infowindow.open(map, marker);

	         // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	         map.relayout();
	         map.setCenter(coords);	        
	     } 	
	        
	 });

	  
	}

    /* $.noConflict(); */

    // Now use a different variable for the "score.js" library
    // You can use any variable name you prefer, like "scoreJS" or "scoreLib"
    jQuery(function ($) {
      jb(".starTotal").score({
        display: {
          showNumber: true,
          integerOnly: false, //정수만 설정 가능 여부
          placeLimit: 1, //소수점 자리수 표시 길이
          textColor: "black",
        }
      });
      jb(".starReview").score({
        display: {
          showNumber: true,
          textColor: "black",
        }
      });
      jb(".scoreSleect").score({
        starColor: "gold",
        backgroundColor: "transparent",
        editable: true,
        integerOnly: true,
        zeroAvailable: false,
        send: {
          sendable: true,
          name: "star",
        },
        display: {
          showNumber: true,
          placeLimit: 0,
          textColor: "black",
        }
      });
    });
  </script>
  <!-- <script>
    $(function () {      
      $(".star").score({
        display: {
          showNumber: true,
          textColor: "black",
        }
      });
    });
  </script> -->


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
  <!-- ***** Preloader End ***** -->

	<!-- 헤더 시작 -->
	<%@ include file="../common/header.jsp" %>
	<!-- 헤더 끝 -->
	
  <div class="container">
  <input type="hidden" name="h_id" id="h_id" value="${hospital.h_id }">
  <input type="hidden" id="reviewer" value="${sessionScope.member.nickname }">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

          <!-- ***** Featured Start ***** -->
          <div class="row">
            <div class="col-lg-12">
            </div>
            <div class="col-lg-12">
              <div class="feature-banner header-text">
                <div class="row">
                  <div class="col-lg-4">
                    <img src="/peco/display?fileName=${hospitalImg}" alt="동물병원이미지" style="border-radius: 23px;">
                  </div>
                  <div class="col-lg-8">
                    <div class="item">
                      <h4>${hospital.pname }</h4>
                      <p>${hospital.addr }</p>
                      <br>
                      <p style='font-size: 20px;'>영업시간</</p>
                      <p id="openhourOutput">${hospital.openhour }</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Featured End ***** -->

          <!-- ***** Details Start ***** -->
          <div class="game-details">
            <div class="row">
              <h3><br></h3>
              <div class="tabs">
                <input id="all" type="radio" name="tab_item" checked>
                <label class="tab_item" for="all">병원 정보</label>
                <input id="programming" type="radio" name="tab_item">
                <label class="tab_item" for="programming" onclick="kakaoLoad()">병원 위치</label>
                <input id="design" type="radio" name="tab_item">
                <label class="tab_item" for="design">리뷰</label>
                <div class="tab_content" id="all_content">
                <div class="content" style='background-color: white;'>
                    <div class="row">
                      <div class="col-lg-17">
                        <p>
                        <p style='font-size: 2em; color: black;'>기본정보</p>
                        <hr style="height: 4px; background-color: black;">
                        <p style='font-size: 1em;'>                       
                          <img src="/peco/display?fileName=${hospitalImg}" alt="동물병원이미지" style="border-radius: 23px; width: 60%; height: 350px;">
                          <br>
                          	병원 주소
                          <li style='list-style-type: disc;'>${hospital.addr }</li>
                          <br>
                          	영업 시간
                          <li id="openhourOutput">${hospital.openhour}</li>
                          <br>
                          	홈페이지
                          <li style='list-style-type: disc;'><a href="${hospital.homepage }">병원 홈페이지 바로가기</a></li>
                          <br>
                          	주차가능여부
                          <li style='list-style-type: disc;'>${hospital.parkyn }</li>
                          <br>
                          	전화번호
                          <li style='list-style-type: disc;'>${hospital.phone }</li>
                          <br>

                        </p>
                      </div>
                    </div>
                  </div>
               

                  
                </div>
                <div class="tab_content" id="programming_content">
                  <div class="content" style='background-color: white;'>
                    <div class="row">
                      <div class="col-lg-17">                        
                        <p style='font-size: 2em; color: black;'>위치정보</p>
                        <hr style="height: 4px; background-color: black;">
                        <div id="map" style="width:100%;height:350px;"></div>                        
                        <%-- <%@ include file="../common/kakaoMap.jsp" %> --%>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab_content" id="design_content">
                  <div class="content" style='background-color: white;'>
                    <div class="row">
                      <div class="col-lg-17" style='text-align: center;'>
                        <!-- 상단 별점 시작 -->
                        <div style='font-size: 3em;'>총 별점</div>
                        <div class="starTotal" data-max="5" data-rate="${staravg }" style='font-size: 2em;'></div>
                        <!-- 상단 별점 끝 -->
                        <hr style="height: 4px; background-color: black;">
                        
                        <!-- 리뷰 리스트 시작 -->
                        <div id="replyDiv"></div>
                        <!-- 리뷰 리스트 끝 -->
                                                
                        <!-- 페이징 시작 -->
                        <div id="paginationDiv"></div>                        
                        <br>
                        <!-- 페이징 끝 -->
                        
                        <!-- 리뷰 보내기 시작 -->
                        <div id="reviewDiv">
                        <div class="col-lg-17" id="reviewPossible">
                          <div class="left-info" style='background-color: rgb(247, 218, 218);'>
                            <div class="left">
                              <h4 style='text-align: left; color: black;'><b><input type="hidden" id="reviewer" value="${sessionScope.member.nickname }" readonly></b></h4>
                              <br>
                            </div>
                            <div class="col-lg-13"> <textarea name="review" id="review" rows="5" style='width: 100%; border-radius: 15px;'></textarea>
                            </div>
                            <ul>
                              <li><b style='color: black;'>별점 선택</b>
                                <div class="scoreSleect" id="starinsert" data-max="5" data-rate="4" style='font-size: 1.4em;'></div>                                
                              </li>
                              <li>
                                <div class="main-border-button">
                                  <a href="#" id="btnReplyWrite">리뷰 작성</a>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                        </div>
                        <!-- 리뷰 보내기 끝 -->  
                        
                        <!-- 리뷰 중복 시작 -->                                               
                        <!-- 리뷰 중복 끝 -->    
                  
                        

                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- ***** Details End ***** -->
            </div>
          </div>
          
          
        </div>
      </div>

      <!-- 풋터 시작 -->
		<%@ include file="../common/footer.jsp" %>
	  <!-- 풋터 끝 -->		

		
		<!-- 카카오 지도 api 시작 -->
     
      <!-- 카카오 지도 api 끝 -->

		<script src="/resources/js/HospitalReview.js"></script>
      <!-- Scripts -->
      <!-- Bootstrap core JavaScript -->
      <script src="/resources/vendor/jquery/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>
	
      <script src="/resources/assets/js/isotope.min.js"></script>
      <script src="/resources/assets/js/owl-carousel.js"></script>
      <script src="/resources/assets/js/tabs.js"></script>
      <script src="/resources/assets/js/popup.js"></script>
      <script src="/resources/assets/js/custom.js"></script>


</body>

</html>