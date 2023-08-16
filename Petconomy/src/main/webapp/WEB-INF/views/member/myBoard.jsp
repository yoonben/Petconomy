<%@page import="com.peco.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/410d7ec875.js" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/9e7ba5ea4c.js" crossorigin="anonymous"></script>
	
<title>Insert title here</title>

  	<!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type='text/javascript'>


	
		$(function(){
			var chkObj = document.getElementsByName('rowCheck');
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='rowCheck']");
				for(var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			
			$("input[name='rowCheck']").click(function(){
				if($("input[name='rowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				} else {
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		
		function deleteValue(){
			var url = "/myBoard";    // 컨트롤러로 보내고자 하는 URL
			var valueArr = new Array();
			var list = $("input[name='rowCheck']");
			for(var i=0; i<list.length; i++){
				if(list[i].checked){   //선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
			if(valueArr.length == 0){
				alert("선택된 글이 없습니다.");
			} else{
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : "/myBoard",   //전송 url
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr     //보내려는 data변수 설정
					},
					success : function(jdata){
						if(jdata = 1){
							alert("삭제 성공하였습니다.");
							location.replace("myBoard")  //myBoard로 페이지 새로고침
						} else{
							alert("삭제 실패하였습니다.");
						}
					}
				});
			}
		}

  </script>
  
  <style>
	  #delete-btn{
		width: 150px; 
		height: 50px;
		border-radius: 20px;
		}
		#delete-btn:hover {
			color: #F99;
			background-color: #ffffff;
		}
		
		#myboard-link{
			color: #212529;
			text-decoration: underline;
			text-decoration-color: red;
		}
		#myboard-link:hover{
			color: #F99;
		}
		
		<!-- i n p u t 박 스 -->
input[type='checkbox']{
    width: 2rem !important;
    height: 2rem !important;
    -webkit-appearance: none;
    -moz-appearance: none;
    -o-appearance: none;
    appearance:none;
    outline: none;
    box-shadow: none;
    background: url()no-repeat;
}

#checkbox check 상태
input[type='checkbox']:checked{
    -webkit-appearance: none;
    -moz-appearance: none;
    -o-appearance: none;
    appearance:none;
    box-shadow: none;
    background: url() no-repeat;
}
  </style>
  
</head>
<body>
  <!-- 헤더영역 시작-->
	<%@include file="../main/header.jsp" %>
  <!-- 헤더영역  끝-->

 <div class="container">
    <div class="row">
      <div class="col-lg-12">
       <div class="page-content">
		 <div class="row">
		 
		           <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                
                    <div class="main-info header-text">
                      <h1>내 글 목록 (게시글 / 댓글)</h1>
                    </div>
					<div>
						<form id="myBoardList" name="myBoardList" >
							 <table  width='90%' height='100px' >
									<tr height='30px'>
										<th><input type='checkbox' id='allCheck' name='allCheck'></th>
										<th>번호</th>
										<th>카테고리</th>
										<th>작성자</th>
										<th colspan=2 >제목</a></th>
										<th>작성날짜</th>
										<th>조회수</th>
									</tr>
		

						<c:forEach var="boardVO" items="${board}">
								<tr>
									<td><input type='checkbox' name='rowCheck' value='${boardVO.bno }'></td>
									<td>${boardVO.bno }</td>
									<td>${boardVO.category }</td>
									<td>${boardVO.writer }</td>
									<td  colspan=2 >
										<a href="/peco/board/view?bno=${boardVO.bno}" id='myboard-link'>
											${boardVO.title}  <i class="fa-solid fa-pen-to-square"></i>
										</a>
									</td>
									<td>${boardVO.regdate}</td>
									<td>${boardVO.visitcount}</td>
								</tr>
						</c:forEach>
			
				
							
								<tr>
									<td colspan='8'>
								        <i id="btnDeleteModal" class="fa-solid fa-trash" style="color: #ffa200;"></i>
								        <input type='button' value='삭제' id='delete-btn' onclick='deleteValue();'>
									</td>
								</tr>	
							</table>
					</form>
					
					
		<!-- 페이징 처리 -->
					  </div>
		          	</div>
		          </div>
		        </div>
					 <!-- 네비영역 시작-->
						<%@include file="../main/pageNavi.jsp" %>
					  <!-- 네비영역  끝-->
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
  <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
  

</body>
</html>