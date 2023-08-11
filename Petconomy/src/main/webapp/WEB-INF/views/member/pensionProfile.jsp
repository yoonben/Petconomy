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
	
<title>Insert title here</title>

  	<!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    

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
		 
			<!-- 나의 정보 시작  -->
            <div class="col-lg-12">
              <div class="main-profile ">
                <div class="row">
                    <div class="main-info header-text">
                      <h1>나의 펜션정보</h1>
                    </div>
				<div class="col-lg-6 align-self-center">
					<form id='P_ProfileForm' name='P_Profile' action='/peco/pensionProfile_Update?m_id=${pension.m_id}' method='post'>
						<c:set var="PensionVO" value="${pension}"/>
						<table id="profileTable" width='100%' height='100%'>
					
							<tr>
								<th>펜션번호</th>
								<td>${PensionVO.p_id }</td>
							</tr>
							<tr>
								<th>회원번호</th>
								<td>${PensionVO.m_id }</td>
							</tr>
							<tr>
								<th>펜션명</th>
								<td>${PensionVO.pname }</td>
							</tr>
							<tr>
								<th>도로명주소</th>
								<td>${PensionVO.addr }</td>
							</tr>
							<tr>
								<th>운영시간</th>
								<td>${PensionVO.openhour}</td>
							</tr>
							<tr>
								<th>주차여부</th>
								<td>${PensionVO.parkyn}</td>
							</tr>
							<tr>
								<th>승인여부</th>
								<td>${PensionVO.checkyn}</td>
							</tr>
						</table>
												
						<input type="submit" value="수정하기" class="btn" >
							
						<!-- TODO : 삭제 버튼 클릭시 기존 등록된 업체글 모두 삭제될 수 있도록  처리 매퍼에서 쿼리문 조인으로 작성-->
						<input type="button" value="삭제"><br><br>
					</form>
                </div>
          	 </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
<br><br><br><br><br>                       
<!-- ↓ ↓ ↓  예약정보 구현 ↓ ↓ ↓  -->
<h2>펜션 예약 고객정보</h2>

</body>
</html>