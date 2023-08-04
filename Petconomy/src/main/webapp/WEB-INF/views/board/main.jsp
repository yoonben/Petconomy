<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>반려동물 커뮤니티 사이트</title>

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


<style>
  body{
   margin: 0 auto; /* 바디 마진을 0으로 하고 가로 가운데 정렬 */
    background-color: rgba(250, 149, 16, 0.979);
  }

  div >.page-content{
    background-color: rgb(255, 187, 0);
  }

  .top-streamers{
  	margin-top: 50px;
  
    overflow: auto;

    background-color: bisque;

  }

  .featured-games{
    background-color: bisque;
  }

  .live-stream{
    background-color: bisque;
  }
  
  .thumbnail-image {
    width: 100%; /* 이미지의 가로 크기를 부모 요소의 100%로 조정 */
    height: 100%; /* 이미지의 세로 크기를 부모 요소의 100%로 조정 */
    object-fit: cover;
    border-radius: 23px;
    margin-bottom: 30px;
}


  .besttitle {
  	margin-left: 10px; /* 탑 마진을 0으로 설정 */
    margin-top: 0; /* 탑 마진을 0으로 설정 */
}
 .bestthumb{
 	width: 292px;
 	height: 292px;
 }


</style>



<script type="text/javascript">

//검색 페이징 Action
function go(page){
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/peco/board/search";
	document.searchForm.submit();
}

	function requestAction(url, bno){
		// 폼이름을 확인!
		searchForm.action = url;
		searchForm.bno.value = bno;
		searchForm.submit();
	}
	
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
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <%@include file = "../common/boardHeader.jsp" %>
  <!-- ***** Header Area End ***** -->

  <div class="container">
  					
    <div class="row">
    				  
      <div class="col-lg-12">
        <div class="page-content">


			<%@include file = "../common/searchForm.jsp" %>
		
		
          <!-- ***** Featured Games Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4><em>베스트</em> 게시글</h4>
                </div>
                <div class="owl-features owl-carousel">
                
                
            <!------------------- 베스트 게시글 시작-------------------->
            <c:forEach var="b" items="${Best}">
				  <div class="item">
				    <div class="thumb bestthumb">
            		<a onclick="requestAction('/peco/board/view', ${b.bno })">
				      <img src="/peco/display?fileName=${b.s_savePath}" alt="" class="thumbnail-image">
				    </a>
				      <div class="hover-effect">
				        <i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg" style="color: #ffa200;"> <h4> ${b.likecount }</h4></i>
				      </div>
				    </div>
					    <div class="down-content">
		                    <div class="avatar">
		                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
		                    </div>
		                    <span><i class="fa fa-check"></i> ${b.nickname}</span>
		                    <a onclick="requestAction('/peco/board/view', ${b.bno })">
		                    <h4 class="besttitle">${b.title } </h4>
		                    </a>
		                </div> 
				  </div>
			</c:forEach>
            <!------------------- 베스트 게시글  끝-------------------->


            
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Featured Games End ***** -->
          
          <!-- ***** Live Stream Start ***** -->
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>일상</em> 게시판</h4>
              </div>
            </div>

			
            <div class="row">
            
            <!-- -------일상 게시글 시작---------- -->
            <c:forEach var="f" items="${Free}">
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
            		<a onclick="requestAction('/peco/board/view', ${f.bno })">
                    <img src="/resources/assets/images/stream-05.jpg" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i>${f.visitcount} </a></li>
                          <li><i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg" style="color: #ffa200;">${f.likecount }</i>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> ${f.nickname}</span>
                    <h4>${f.title} </h4>
              		</a>
                  </div> 
                </div>
              </div>
          	</c:forEach>
          	<!-- -------게시글 끝---------- -->
          	
            </div>
          </div>
          <!-- ***** Live Stream End ***** -->
          
          <!-- ***** Live Stream Start ***** -->
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>힐링짤</em> 게시판</h4>
              </div>
            </div>
            <div class="row">
            
            <c:forEach var="h" items="${Healing}">
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                  	<a onclick="requestAction('/peco/board/view', ${h.bno })">
                    <img src="/resources/assets/images/stream-05.jpg" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i>${h.visitcount}</a></li>
                          <li><a href="#"><i class="fa fa-gamepad"></i> CS-GO</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> ${h.nickname}</span>
                    <h4>${h.title}</h4>
                    </a>
                  </div> 
                </div>
              </div>
            </c:forEach>

            </div>
          </div>
          <!-- ***** Live Stream End ***** -->
          
          

        </div>
      </div>
    </div>
  </div>
  
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <p>Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved. 
          
          <br>Design: <a href="https://templatemo.com" target="_blank" title="Free CSS templates">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
        </div>
      </div>
    </div>
  </footer>


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
