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
.header-area .main-nav {
	height: 80px;

}
.header-area .container {
    height: 80px;
}

.header-area .row {
    height: 80px;
}
.header-area .col-12 {
    height: 80px;
}
body{
   margin: 0 auto; /* 바디 마진을 0으로 하고 가로 가운데 정렬 */
  background-color: white;
}

div >.page-content{
      background-color: rgb(251, 235, 215);
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

/* 배너 */
.main-banner {
  background-image: url(https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1xw:0.74975xh;center,top&resize=1200:*);
  background-position: center center;
  background-size: cover;
  min-height: 380px;
  border-radius: 23px;
  padding: 80px 60px;
  margin-bottom: 50px; 
  margin-top: 8px;
}
.header-text > .main-button a {
  font-size: 26px; /* 원하는 글씨 크기로 조정 */
}


/* 게시판 카테고리 버튼 */
.board-menu {
    display: flex;
    align-items: center;
    height: 45px;
    margin-bottom:0;
}
.main-button{
    height: 100%;
    margin: 0;
    display: inline-block; 
}
.main-button > a{
    margin: 0;
    
}







/*-------------게시글 리스트------------ */
.post_box{
	margin: 0;
}
.post{
	padding-right: 27px;
	display: flex;
	justify-content: space-between;
	grid-gap: 10px;
	gap: 10px;
	margin: 0 ;
	height: 120px;
}

.post_main{
	margin: 0 ;
}

.post_title {
	font-style: normal;
	font-weight: 700;
	margin-top: 18px;
	font-size: 16px;
	line-height: 19px;
}
.post_text {
    font-style: normal;
    font-weight: 700;
    margin-top: 7px;
    margin-bottom: 6px;
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    font-weight: 400;
    color: #868688;
    font-size: 13px;
    line-height: 160%;
}
.post_img {
    position: relative;
    min-width: 120px;
    max-width: 120px;
    height: 120px;
    border-radius: 15px;
    overflow: hidden;
    -webkit-box-shadow: 0 2px 4px rgba(0,0,0,.15);
    box-shadow: 0 2px 4px rgba(0,0,0,.15);
}
.post_img > img {
  position: absolute;
    inset: 0px;
    box-sizing: border-box;
    padding: 0px;
    border: none;
    margin: auto;
    display: block;
    width: 0px;
    height: 0px;
    min-width: 100%;
    max-width: 100%;
    min-height: 100%;
    max-height: 100%;
    object-fit: cover;
    object-position: center center;
    filter: none;
    background-size: cover;
    background-image: none;
    background-position: center center;
}
.postreplywriter{
  display: flex;
    align-items: center;
    margin: 10px 0;
    grid-gap: 40px;
    gap: 40px;
    font-size: 13px;
    color: #868688;
    height: 30px;

}

.postreplywriter div {
  margin: 0;
}

.postendline {
    margin: 12px 0 12px;
    background-color: #e4e4e6;
    height: 1px;
    border: 0;
}
.post_reply {
	color: black;
}

.post_writer {
    color: black;
}
</style>


<script type="text/javascript">

	//검색 페이징 Action
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.action = "/peco/board/free";
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
	<%@include file="../main/header.jsp"%>
  <!-- ***** Header Area End ***** -->

<div class="container">				
    <div class="row">		  
      <div class="col-lg-12">
        <div class="page-content">
        
        
        <!-- ***** 게시판 메뉴 버튼 시작 ***** -->
	    <div class="board-menu" style="text-align: left;">
             <div class="main-button">
                 <a href="/peco/board/free">일상 게시판</a>
             </div>
             <div class="main-button">
                 <a href="/peco/board/healing">힐링 게시판</a>
             </div>
	    </div>
	    <!-- ***** 게시판 메뉴 버튼 끝 ***** -->
        
        
        
        
        
        <!-- ***** Banner Start ***** -->
          <div class="main-banner">
            <div class="row">
              <div class="col-lg-7">
                <div class="header-text">
                  <c:if test="${not empty sessionScope.member.nickname}">
                  <h6>Welcome To ${sessionScope.member.nickname}</h6>
                  </c:if>
                  <h4><em>일상</em> 게시판</h4>
                  <c:if test="${not empty sessionScope.member.nickname}">
                  <div class="main-button">
                    <a href="/peco/board/write?pageNo=${pageDto.cri.pageNo }&category=free">글 쓰기</a>
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
                  <h4>일상<em style="color: #0079FF"> 인기게시글</em></h4>
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
				        <li><a><i class="fa fa-eye"></i>${b.visitcount} </a></li>
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
			
			<%@include file = "../common/searchForm.jsp" %>
			<div class="live-stream post_list">
                <c:forEach var="board" items="${list}">
                  <div class="post_box">
                  <a onclick="requestAction('/peco/board/view', ${board.bno })">
                     <div class="post">
                        <div class="post_main">
                          <div class="post_title">${board.title }</div>
                          <div class="post_text">${board.content }</div>
                        </div>
                        <div class="post_img">
                          <img src="/peco/display?fileName=${board.savePath}" alt="">
                        </div>
                     </div>
                  </a>

                     <div class="postreplywriter">
                        <div class="post_reply">댓글: ${board.replycount }</div>
                        <div class="post_writer">${board.writer }</div>
                        <div class="post_date">${board.regdate }</div>
                     </div>

                     <div class="postendline">
                      <hr>
                     </div>
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
