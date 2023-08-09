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
      body{
        background-color: white;
      }
    
      div >.page-content{
        background-color: rgb(255, 187, 0);
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
        height: 150px;
        
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
  


  </style>
  
  <script>
window.addEventListener('load', function() {
	
	const filesInput = document.getElementById('files');
    filesInput.addEventListener('change', function(){
    	
      	
		let formData = new FormData(writeForm);
		
		//Formdata값 확인
		//[0]배열은 이름
		//[1]배열은 값
		console.log("formData : ", formData);
		for(var pair of formData.entries()){
			if(typeof(pair[1]) ==  'object'){
				let fileName = pair[1].name;
				let fileSize = pair[1].size;
				
				//파일 확장자, 크기 체크
				//업로드가능한 최대 용량을 초과하지않았는지 확인
				//서버에 전송 가능한 형식인지 확인
				if(!checkExtension(fileName,fileSize)){
					return false
				} 
				
				
				console.log('fileName : ',fileName);				
				console.log('fileSize : ',fileSize);
			}
		}
	
		
		fetch('/peco/file/fileUploadActionFetch',{method:'post',body: formData})
		.then(response => response.json())
		.then(map => getFileList());
    });
    
    
    
 	// dropZone에 dragover 이벤트 리스너 추가
    const dropZone = document.getElementById('dropZone');
    dropZone.addEventListener('dragover', handleDragOver);

    // dropZone에 drop 이벤트 리스너 추가
    dropZone.addEventListener('drop', handleFileDrop);

    // 이벤트 핸들러 정의
    function handleDragOver(event) {
      event.preventDefault();
      dropZone.classList.add('dragover');
    }

    function handleFileDrop(event) {
      event.preventDefault();
      dropZone.classList.remove('dragover');

      const files = event.dataTransfer.files;
   	  // 파일 유효성 검사 함수 호출
      if (validateFiles(files)) {
        handleUploadedFiles(files);
      }
    }

    // 업로드된 파일을 처리하는 함수
    function handleUploadedFiles(files) {
      const formData = new FormData(writeForm);

      for (const file of files) {
        formData.append('files', file);
      }

      // 파일 업로드 요청 보내기
      fetch('/peco/file/fileUploadActionFetch', {
        method: 'post',
        body: formData,
      })
      .then(response => response.json())
      .then(map => {
        // 응답 처리, 파일 목록 업데이트 등
        getFileList();
      });
    }
	
	



	//파일목록 조회 및 출력
	getFileList();
	
	
});
//파일첨부버튼으로 업로드 할시에 실행될 유효성 검사 함수
function checkExtension(fileName, fileSize){
	let maxSize = 10 * 1024 * 1024; // 10MB
	// .exe   .sh   .zip   .alz 로 끝나는 문자열
	// 정규표현식 : 특정 규칙을 가진 문자열을 검색 하거나 치환할때 사용
	let regex = new RegExp("(.*?)\.(jpg|png|gif|jpeg|bmp|tiff|tif)$");
	
	if(maxSize <= fileSize){
		alert('파일 크기가 10MB 이하여야 합니다.');
		return false;		
	}
	
	//문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false를 리턴한다
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.")
		return false;
	}
	
	return true;
}
	
	
//드래그앤드랍으로 업로드 할시에 실행될 유효성 검사 함수
function validateFiles(files) {
  const allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/bmp', 'image/tiff', 'image/tif'];
  const maxSize = 10 * 1024 * 1024; // 10MB

  for (const file of files) {
    if (!allowedTypes.includes(file.type)) {
    	alert("해당 종류의 파일은 업로드 할 수 없습니다.")
      return false;
    }

    if (file.size > maxSize) {
      alert('파일 크기가 10MB 이하여야 합니다.');
      return false;
    }
  }

  return true;
}




	

  function getFileList(){
  	///file/list/{bno}
  	
  	let bno = '${board.bno}';
  	console.log(bno);
  	
  	if(bno){
  	fetch('/file/list/'+bno)
  		.then(response => response.json())
  		.then(map => viewFileList(map));
  	}
  }


  function viewFileList(map){
  	console.log(map);
  	
  	let content = '';
  	if(map.list.length > 0 ){
  			content +=''
  					+'<div class="mb-3">                                              '
  					+'  <label for="content" class="form-label">첨부파일 목록</label> 	  '
  					+'  <div class="form-control" id="attachFile">                    '
  		
  		map.list.forEach(function(item,index){
  			let savePath = encodeURIComponent(item.savePath);

  			console.log('세이브 패스 여기다 -=>',savePath)
  			content +=''
  					+'<a href="/file/download?filename='+savePath+'">  '
  					+ item.filename
  					+'</a>'
  					+'<i class="fa-regular fa-trash-can" onclick="FileDelete(this)"		' 
  					+'data-bno="'+item.bno+'" data-uuid="'+item.uuid+'"></i>		'
  					+' <br>			';
  		})
  		
  			content +='  </div>                                                        '
  					+'</div>                                                          ';
  	}else{
  		content = '등록된 파일이 없습니다.';
  	}
  	
  	divFileupload.innerHTML = content;
  }

  function FileDelete(e){
  	//e.data 값 가져오는법
  	console.log(e.dataset.bno,e.dataset.uuid,e.dataset.aaa)
  	
  	let bno = e.dataset.bno
  	let uuid = e.dataset.uuid
  	
  	//fetch요청
  	//jsp 자바스크립트에서 백틱쓰려면 변수앞에 \${} 역슬래쉬 붙여줘야함
  	//EL 표현식과 충돌나서 에러발생하는것
  	//*주석처리해도 변수 앞에 역슬래쉬 안붙이면 에러 뜸!!*
  	 fetchGet(`/file/delete/\${uuid}/\${bno}`, fileuploadRes); 
  	//fetchGet('/file/delete/'+uuid+'/'+bno+'', fileuploadRes);
  }

  function fileuploadRes(map){
  	if(map.result == 'sucess'){
  		divFileuploadRes.innerHTML = map.msg;
  		getFileList()
  		
  	}else{
  		alert(map.msg);
  		getFileList()
  	}
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
    <header class="header-area header-sticky">
      <div class="container">
          <div class="row">
              <div class="col-12">
                  <nav class="main-nav">
                      <!-- ***** Logo Start ***** -->
                      <a href="index.html" class="logo">
                          <img src="assets/images/logo.png" alt="">
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
                          <li><a href="index.html">Home</a></li>
                          <li><a href="browse.html" class="active">Browse</a></li>
                          <li><a href="details.html">Details</a></li>
                          <li><a href="streams.html">Streams</a></li>
                          <li><a href="profile.html">Profile <img src="assets/images/profile-header.jpg" alt=""></a></li>
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
    <!-- ***** Header Area End ***** -->
  
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
    
    <form method="post" enctype="multipart/form-data" name="writeForm" action="/peco/board/write">
        
        <!-- 검색조건 유지하기 위해 갖고가야하는 값들 -->
        <input type="text" name="pageNo" value="${param.pageNo }">
        <input type="text" name="searchField" value="${param.searchField }">
        <input type="text" name="searchWord" value="${param.searchWord }">
        <input type="text" name="writer" value="${sessionScope.member.nickname}">
        
        <!-- 페이징 처리 하기 위해 있어야함 -->
        <input type="text" name="m_id" value="${sessionScope.member.m_id }">
        <input type="hidden" id="page" name="page" value="1">
        
  		<!-- 임시 bno 값 -->
    	<input type="hidden" name="bno" value="${tempBno}">
        
        
        
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
		
		<div id="dropZone" style="border: 2px dashed #ccc; padding: 20px;">
		    <p>파일을 여기로 드래그 앤 드롭하세요</p>
		</div>
		
		<!-- 첨부파일 목록 표시 -->
		<div id="divFileupload"></div>
        
        <div style="text-align: center;">
            <button type="submit" class="btn btn-danger btn-lg">글 작성</button>
        </div>


    </form>




























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