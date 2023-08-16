<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- 별점 cdn -->
<script
	src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/1028c0334c.js"
	crossorigin="anonymous"></script>
<script>
	  var jq = jQuery.noConflict();
	</script>
<title>펫코노미 홈페이지</title>

<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
<link rel="stylesheet"
	href="/resources/assets/css/templatemo-cyborg-gaming.css">
<link rel="stylesheet" href="/resources/assets/css/owl.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!--

TemplateMo 579 Cyborg Gaming

https://templatemo.com/tm-579-cyborg-gaming

-->
</head>
<style>
.main-Banner {
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

.gaming-library {
	margin: 10px;
	background-color: white;
}

.gaming-library {
	margin-top: 20px;
}

.main-button a {
	margin-top: 20px;
}

.most-popular {
	background-color: white;
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
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- 헤더영역 시작-->
	<%@include file="header.jsp"%>
	<!-- 헤더영역  끝-->

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-content">

					<!-- ***** Banner Start ***** -->
					<div class="main-Banner">
						<div class="row">
							<div class="col-lg-7" style="width: 100%">
								<div class="header-text">



									<div id="carouselExampleInterval" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-inner" style="border-radius: 23px">
											<!-- http://img.einet.kr/P201809005/home/slider/22.jpg -->
											<div class="carousel-item active" data-bs-interval="2000"
												style="background-image: url(http://img.einet.kr/P201809005/home/slider/22.jpg); height: 500px; background-size: cover; border-radius: 23px">
												<h1
													style="color: white; padding-left: 40px; padding-top: 50px; font-size: 5em;">
													<em style="color: #FFC48C">WELCOME TO </em> PETCONOMY
												</h1>
												<h4
													style="color: white; padding-left: 60px; font-size: 2.5em;">사랑하는
													이들, 애완동물과 행복한 추억을 담아가세요</h4>
												<div class="main-button"
													style="margin-left: 1000px; margin-top: 100px; height: 200px">
													<a href="../main/pension"
														style="font-size: 1.5em; background-color: #FFC48C; font-weight: 900; color: black">펜션
														예약 바로가기</a>
												</div>
											</div>
											<div class="carousel-item" data-bs-interval="2000"
												style="background-image: url(http://www.conslove.co.kr/news/photo/202211/76099_214784_1832.jpg); height: 500px; background-size: cover; border-radius: 23px">
												<h1
													style="color: white; padding-left: 40px; padding-top: 50px; font-size: 5em;">
													<em style="color: #FFC48C">WELCOME TO </em> PETCONOMY
												</h1>
												<h4
													style="color: white; padding-left: 60px; font-size: 2.5em;">제일
													가까운 동물병원이 어디야?</h4>
												<div class="main-button"
													style="margin-left: 1000px; margin-top: 100px; height: 200px">
													<a href="../main/hospital"
														style="font-size: 1.5em; background-color: #FFC48C; font-weight: 900; color: black">병원
														예약하기</a>
												</div>
											</div>
											<div class="carousel-item" data-bs-interval="2000"
												style="background-image: url(/resources/img/puppy.jpg); height: 500px; background-size: cover; border-radius: 23px">
												<h1
													style="color: white; padding-left: 40px; padding-top: 50px; font-size: 5em;">
													<em style="color: #FFC48C">WELCOME TO </em> PETCONOMY
												</h1>
												<h4
													style="color: white; padding-left: 60px; font-size: 2.5em;">어서오시개,
													반려생활은 처음이지?</h4>
												<div class="main-button"
													style="margin-left: 1000px; margin-top: 100px; height: 200px">
													<a href="../board/main"
														style="font-size: 1.5em; background-color: #FFC48C; font-weight: 900; color: black">커뮤니티
														둘러보기</a>
												</div>
											</div>

										</div>

									</div>



								</div>
							</div>
						</div>
					</div>
					<!-- ***** Banner End ***** -->


					<div class="main-button" style="display: inline-block">
						<a id="btn1">펜션</a>
					</div>
					<div class="main-button" style="display: inline-block">
						<a id="btn2">병원</a>
					</div>


					<!-- ***** 펜션 리스트 시작  ***** -->
					<form name="pensionList">
						<div class="gaming-library">
							<div class="col-lg-12">
								<div class="heading-section">
									<h4 style="color: #fa8e29;">
										<em style="color: black">Top10</em> 펜션 <i
											class="fa-solid fa-hotel"></i>
									</h4>

								</div>
								<c:forEach items="${plist }" var="pvo">
									<div class="item" style="color: black">
										<ul>
											<li style="width: 3%;"><h3 style="color: black;">${pvo.rn }</h3></li>
											<li style="width: 27%;"><h3 style="color: black;">
													<a style="color: black"
														href="/peco/detail/detailPage?p_id=${pvo.p_id }&pageNo=${pageDto.regioncri.pageNo }&megaregion=${pageDto.regioncri.megaregion}&smallregion=${pageDto.regioncri.smallregion}&filename=${pvo.savePath}&pname=${pvo.pname}">${pvo.pname }</a>
												</h3></li>
											<li style="width: 50%;"><h3
													style="color: black; font-size: 1.5em; font-bold: 100">${pvo.addr }</h3></li>
											<li style="width: 15%; font-size: 1.5em; color: black;"><div
													class="test-score1" data-max="5" data-rate="${pvo.star }"></div>
												(${pvo.cnt })</li>
										</ul>
									</div>
								</c:forEach>

							</div>
						</div>
					</form>
					<!-- 펜션 리스트 끝 -->

					<!--  병원 리스트 시작 -->
					<form name="hospitalList" style='display: none'>
						<div class="gaming-library">
							<div class="col-lg-12">
								<div class="heading-section">
									<h4 style="color: #fa8e29;">
										<em style="color: black">Top10</em> 병원 <i
											class="fa-solid fa-stethoscope"></i>
									</h4>
								</div>
								<c:forEach items="${hlist }" var="hvo">
									<div class="item">
										<ul>
											<li style="width: 3%;"><h3 style="color: black;">${hvo.rn }</h3></li>
											<li style="width: 32%;"><h3 style="color: black">
													<a href="/peco/detail/hospitalDetailPage?h_id=${hvo.h_id }&pageNo=${pageDto.regioncri.pageNo }&megaregion=${pageDto.regioncri.megaregion}&smallregion=${pageDto.regioncri.smallregion}&pname=${hvo.pname}&filename=${hvo.savePath}">${hvo.pname }</a>
												</h3></li>
											<li style="width: 45%;"><h3
													style="color: black; font-size: 1.5em; font-bold: 100">${hvo.addr }</h3></li>
											<li style="width: 15%; font-size: 1.5em; color: black;"><div
													class="test-score1" data-max="5" data-rate="${hvo.star }"></div>
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
									<h4 style="color: #fa8e29">
										인기 <em style="color: black">BEST</em> 펫 짤 <i
											class="fa-solid fa-dog"></i><i class="fa-solid fa-cat"></i>
									</h4>
								</div>
								<div class="owl-features owl-carousel">
									<c:forEach items="${blist}" var="bvo">
										<div class="item">
											<div class="thumb bestthumb">

												<a onclick="requestAction('/peco/board/view', ${bvo.bno })">
													<img src="/peco/display?fileName=${bvo.s_savePath}" alt=""
													class="thumbnail-image">
												</a>

												<div class="hover-effect">
													<i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg"
														style="color: #ffa200;"></i>
													<h4>${bvo.likecount }</h4>
												</div>

											</div>
											<div class="down-content">
												<div class="avatar">
													<img src="/resources/images/default.png" alt=""
														style="max-width: 46px; border-radius: 50%; float: left;">
												</div>
												<span style="color: white;"><i class="fa fa-check"></i>
													${bvo.nickname}
													<h4 class="besttitle">${bvo.title }</h4></span> <a
													onclick="requestAction('/peco/board/view', ${bvo.bno })">
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- ***** Most Popular End ***** -->
					<div class="owl-features owl-carousel">
						<c:forEach var="b" items="${blist}">
							<div class="item">
								<div class="thumb bestthumb">
									<a onclick="requestAction('/peco/board/view', ${b.bno })">
										<img src="/peco/display?fileName=${b.savePath}" alt=""
										class="thumbnail-image">
									</a>
									<div class="hover-effect">
										<div class="content">
											<ul>
												<li><a><i class="fa fa-eye"></i>${b.visitcount} </a></li>
												<li><i id="animated-icon"
													class="fa-regular fa-thumbs-up fa-lg"
													style="color: #ffa200;">${b.likecount }</i></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="down-content">
									<div class="avatar">
										<img src="/resources/images/default.png" alt=""
											style="max-width: 46px; border-radius: 50%; float: left;">
									</div>
									<span><i class="fa fa-check"></i> ${b.writer}</span> <a
										onclick="requestAction('/peco/board/view', ${b.bno })">
										<h4 class="besttitle">${b.title }</h4>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>
						Copyright © 2036 <a href="#">Petconomy</a> Company. All rights
						reserved. <br>Design: <a href="https://templatemo.com"
							target="_blank" title="free CSS templates">TemplateMo</a>
						Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</p>
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


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>

</html>
