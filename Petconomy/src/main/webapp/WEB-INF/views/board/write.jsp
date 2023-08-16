<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">

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
        padding: 30px
      }
    
      .featured-games{
        background-color: bisque;
      }
      
      footer p {
            color: black;
      }
      footer p > a {
            color: black;
      }
      
      .category {
          margin-bottom: 10px;
      }
    
      /* 카테고리 스타일 */
      .category {
          position: relative;
          /* 기본 색상 설정 */
          color: #ffffff;
      }
  
      /* 카테고리 뒤에 * 추가 */
      .category::after {
          content: '*';
          color: red;
          margin-left: 4px; /* *와 글자 사이의 간격 조절을 위해 왼쪽 여백 추가 */
      }
  
  
       /* 일상게시판 박스 스타일 */
      .board-box {
          width: 60px;
          height: 30px;
          font-weight: 500;
          border-radius: 20px;
          display: inline-flex;
          justify-content: center;
          align-items: center;
          cursor: pointer;
          margin-right: 10px; /* 가로 간격 조절을 위해 오른쪽 여백 추가 */
      }

          
          
          
    .title-bar{
        margin: 0;
        margin-bottom: 10px;
        padding: 5px;
        border: none;
        outline: none;
        border-radius: 15px;
        width: 100%;
        height: 40px;
        font-size: 15px;
    }

    /* 고정된 크기의 textarea 스타일 */
    .content-bar {
        resize: none; /* 사용자가 크기를 조정할 수 없도록 설정 */
        margin: 0;
        margin-bottom: 10px;
        padding: 5px;
        border: none;
        outline: none;
        border-radius: 15px;
        width: 100%;
        height: 500px;
        
    }

    /* 선택된 상태일 때의 테두리 스타일 */
    .title-bar.selected, .content-bar.selected {
        border: 2px solid;
        border-color: #000; /* 검정색으로 변경 */
    }

    /* 체크된 라디오 버튼의 스타일 변경 */
    input[type="radio"].btn-check:checked + label.btn-secondary {
      background-color: rgb(255, 217, 0);
      color: black; /* 선택된 상태에서 글자 색을 검정색으로 설정 */
    }
  
.board-menu {
    display: flex;
    align-items: center;
    height: 45px;
    margin-bottom:0;
}
.main-button{
    height: 100%;
    margin: 0;
}
.main-button > a{
    margin: 0;
    height: 40px;
    width: 110px;
    padding: 0; /* 좌우 패딩을 없애기 위해 추가 */
    display: flex; /* 텍스트 가운데 정렬을 위해 추가 */
    align-items: center; /* 텍스트 세로 가운데 정렬을 위해 추가 */
    justify-content: center; /* 텍스트 가로 가운데 정렬을 위해 추가 */
    text-align: center; /* 텍스트 내용 가운데 정렬을 위해 추가 */
}


  </style>
  
  <script>
window.addEventListener('load', function() {



	// 글수정 버튼 클릭 시  파일유효성검사
	document.getElementById('btnWrite').addEventListener('click', SubmitCheck);
	
	
});

	
//글수정 버튼 누를때 최종적으로 파일 유효성검사 함수 
//*업로드할때 이미 거르기때문에 의미없을수도있음
function SubmitCheck() {

	// 기본 이벤트 제거
	event.preventDefault(); 
	
	const filesInput = document.getElementById('files');
	const files = filesInput.files;
	try {
		// 파일 유형 확인
		const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/bmp', 'image/tiff', 'image/tif'];
		for (let i = 0; i < files.length; i++) {
		  if (!allowedTypes.includes(files[i].type)) {
		  	alert("해당 종류의 파일은 업로드 할 수 없습니다.")
		    return;
		  }
		}
		
		// 파일 크기 확인
		const maxSize = 10 * 1024 * 1024; // 10MB
		for (let i = 0; i < files.length; i++) {
		  if (files[i].size > maxSize) {
		    alert('파일 크기가 10MB 이하여야 합니다.');
		    return;
		  }
		}
		
	    // 글 제목 길이 확인
	    if (!checkTitleLength()) {
	    	alert('제목은 최대 100자까지 입력할 수 있습니다.');
	        return;
	    }
	    
		// 글 내용 길이 확인
	    if (!checkContentLength()) {
	    	alert('글 내용은 최대 2000자까지 입력할 수 있습니다.');
	        return;
	    }

	    //글 내용에 띄어쓰기 및 개행 처리
		processContent()
	    
		// 유효성 검사가  모두 유효한 경우, 폼 제출
		writeForm.submit();
	    
	} catch (e) {
		// 파일 업로드 예외 처리
        alert('파일 업로드에 실패하였습니다. 다시 시도해주세요.');
        console.error('파일 업로드 예외:', error);
	}
	
}

//제목 길이 유효성 검사
function checkTitleLength() {
    const titleInput = document.getElementById('title');
    const titleValue = titleInput.value;

    // 제목 길이 확인
    if (titleValue.length > 100) {
        
        return false; // 작성 취소
    }
    return true;
}

//내용 길이 유효성 검사
function checkContentLength() {
    const contentInput = document.getElementById('content');
    const contentValue = contentInput.value;

    // 글 내용 길이 확인
    if (contentValue.length > 2000) {
        
        return false; // 작성 취소
    }
    return true;
}

//글 내용 개행 띄어쓰기 처리
function processContent() {
    // <textarea>에서 내용 가져오기
    const contentInput = document.getElementById('content');
    const contentValue = contentInput.value;

    // 개행 문자를 <br> 태그로 대체
    const processedContent = contentValue.replace(/\n/g, '<br>');

    // 공백 문자 처리 (연속된 공백은 &nbsp;로 변환)
    const finalContent = processedContent.replace(/ {2,}/g, match => {
        return match.replace(/ /g, '&nbsp;');
    });

    // <textarea>의 내용 업데이트
    contentInput.value = finalContent;
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
          
          
          
          
          
          
          
            <div class="row">
            <div class="col-lg-12">
              <div class="featured-games header-text">
    
    <form method="post" enctype="multipart/form-data" name="writeForm" action="/peco/board/write">
        
        <!-- 검색조건 유지하기 위해 갖고가야하는 값들 -->
        <input type="text" name="pageNo" value="${param.pageNo }">
        <input type="text" name="searchField" value="${param.searchField }">
        <input type="text" name="searchWord" value="${param.searchWord }">
        <input type="text" name="writer" value="${sessionScope.member.nickname}">
        
        <!-- 페이징 처리 하기 위해 있어야함 -->
        <input type="text" name="m_id" value="${sessionScope.member.m_id }">
        <input type="hidden" id="page" name="page" value="1">
        

        
        
        <h4 class="category">카테고리</h4>

        <!-- 일상게시판 박스 -->
        <input type="radio" class="btn-check" name="category" id="free" autocomplete="off" value="free" ${param.category eq 'free' ? 'checked' : ''} >
        <label class="btn btn-secondary board-box" for="free">일상</label>


        <!-- 힐링게시판 박스 -->
        <input type="radio" class="btn-check" name="category" id="healing" autocomplete="off" value="healing" ${param.category eq 'healing' ? 'checked' : ''}>
        <label class="btn btn-secondary board-box" for="healing">힐링</label>
        
		<br>
        <br>
        <br>
        
        <h4 class="category">게시글 작성</h4>
        <input type="text" class="title-bar" name="title" id="title" placeholder=" 제목을 입력하세요" onfocus="applySelectedStyle(this)" onblur="removeSelectedStyle(this)" required>

        <textarea class="content-bar" name="content" id="content" placeholder=" 내용을 입력하세요" onfocus="applySelectedStyle(this)" onblur="removeSelectedStyle(this)" required></textarea>
        
        
        <div class="mb-3">
			<label for="files" class="form-label">첨부파일</label>
		    <input name="files" type="file" class="form-control" id="files" multiple>
		</div>
		
	
		
		<!-- 첨부파일 목록 표시 -->
		<div id="divFileupload"></div>
        
        <div style="text-align: center;">
            <button type="submit" id="btnWrite" class="btn btn-danger btn-lg">글 작성</button>
        </div>


    </form>

























			  </div>
			</div>
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


  </body>

</html>