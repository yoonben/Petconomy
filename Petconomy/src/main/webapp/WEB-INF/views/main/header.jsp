<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<a href="../main/mainpage" class="logo"> <img src="/resources/assets/images/logo.png" alt="">
					</a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Search End ***** -->
                    <div class="search-input">
                      <form id="search" action="#">
                        <input type="text" placeholder="Type Something" id='searchText' name="searchKeyword" onkeypress="handle" />
                        <i class="fa fa-search"></i>
                      </form>
                    </div>
                    <!-- ***** Search End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="../main/pension">펜션/병원</a></li>
                        <li><a href="/peco/board/main">커뮤니티</a></li>
                        <li><a href="#">업소등록</a></li>
                        
                        <!-- 마이페이지 네비게이션, 탭 -->
                         <li class="nav-item dropdown">
						    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">마이페이지</a>
						    <ul class="dropdown-menu">
						      <li><a class="dropdown-item" href="/peco/profile?m_id=${member.m_id}">나의 정보</a></li>
						      <li><a class="dropdown-item" href="/peco/pensionProfile?m_id=${member.m_id}">나의 펜션 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/hospitalProfile?m_id=${member.m_id}">나의 병원 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/myBoard?m_id=${member.m_id}">나의 글 목록</a></li>
						      <li><a class="dropdown-item" href="#">회원탈퇴</a></li>
						    </ul>
						  </li>
                        
                        <li><a href="../login">로그인 <img src="assets/images/profile-header.jpg" alt=""></a></li>
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