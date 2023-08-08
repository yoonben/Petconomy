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
    background-color: #ffec90;
  }

      
  div >.page-content{
    background-color: white;
    padding: 30px;
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
  
  .most-popular{
    background-color: bisque;
  }
  
  
  .bestbox{
  	width: 25%; 
    height: 333px;
  }
  .item{
  	width: 90%; 
    height: 90%;
  }  
 .bestbox .thumbnail-image {
    width: 100%; 
    height: 180px; 
  }
  .item h4 {
  color : white;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.item ul {
  margin-right: 5px;
}


.boardbox{
	width:25%;

}

.boardbox .item{
	width:90%;
	heigth:90%;

}

.boardbox .thumbnail-image{
	width:100%;
	height:200px;
	object-fit: cover;

}
  

</style>



<script type="text/javascript">

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
		
		<!-- ***** Most Popular Start ***** -->
          <div class="most-popular">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                  <h4><em>펫코</em> 인기 게시글</h4>
                </div>
                
                <div class="row">
                <c:forEach var="b" items="${Best}" varStatus="loop">
                <c:if test="${loop.index < 8}">
                  <div class="col-lg-3 col-sm-6 bestbox">
                    <div class="item">
	                    <a onclick="requestAction('/peco/board/view', ${b.bno })">
	                    <img src="/peco/display?fileName=${b.savePath}" alt="" class="thumbnail-image">
	                    </a>
	                    <br>
	                      <h4>${fn:substring(b.title, 0, 10)}${fn:length(b.title) > 10 ? '...' : ''}
	                      <span>${b.writer}</span></h4>
	                      <ul>
	                        <li><i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg"></i> ${b.likecount}</li>
	                        <li><i class="fa fa-eye"></i> ${b.visitcount}</li>
	                      </ul>
                    </div>
                  </div>
                </c:if>
                </c:forEach>
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
          
          
          <!-- ***** Live Stream Start ***** -->
          <div class="live-stream">
            <div class="col-lg-12">
              <div class="heading-section">
                <h4><em>일상</em> 게시판</h4>
              </div>
            </div>

			
            <div class="row">
            
            <!-- -------일상 게시글 시작---------- -->
            <c:forEach var="f" items="${Free}" varStatus="loop">
            <c:if test="${loop.index < 8}">
              <div class="col-lg-3 col-sm-6 boardbox">
                <div class="item">
                  <div class="thumb">
            		<a onclick="requestAction('/peco/board/view', ${f.bno })">
                    <img src="/peco/display?fileName=${f.savePath}" alt="" class="thumbnail-image">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><i class="fa fa-eye"></i>${f.visitcount} </a></li>
                          <li><i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg"></i>${f.likecount }</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> ${f.writer}</span>
                    <h4>${f.title} </h4>
              		</a>
                  </div> 
                </div>
              </div>
              </c:if>
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
            
            <c:forEach var="h" items="${Healing}" varStatus="loop">
            <c:if test="${loop.index < 8}">
              <div class="col-lg-3 col-sm-6">
                <div class="item">
                  <div class="thumb">
                  <a onclick="requestAction('/peco/board/view', ${h.bno })">
                    <img src="/peco/display?fileName=${h.savePath}" alt="">
                    <div class="hover-effect">
                      <div class="content">
                        <div class="live">
                          <a href="#">Live</a>
                        </div>
                        <ul>
                          <li><a href="#"><i class="fa fa-eye"></i>${h.visitcount}</a></li>
                          <li><i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg" style="color: #ffa200;">${h.likecount }</i>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="down-content">
                    <div class="avatar">
                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
                    </div>
                    <span><i class="fa fa-check"></i> ${h.writer}</span>
                    <h4>${h.title}</h4>
                  </a>
                  </div> 
                </div>
              </div>
            </c:if>
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
