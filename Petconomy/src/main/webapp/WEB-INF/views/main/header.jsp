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
                         <li class="nav-item dropdown" >
						    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="font-size:1.2em">마이페이지 <i class="fa-solid fa-user"></i></a>
						    <ul class="dropdown-menu">
						    <c:if test="${sessionScope.member.adminyn eq 'Y'}">
						    	<li><a class="dropdown-item" href="/peco/admin/adminPage">관리자 페이지</a></li>							    
						    </c:if>
						      <li><a class="dropdown-item" href="/peco/profile?m_id=${member.m_id}" style="font-size:1.2em">나의 정보</a></li>
						      <li><a class="dropdown-item" href="/peco/pensionProfile?m_id=${member.m_id}" style="font-size:1.2em">나의 펜션 관리</a></li>
						      <li><a class="dropdown-item" href="/peco/myBoard?m_id=${member.m_id}" style="font-size:1.2em">나의 글 목록</a></li>
						      <li><a class="dropdown-item" href="#" style="font-size:1.2em" data-bs-toggle="modal" data-bs-target="#exampleModal2">회원탈퇴</a></li>
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
  
  <!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 탈퇴</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<b style="color: red">정말로 회원탈퇴를 진행 하시겠습니까? 회원탈퇴 버튼을누르시면 탈퇴됩니다.</b>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
        <button type="button" class="btn btn-danger" onclick="deleteMember('${sessionScope.member.m_id}')">회원탈퇴</button>
      </div>
    </div>
  </div>
</div>
<script>
function fetchGet(url, callback){
	try{
		// url 요청
		fetch(url)
			// 요청결과 json문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));			
	}catch(e){
		console.log('fetchGet',e);
	}
}

function memberRes(map){
	console.log(map);
	if(map.result == 'success'){
		// 성공 : 리스트 조회및 출력
		location.reload();
	} else {
		// 실패 : 메세지 출력
		alert(map.message);
	}
		
}

// 회원 삭제하기
function deleteMember(m_id) {
	console.log('m_id', m_id );
	fetchGet('/peco/adminMember/deletemember/' + m_id, memberRes);
	
}
</script>
</body>
</html>