<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
	a {
	  text-decoration: none;
	  color: inherit;
	}
	.tab {
	  display: flex;
	  align-items: center;
	  padding: 1rem;
	}
	.tab__item {
	 list-style-type: none;
	  padding: 0.6rem 1.3rem;
	  margin-right: 1rem;
	  border: 1px solid #ddd;
	  border-radius: 2rem;
	}
	.tab__item.active {
	  display: inline-block;
	  border: 1px solid #b81c0f;
	  background-color: #b81c0f;
	  color: #fff;
	}
	.tab__content-wrapper {
	  padding: 1rem
	}
	.tab__content {
	  display: none;
	}
	.tab__content.active {
	  display: block;
	}
	#text{
	 display: flex;
    justify-content: center;
    align-items: center;
	}
	th, td {
    border: 1px solid #444444;
  }	
</style>

<script>

window.addEventListener('load',function(){
	// 댓글목록 조회및 출력
	getMemberList();
	
	getPensionList();
	
	getPReviewList();
	
	getHReviewList();
	
});

</script>

</head>
<body>
<div class="d-grid gap-2 col-6 mx-auto">
  <button class="btn btn-outline-dark" type="button" onclick="location.href='/peco/main'">메인 페이지</button>
</div>	
	<!-- 탭 버튼 영역 -->
	<ul class="tab">
	  <li class="tab__item active">
	    <a href="#tab1">회원 관리</a>
	  </li>
	  <li class="tab__item">
	    <a href="#tab2">게시글 관리</a>
	  </li>
	  <li class="tab__item">
	    <a href="#tab3">숙소 관리</a>
	  </li>
	  <li class="tab__item">
	    <a href="#tab4">리뷰 관리</a>
	  </li>
	</ul>
	<div id="text">
		<!-- 탭 내용 영역 -->
		<div class="tab__content-wrapper">
		  <div id="tab1" class="tab__content active">
		  	<div style="text-align: center;">
		  		<h3>회원 목록</h3>
		  		
			  	<div id="memberDiv"></div>
			  	<!-- <div id="paginationDiv"></div> -->
		  	</div>
		  </div>
		  <div id="tab2" class="tab__content">
		  	두번째 탭 내용
		  </div>
		  <div id="tab3" class="tab__content">
		  	<div style="text-align: center;">
		  		<h3>승인대기 펜션 목록</h3>
			  	<div id="pensionDiv"></div>
			  	<!-- <div id="pensionpaginationDiv"></div> -->
		  	</div>
		  </div>
		  <div id="tab4" class="tab__content">
		  	<div style="text-align: center;">
		  		<h3>펜션 리뷰 목록</h3>
		  		
			  	<div id="pReviewDiv"></div>
			  	<!-- <div id="PReviewpaginationDiv"></div> -->
		  	</div>
		  	<div style="text-align: center;">
		  		<h3>병원 리뷰 목록</h3>
		  		
			  	<div id="hReviewDiv"></div>
			  	<!-- <div id="HReviewpaginationDiv"></div> -->
		  	</div>
		  </div>
		</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="bImgDiv">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

	<script type="text/javascript">
const tabItem = document.querySelectorAll(".tab__item");
const tabContent = document.querySelectorAll(".tab__content");

// 2. 탭 버튼들을 forEach 문을 통해 한번씩 순회한다.
// 이때 index도 같이 가져온다.
tabItem.forEach((item, index) => {
  // 3. 탭 버튼에 클릭 이벤트를 준다.
  item.addEventListener("click", (e) => {
    // 4. 버튼을 a 태그에 만들었기 때문에, 
    // 태그의 기본 동작(링크 연결) 방지를 위해 preventDefault를 추가한다.
    e.preventDefault(); // a 
    
    // 5. 탭 내용 부분들을 forEach 문을 통해 한번씩 순회한다.
    tabContent.forEach((content) => {
      // 6. 탭 내용 부분들 전부 active 클래스를 제거한다.
      content.classList.remove("active");
    });

    // 7. 탭 버튼들을 forEach 문을 통해 한번씩 순회한다.
    tabItem.forEach((content) => {
      // 8. 탭 버튼들 전부 active 클래스를 제거한다.
      content.classList.remove("active");
    });

    // 9. 탭 버튼과 탭 내용 영역의 index에 해당하는 부분에 active 클래스를 추가한다.
    // ex) 만약 첫번째 탭(index 0)을 클릭했다면, 같은 인덱스에 있는 첫번째 탭 내용 영역에
    // active 클래스가 추가된다.
    tabItem[index].classList.add("active");
    tabContent[index].classList.add("active");
  });
});
</script>
<script src="/resources/js/AdminMember.js"></script>
<script src="/resources/js/AdminPension.js"></script>
<script src="/resources/js/AdminPReview.js"></script>
<script src="/resources/js/AdminHReview.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>