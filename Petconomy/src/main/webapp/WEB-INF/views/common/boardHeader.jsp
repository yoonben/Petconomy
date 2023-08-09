<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div >.page-content{
    margin-top: 200px;
  }
  
</style>
</head>
<body>
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="/peco/board/main" class="logo"> <img
							src="" alt="">
					</a>
                    <!-- ***** Logo End ***** -->
                    
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                        <li><a href="../main/pension">펜션</a></li>
                        <li><a href="browse.html">병원</a></li>
                        <li><a href="details.html">커뮤니티</a></li>
                        <li><a href="streams.html" class="active">업소 등록</a></li>
                        <li><a href="profile.html">Profile <img src="/resources/assets/images/profile-header.jpg" alt=""></a></li>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
            <div class="col-lg-12">
              <nav class="main-nav">
                    <ul class="nav">
                        <li><a href="/peco/board/free">일상게시판</a></li>
						<li><a href="/peco/board/healing">힐링게시판</a></li>
                        <li><a href="browse.html">어쩌구게시판</a></li>
                        <li><a href="browse.html"></a></li>
                	</ul>
              </nav>
            </div>
        </div>
    </div>
  </header>
  
<!-- ----------모달--------------- --> 
<script type="text/javascript">

// 메세지 처리
/*
   		부트스트랩을 이용한 모달창 띄우기
 		
 		1. css,js 링크 추가하기
 		2. 모달요소 복사
 			타이틀,메세지 수정
 		3. 모달창 열기(message.jsp가 호출되자마자 버튼 뜨게)
 			자바스크립트를 이용해서 모달 객체 생성 후 show()메서드 호출해서 바로 보여줌
 		4. 모달창 닫기 (닫기 버튼 and 배경화면 아무곳 누르기)
 			자바스크립트를 이용해서 모달차을 닫을 경우
 			닫는 이벤트 발생(hidden.bs.modal)->
			그후 뒤로가기(history(-1)) 추가
 */
	let msg = '${msg}';
	
	window.addEventListener('load',function(){

		if(msg != ''){
			// 메세지 출력
			document.querySelector(".modal-body").innerHTML = msg;
			
			// 버튼 출력 제어
			document.querySelector("#btnModalSave").style.display='none';
			
			// 모달 생성
			let myModal = new bootstrap.Modal(document.getElementById('myModal'), {
				  keyboard: false
			});
			s
			// 모달 보여주기
			myModal.show();
			const myModalEl = document.getElementById('myModal')
			myModalEl.addEventListener('hidden.bs.modal', event => {
				//컨트롤러에서 원하는 url저장해서 넘겨주면 그곳으로 이동시킴
				let res = '${res}'
				//res < 0 = 처리가 안됐다는것
				if(res<0){
					//뒤로가기
					history.go(-1);
				}
			});
		}

	})
</script>


<!-- Modal -->
<div id="myModal" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" id="btnModalSave" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>