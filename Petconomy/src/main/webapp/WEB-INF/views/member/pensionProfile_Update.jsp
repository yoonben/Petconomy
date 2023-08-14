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
  
  


<%
String p_id = request.getParameter("p_id");
String m_id = request.getParameter("m_id");
String pName = request.getParameter("pName");
String Addr = request.getParameter("Addr");
String openHour = request.getParameter("openHour");
String ParkYN = request.getParameter("ParkYN");
String checkYN = request.getParameter("checkYN");

System.out.println("p_id : " + p_id);
System.out.println("m_id : " + m_id);

%>

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
                      <h1>나의 펜션정보 수정</h1>
                    </div>
				<div class="col-lg-6 align-self-center">
					<form id='P_ProfileUpdateForm' name='P_ProfileUpdate' action='/peco/pensionProfile' method='post'>
						<c:set var="PensionVO" value="${pension }"/>
						<table id="profileTable" width='100%' height='100%'>
					
							<tr>
								<th>펜션번호</th>
								<td><input type='text' name='p_id' readonly value='${PensionVO.p_id }' style="height:100%; width:99%"></td>
							</tr>
							<tr>
								<th>회원번호</th>
								<td><input type='text' name='m_id' readonly value='${PensionVO.m_id }'  style="height:100%; width:99%"></td>
							</tr>
							<tr>
								<th>펜션명</th>
								<td><input type='text' name='pname' value='${PensionVO.pname }' style="height:100%; width:99%"></td>
							</tr>
							<tr>
								<th>도로명주소</th>
								<td><input type='text' name='addr' value='${PensionVO.addr }' style="height:100%; width:99%"></td>
							</tr>
							<tr>
								<th>운영시간</th>
								<td><input type='text' name='openhour' value='${PensionVO.openhour}' style="height:100%; width:99%"></td>
							</tr>
							<tr>
								<th>주차여부</th>
								<td><input type='text' name='parkyn' value='${PensionVO.parkyn}'  style="height:100%; width:99%"></td>
							</tr>
							<tr>
								<th>승인여부</th>
								<td><input type='text' name='checkyn' value='${PensionVO.checkyn}' style="height:100%; width:99%"></td>
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