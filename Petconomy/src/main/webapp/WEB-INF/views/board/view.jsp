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

  <!-- SweetAlert2 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.3/dist/sweetalert2.min.css">

  <!--댓글창 JS -->
  <script src="/resources/js/reply.js"></script>

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

body {
  margin: 0 auto; /* 바디 마진을 0으로 하고 가로 가운데 정렬 */
  background-color: white;
}

div > .page-content {
  background-color: rgb(251, 235, 215);
  padding: 30px
}

.top-streamers {
  margin-top: 50px;
  overflow: auto;
  background-color: bisque;
}

.featured-games {
  background-color: bisque;
}

.live-stream {
  background-color: bisque;
}

@keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }
  40% {
    transform: translateY(-30px);
  }
  60% {
    transform: translateY(-15px);
  }
}

.fa-bounce {
  animation: bounce 1s;
}

#likebox {
  display: flex;
  align-items: center;
  justify-content: center;
}
    
    
    
    /* 스타일이 추가된 부분만 표시 */
	.modal-backdrop {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0, 0, 0, 0.5);
	  backdrop-filter: blur(8px); /* 흐림 효과 */
	  z-index: 1040;
	  display: none;
	}
	
 

	
	
	
	.reply-form-container {
    width: 100%;
    background-color: #f5f5f5;
    padding: 10px;
    box-sizing: border-box;
    position: relative;
    overflow: hidden; /* 내용 오버플로우 시 스크롤 생성 */
}

.header-and-buttons {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.reply-form-header {
    font-weight: bold;
}


.reply-textarea {
    width: 93%;
    height: 80px;
    padding: 5px;
    box-sizing: border-box;
    resize: none;
}

.submit-button {
    position: absolute;
	width: 6%;
    height: 80px;
    bottom: 17px;
    right: 10px;
    padding: 5px 10px;
    background-color: #4285f4;
    color: white;
    border: none;
    cursor: pointer;
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
	
	
/* 댓글 목록 */
.replyDiv {
    border-bottom: 1px solid #e0e0e0;
    padding: 20px 0;
}


.replylist{
  margin-top:20px;
  background-color: rgb(251, 235, 215);
  padding: 30px;
  border-radius: 23px;
}
  

.reply-insert {
    margin-top: 10px;
    padding: 15px;
    border: 2px solid #e4e4e6;
    border-radius: 23px;
    background-color: white;
}

.reply-insert textarea {
    font-family: inherit;
    margin-top: 10px;
    width: 100%;
    height: 25px;
    resize: none;
    border: none;
    font-size: 14px;
}

.reply-insert .reply-end {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: flex-end;
}

.reply-insert .reply-end2 {
    display: flex;
    grid-gap: 7px;
    gap: 7px;
}

.reply-insert .reply-end .reply-button {
    position: relative;
    width: 81px;
    height: 26px;
    font-size: 12px;
    border-radius: 21px;
    border: none;
    color: #fff;
    margin-left: 10px;
    background-color: #fcd11e;
    color: #000;
}

.reply-in {
    border-bottom: 1px solid #e0e0e0;
    padding: 20px 0;
}

.reply-in .replyerdate {
    margin-bottom: 21px;
    display: flex;
    justify-content: space-between;
    font-size: 13px;
    color: #868688;
}

.replynone {
    display: none;
}

.reply-content {
    white-space: pre-wrap;
    margin-bottom: 26px;
    word-wrap: break-word;
    line-height: 140%;
}

.r-reply{
    display: flex;
    justify-content: space-between;
}	

.r-reply-button {
    height: 26px;
    font-size: 12px;
    text-align: center;
    background-color: #f6f6f9;
    color: #868688;
    border: none;
    border-radius: 21px;
    display: inline-block;
    padding: 4px 20px;
    margin-right: 6px;
}


.no-reply {
    margin: 20px 0;
    padding: 0 30px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    background-color: #f6f6f9;
    color: #868688;
}

.no-reply-text{
    line-height: 150%;
}

.no-reply-imgbox{
    position: relative;
    width: 280px;
    height: 160px;
}

.no-reply-img {
    width: 100%;
    height: 100%;
    position: absolute;
    bottom: 0;
}

.game-details .content .left-info {
  background-color: white;

}	
.game-details .content .right-info {
  background-color: white;

}

.game-details .content .left-info ul li {
  color : black;

}		

.game-details .content .left-info ul li:first-child i {
    color: black;
}

.game-details .content .right-info ul li {
  color : black;

}
    
  </style>
  <script>
  
window.addEventListener('load', () => {
	
	
	// 텍스트 영역에 input 이벤트 리스너 추가
	document.addEventListener('input', function (e) {
	    if (e.target && e.target.nodeName === 'TEXTAREA') {
	        autoExpand(e.target); // autoExpand 함수 호출
	    }
	});


	
      /* --------------좋아요버튼-------------- */
      const animatedIcon = document.getElementById('animated-icon');
      const likebox = document.getElementById('likebox');

      // 좋아요 버튼 클릭 시 애니메이션 추가
      likebox.addEventListener('click', () => {
          animatedIcon.classList.add('fa-bounce'); // 애니메이션 클래스 추가
          console.log("바운스")
          getLike()
          // 애니메이션이 완료된 후에 클래스를 제거합니다.
		  animatedIcon.addEventListener('animationend', () => {
		      animatedIcon.classList.remove('fa-bounce');
		  });

          // 좋아요 증가 함수 호출 등...
      });


     

      /* --------------좋아요버튼 끝-------------- */
      
    //답글 등록 버튼이 있을경우에만 이벤트 등록 = 답글 등록 버튼은 세션이 존재할 경우에만 표시  
    let btnReplyWrite = document.getElementById('btnReplyWrite'); 
	if(btnReplyWrite){
      btnReplyWrite.addEventListener('click', function () {
        replyWrite()
      });
	}

      //댓글목록 조회 및 출력
      getReplyList();

      //파일목록 조회 및 출력
      getFileList();
    
});




//텍스트 영역을 자동으로 늘리는 함수
function autoExpand(textarea) {
    // 텍스트 영역의 높이를 기본 스크롤 높이로 재설정
    textarea.style.height = 'auto';
    
    // 텍스트 영역의 높이를 스크롤 높이로 설정
    textarea.style.height = (textarea.scrollHeight) + 'px';
}
   
    var nickname = "${sessionScope.member.nickname}"; // 닉네임 전역변수 선언
    
    
    /* -------------------좋아요 증가 시작--------------------------- */
    function getLike() {
      let bno = '${board.bno}';
      console.log(bno);

      if (bno) {
        fetch('/peco/like/'+bno)
          .then(response => response.json())
          .then(count  => viewLike(count ));
      }
    }

    function viewLike(count) {
    		console.log("좋아요 숫자는",count)
    	  const likecntDiv = document.getElementById('likecntDiv');
    		
    	  if (count > 0) {
    	    likecntDiv.textContent = count;
    	  } else {
    	    // 좋아요 숫자가 0보다 작을 때 처리하는 부분입니다.
    	    console.log("좋아요 0일때 진입")
    	    likecntDiv.textContent = '0';
    	  }
    	}
    /* -------------------좋아요 증가 끝--------------------------- */
    
    
    function getFileList() {
      let bno = '${board.bno}';
      console.log(bno);

      if (bno) {
        fetch('/peco/file/list/' + bno)
          .then(response => response.json())
          .then(map => viewFileList(map));
      }
    }

    function viewFileList(map) {
      console.log(map);

      let content = '';
      if (map.list.length > 0) {
        content += ''
          + '<div class="mb-3">                                              '
          + '  <label for="content" class="form-label">첨부파일 목록</label> 	  '
          + '  <div class="form-control" id="attachFile" style="width: 100%;  display: flex; flex-wrap: wrap;">                    '

        map.list.forEach(function (item, index) {
          let savePath = encodeURIComponent(item.savePath);
          let s_savePath = encodeURIComponent(item.s_savePath);

          console.log('세이브 패스 여기다 -=>', savePath)
          content +=''                                                                                                                                         
				  		+'        <div class="files"  style="width: 150px; height: 130px; margin-right:10px;">                                                                                                                      '                                     
				  		+'            <a href="/file/download?filename=' + savePath + '">                                                                                                                        '
				  		+'                <img src="/peco/display?fileName=' + savePath + '" alt="" class="thumbnail-image" style="border-radius: 23px; margin-right: 10px; width: 100px; height: 100px;">       ' 
				  		+'                <br>                                                                                                                                                                   '
				  		+'                <div class="file-info">                                                                                                                                                '
				  		+'                    <span class="file-name">' + (item.filename.length > 5 ? item.filename.substring(0, 5) + '' : item.filename) + '</span>                                        '
				  		+'                    <span class="file-extension">.' + item.filename.split('.').pop() + '</span>                                                                                        '
				  		+'            </a>                                                                                                                                                                   '
				  		+'                </div>                                                                                                                                                                 '
				  		+'        </div> '
				  		+'        <br> '
        })

        content += '  </div>                                                        '
          + '</div>                                                          ';
      } else {
        content = '등록된 파일이 없습니다.';
      }

      divFileupload.innerHTML = content;
    }
    
    
	/* 파일업로드처리 끝난 후 실행할 콜백함수 */
    function fileuploadRes(map) {
      if (map.result == 'sucess') {
        divFileuploadRes.innerHTML = map.msg;
        getFileList()

      } else {
        alert(map.msg);
        getFileList()
      }
    }
	
	/* 게시글  목록  */
	/* 검색어,페이지 정보 유지하고 리스트로 돌아가기 */
    function postList() {
    	var category = document.querySelector('#category').value // category 파라미터 값 가져오기
        var url;
        
        // category 값에 따라 요청할 URL 결정
        if (category === "free") {
            url = "/peco/board/free?&pageNo=${param.pageNo}&searchField=${param.searchField}&searchWord=${param.searchWord}"; //일상 게시판
        } else if (category === "healing") {
            url = "/peco/board/healing?&pageNo=${param.pageNo}&searchField=${param.searchField}&searchWord=${param.searchWord}"; //힐링 게시판
        } else {
            url = "/peco/board/main?&pageNo=${param.pageNo}&searchField=${param.searchField}&searchWord=${param.searchWord}"; 
        }
        
        // 요청할 URL로 이동
        window.location.href = url;

      }
	
	/* 게시글 수정 */
    function postEdit() {
        viewForm.action = '/peco/board/edit';
        viewForm.submit();

      }
    
    
	/* 게시글삭제 */
    function postDelete() {
        viewForm.action = '/peco/board/delete';
        viewForm.submit();
        hideModal();
    }

	/* 게시글 삭제 모달 */
    function postDeleteModal() {
    	  // 배경 blur 처리를 위해 modal-backdrop 클래스를 선택하고 스타일을 변경
    	  const backdrop = document.getElementById('backdrop');
    	  backdrop.style.display = 'block';

    	  Swal.fire({
    	    title: '게시글 삭제',
    	    text: '정말 게시글을 삭제하시겠습니까?',
    	    icon: 'warning',
    	    showCancelButton: true,
    	    confirmButtonText: '예',
    	    cancelButtonText: '아니오',
    	    allowOutsideClick: false,
    	    allowEscapeKey: false,
    	  }).then((result) => {
    	    if (result.isConfirmed) {
    	      postDelete();
    	    }
    	    // 모달 창이 닫힐 때 배경 blur 처리 스타일을 원래대로 변경
    	    backdrop.style.display = 'none';
    	  });
    }
	
	
	/* 댓글 삭제 모달 */
    function replyDeleteModal(rno) {
    	  // 배경 blur 처리를 위해 modal-backdrop 클래스를 선택하고 스타일을 변경
    	  const backdrop = document.getElementById('backdrop');
    	  backdrop.style.display = 'block';

    	  Swal.fire({
    	    title: '게시글 삭제',
    	    text: '정말 게시글을 삭제하시겠습니까?',
    	    icon: 'warning',
    	    showCancelButton: true,
    	    confirmButtonText: '예',
    	    cancelButtonText: '아니오',
    	    allowOutsideClick: false,
    	    allowEscapeKey: false,
    	  }).then((result) => {
    	    if (result.isConfirmed) {
    	      postDelete();
    	    }
    	    // 모달 창이 닫힐 때 배경 blur 처리 스타일을 원래대로 변경
    	    backdrop.style.display = 'none';
    	  });
    }
	



    
  </script>
</head>

<body>
<div class="modal-backdrop" id="backdrop"></div>
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
      
      
      
      
      
      
      
        <form method="get" name="viewForm">
          <!-- 검색조건 유지하기 위해 갖고가야하는 값들 -->
          <input type="text" name="pageNo" value="${param.pageNo }">
          <input type="text" name="searchField" value="${param.searchField }">
          <input type="text" name="searchWord" value="${param.searchWord }">
          <input type="text" name="bno" id="bno" value="${board.bno }">
          <input type="text" name="m_id" id="m_id" value="${sessionScope.member.m_id }">
          <input type="text" name="writer" id="writer" value="${board.nickname }">

          <!-- 페이징 처리 하기 위해 있어야함 -->
          <input type="hidden" id="page" name="page" value=1>
          <input type="text" id="category" name="category" value="${board.category }">
          
          <!-- ***** Details Start ***** -->
          <div class="game-details">
            <div class="col-lg-12">
              <div class="col-lg-12">
                <div class="content ">
                  <div class="row justify-content-center">
                    <div class="col-lg-6">
                      <div class="left-info">
                        <div class="left">
                          <h4>${board.title }</h4>
                          <h4>${board.nickname }</h4>
                        </div>
                        <ul>
                         <li><i class="fa fa-eye "></i> ${board.visitcount} </li>
                          <li><h4>${board.regdate }</h4></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="right-info ">
                        <ul class="d-flex justify-content-around">
						  <c:if test="${sessionScope.member.m_id eq board.m_id}">
						    <li>
						      <label for="btnEdit"  onclick="postEdit()">
						        <i id="btnEdit" class="fa-solid fa-pen-to-square" style="color: #ffa200;"></i>
						        <span style="margin-left: 5px; font-weight: bold;">글 수정</span>
						      </label>
						    </li>
						    <li>
						      <label for="btnDeleteModal" onclick="postDeleteModal()">
						        <i id="btnDeleteModal" class="fa-solid fa-trash" style="color: #ffa200;"></i>
						        <span style="margin-left: 5px; font-weight: bold;">글 삭제</span>
						      </label>
						    </li>
						  </c:if>
						  <li>
						    <label for="btnList" onclick="postList()">
						      <i id="btnList" class="fa-regular fa-rectangle-list" style="color: #ffa200;"></i>
						      <span style="margin-left: 5px; font-weight: bold;">목록</span>
						    </label>
						  </li>
						</ul>

                      </div>
                    </div>
                    <div class="content col-lg-12" style="background-color: white">
                      <div class="col-lg-7">
                        <!------- 글내용 안에 파일  출력 --------->
                        <c:forEach items="${filelist}" var="file">
                          <!----사진 클릭했을때 원본 이미지 새창-- -->
                          <a href="/peco/display?fileName=${file.savePath}" target="_blank">
                          <img src="/peco/display?fileName=${file.savePath}" alt="${file.filename}" style="border-radius: 23px; margin-bottom: 30px;">
                          </a>
                          <br>
                        </c:forEach>
                      <p>${board.content }</p>
                      </div>
                    </div>
                    
                    <!-- 좋아요 표시하는곳 -->
                    <div class="col-1 " id="likediv">
                      <div class="main-border-button" >
                      	<label for="likebox">
                        <a class="col-1" id="likebox"><i id="animated-icon" class="fa-regular fa-thumbs-up fa-lg" style="color: #ffa200;"></i>
                        <div id="likecntDiv">${board.likecount }</div>
                        </a>
                        </label>
                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Details End ***** -->
        </form>
        
        <br>
        

        
        
        
        <!-- 비동기로 js에서 작성한 파일 목록 태그 들어갈 자리 -->
        <div id="divFileupload"></div>
      </div>
      
      
      <div class="replylist">
      
	        <!-- 총댓글수 들어오는곳 -->
	        <div id="totalCnt"></div>
	        
	        <!-- TODO 닉네임을 변경했을때 세션에 바로 갱신을 해주어야 작성자에 새로운 닉네임이 반영됨
	                그렇지않으면 세션 만료 전까지 이적 닉네임으로 저장됨 -->
	        <c:if test="${not empty sessionScope.member.m_id}">
					<div>
						<div class="reply-insert">
							<textarea id="reply" placeholder="답변을 입력해주세요"></textarea>
							<div class="reply-end">
								<div class="reply-end2"></div>
							    <div><button class="reply-button" id="btnReplyWrite">등록</button></div>
							</div>
						</div>
					</div>
			                                          
	        </c:if>
	
	        <!-- ----------------댓글창 들어가는곳----------------- -->
	        <div id="replyDiv">  </div>
	        <!-- ----------------댓글창 들어가는곳 끝----------------- -->
	        
	        
        
   
      </div>
    </div>
  </div>
</div>

<footer>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <p>Copyright © 2036 <a href="#">Cyborg Gaming</a> Company. All rights reserved.

          <br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a> Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
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

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.3/dist/sweetalert2.all.min.js"></script>
</body>
</html>
