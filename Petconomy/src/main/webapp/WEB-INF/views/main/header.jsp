<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/1028c0334c.js" crossorigin="anonymous"></script>
</head>
<body>
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
					<a href="/peco/main/mainpage" class="logo" style="border:0px; margin-bottom:20px"> <img src="/resources/img/petconomy.png" alt="" style="border:0px">
					</a>
                    <!-- ***** Logo End ***** -->

                    <!-- ***** Menu Start ***** -->
                    
                    <ul class="nav">
                        <li><a href="/peco/main/pension" style="font-size:1.2em">펜션 <i class="fa-solid fa-hotel"></i>/병원 <i class="fa-solid fa-stethoscope"></i></a></li>
                        <li><a href="/peco/board/main" style="font-size:1.2em">커뮤니티 <i class="fa-regular fa-comments"></i></a></li>
                        <li><a href="/peco/business" style="font-size:1.2em">업소등록 <i class="fa-regular fa-address-card"></i></a></li>
                        
                        <!-- 마이페이지 네비게이션, 탭 -->
                		<c:if test="${not empty sessionScope.member}">
                         <li class="nav-item dropdown">
						    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="font-size:1.2em">마이페이지 <i class="fa-solid fa-user"></i></a>
						    <ul class="dropdown-menu">
						      <li><a class="dropdown-item" href="/peco/profile?m_id=${member.m_id}">나의 정보</a></li>
						      <li><a class="dropdown-item" href="/peco/pensionProfile?m_id=${member.m_id}">나의 펜션 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/hospitalProfile?m_id=${member.m_id}">나의 병원 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/myBoard?m_id=${member.m_id}">나의 글 목록</a></li>
						      <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
						    </ul>
						  </li>
                        </c:if>
                        <c:choose>
						    <c:when test="${empty sessionScope.member}">
						        <div class="main-button" style="display:inline-block;">
						        <a href="/peco/login" style="margin-top:10px;">로그인 <img src="assets/images/profile-header.jpg" alt=""></a>
              					</div>
						    </c:when>
						    <c:otherwise>
						    <div class="main-button" style="display:inline-block">
						        <a href="/peco/logout">로그아웃</a>
						    </div>
						    </c:otherwise>
						</c:choose>
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
</body>
</html>