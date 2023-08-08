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

</style>


<script type="text/javascript">

	//검색 페이징 Action
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.action = "/peco/board/search";
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
        
        
        
        
	        <div class="live-stream">
	            <div class="col-lg-12">
	              <div class="heading-section">
	                <h4><em>통합</em> 검색</h4>
	              </div>
	            </div>
	            
	            
		        <div class="row">
					<div >
				    	<h1>조회결과</h1>
					  <c:if test="${not empty sessionScope.member.nickname}">
					    <p class="lead"><b>${sessionScope.member.nickname}</b>님 환영합니다👋👋 </p>
					    <a class="btn btn-lg btn-primary" href="/peco/board/write?pageNo=${pageDto.cri.pageNo }" role="button">글쓰기 &raquo;</a>
					  </c:if>
				  	</div>
				</div>
	
				<%@include file = "../common/searchForm.jsp" %>
				<c:forEach var="board" items="${list}">
						  <div class="list-group w-auto">
						    <a onclick="requestAction('/peco/board/view', ${board.bno })" href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
						      <div class="d-flex gap-2 w-100 justify-content-between">
						        <div>
						          <p class="mb-0 opacity-75">작성자 : ${board.nickname }</p>
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
