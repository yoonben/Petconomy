<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
					<a href="/peco/main/mainpage" class="logo"> <img src="/resources/img/petconomy.png" alt="">
					</a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input" >
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" style="background-color: #FFF1E0" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="/peco/main/pension">펜션/병원</a></li>
                        <li><a href="/peco/board/main">커뮤니티</a></li>
                        <li><a href="/peco/business">업소등록</a></li>
                        
                        <!-- 마이페이지 네비게이션, 탭 -->
                         <li class="nav-item dropdown">
						    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">마이페이지</a>
						    <ul class="dropdown-menu">
						      <li><a class="dropdown-item" href="/peco/profile?m_id=${member.m_id}">나의 정보</a></li>
						      <li><a class="dropdown-item" href="/peco/success?m_id=${member.m_id}">나의 예약내역</a></li>
						      <li><a class="dropdown-item" href="/peco/pensionProfile?m_id=${member.m_id}">나의 펜션 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/hospitalProfile?m_id=${member.m_id}">나의 병원 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/myBoard?m_id=${member.m_id}">나의 글 목록</a></li>
						      <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
						    </ul>
						  </li>
                        
                        <c:choose>
						    <c:when test="${empty sessionScope.member}">
						        <li><a href="/peco/login">로그인 <img src="assets/images/profile-header.jpg" alt=""></a></li>
						    </c:when>
						    <c:otherwise>
						        <li><a href="/peco/logout">로그아웃</a></li>
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