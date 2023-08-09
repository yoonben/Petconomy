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
 
 
 .featured-games .hover-effect ul {
  position: absolute;
  bottom: 20px;
  text-align: center;
  width: 100%;
}

.featured-games .hover-effect ul li {
  display: inline-block;
  margin: 0px 5px;
}

.featured-games .hover-effect ul li a {
  background-color: rgba(236, 96, 144, 0.9);
  padding: 5px 10px;
  border-radius: 23px;
  color: #fff;
  font-size: 14px;
}

.featured-games .item ul li:first-child i {
  color: white;
}

.featured-games span i {
  color: #fff;
  background-color: #ec6090;
  border-radius: 50%;
  font-size: 12px;
  width: 20px;
  height: 20px;
  display: inline-block;
  text-align: center;
  line-height: 20px;
  margin-right: 3px;
}

.featured-games span {
  font-size: 14px;
  color: #ec6090;
}

.featured-games .down-content h4 {
  margin-top: 8px;
  font-size: 20px;
  font-weight: 700;
  margin-left: 61px;
}

.featured-games .avatar img {
  margin-right: 15px;
}

.main-banner {
  background-image: url(https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1xw:0.74975xh;center,top&resize=1200:*);
  background-position: center center;
  background-size: cover;
  min-height: 380px;
  border-radius: 23px;
  padding: 80px 60px;
  margin-bottom: 50px; 
}

.main-button a {
  font-size: 26px; /* 원하는 글씨 크기로 조정 */}  
}

</style>


<script type="text/javascript">

	//검색 페이징 Action
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.action = "/peco/board/healing";
		document.searchForm.submit();
	}
	
	
	//상세보기 Action
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
        
        <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <c:if test="${not empty sessionScope.member.nickname}">
                  <h6>Welcome To ${sessionScope.member.nickname}</h6>
                  </c:if>
                  <h4><em>힐링</em> 게시판</h4>
                  <c:if test="${not empty sessionScope.member.nickname}">
                  <div class="main-button">
                    <a href="/peco/board/write?pageNo=${pageDto.cri.pageNo }&category=healing">글 쓰기</a>
                  </div>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Banner End ***** -->
        
        <!-- ***** Featured Games Start ***** -->
          <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
                <div class="heading-section">
                  <h4>힐링<em style="color: #0079FF"> 인기게시글</em></h4>
                </div>
                <div class="owl-features owl-carousel">
                
                
            <!------------------- 베스트 게시글 시작-------------------->
            <c:forEach var="b" items="${Best}">
				  <div class="item">
				    <div class="thumb bestthumb">
            		<a onclick="requestAction('/peco/board/view', ${b.bno })">
				      <img src="/peco/display?fileName=${b.savePath}" alt="" class="thumbnail-image">
				    </a>
				      <div class="hover-effect">
				      <div class="content">
				       <ul>
				        <li><a href="#"><i class="fa fa-eye"></i>${b.visitcount} </a></li>
				        <li><i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg" style="color: #ffa200;">${b.likecount }</i></li>
				       </ul>
				      </div>
				      </div>
				    </div>
					    <div class="down-content">
		                    <div class="avatar">
		                      <img src="/resources/images/default.png" alt="" style="max-width: 46px; border-radius: 50%; float: left;">
		                    </div>
		                    <span><i class="fa fa-check"></i> ${b.writer}</span>
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
        
        
	        <div class="live-stream">
	        
				<%@include file = "../common/searchForm.jsp" %>
				<c:forEach var="board" items="${list}">
						  <div class="list-group w-auto">
						    <a onclick="requestAction('/peco/board/view', ${board.bno })" href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
						      <div class="d-flex gap-2 w-100 justify-content-between">
						        <div>
						          <p class="mb-0 opacity-75">작성자 : ${board.writer }</p>
						          <h6 class="mb-0">${board.title }</h6>
						        </div>
						        <small class="opacity-50 text-nowrap">등록일 : ${board.regdate }</small>
						      </div>
						    </a>
						  </div>
				</c:forEach>
				<!-- 페이지 불러오기 -->
				<%@include file = "../common/pageNavi.jsp" %>
			
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>
  
  <!-- cdn방식의 css불러오기 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


  </body>

</html>
