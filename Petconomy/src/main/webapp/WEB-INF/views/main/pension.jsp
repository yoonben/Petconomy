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


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

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


  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="page-content">

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
            <input type="text" name="pageNo" id="pageNo" value="${param.pageNo }">  
			<input type="text" name="megaregion" value="${param.megaregion }">  
			<input type="text" name="smallregion" value="${param.smallregion }">  
              <div class="main-button" style="display:inline-block">
                <a href="../main/pension" style="color:black; font-size:1.5em; background-color: #ffec90; font-weight: 900;">펜션</a>
              </div>
              
              <div class="main-button" style="display:inline-block">
                <a  href="../main/hospital" style="color:black; font-size:1.5em; background-color: #ffec90; font-weight: 900;">병원</a>
              </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="content">
                  <div class="row">

                    
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
          <div class="other-games">
            <div class="row">
              <div class="col-lg-12">
                <div class="heading-section">
                ${pageDto }
                  <h4 style="color:white"><em style="color:#ffec90">펜션</em> 리스트</h4>
         <!--  <div class="main-button">
           <a href="#" onclick="regionSelect()">지역</a>
         </div> -->
   	           
   	           
         <div><%@include file="searchForm.jsp"%></div>
         <br>
         <h5>총 ${totalCnt } 건</h5>
             <table style="color:white;">

				<colgroup>
					<col width="7%"/>
					<col width="27%"/>
					<col width="37%"/>
					<col width="24%"/>
					<col width="6%"/>
				</colgroup>

				<thead>
				<tr height="50" style="font-size:1.4em;">
				<th >번호</th>
				<th>펜션명</th>
				<th>펜션주소</th>
				<th>운영시간</th>
				<th>주차</th>
				</tr>
				</thead>
				  	<c:if test="${empty list }" var="res">
						<td colspan="5" class="center" style="text-align:center; font-size:1.5em">
							등록된 게시물이 없습니다.
						</td>
					</c:if>
				
				<tbody>
					<c:if test="${not res }">				   
					<c:forEach items="${list }" var="list" varStatus="status">

						<tr height="50" style="font-size:1em;">
						<td >${status.count}</td>
						<td><a href="/peco/detail/detailPage?h_id=${list.p_id }&pageNo=${pageDto.regioncri.pageNo }&megaregion=${pageDto.regioncri.megaregion}&smallregion=${pageDto.regioncri.smallregion}">${list.pname }</a></td>
						<td>${list.addr }</td>
						<td>${list.openhour }</td>
						<td>${list.parkyn }</td>
						
						</tr>
				    </c:forEach>
				    </c:if>
				<tr style="text-align: center">
					<td colspan="6"><%@include file = "pageNavi.jsp" %></td>
				</tr>
				</tbody>
				</table>


                </div>
              </div>

            </div>

          </div>
          <!-- ***** Other End ***** -->
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

