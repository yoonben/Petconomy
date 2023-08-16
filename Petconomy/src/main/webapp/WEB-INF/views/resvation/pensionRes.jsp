<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<title>펜션예약</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Bootstrap core CSS -->
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

	<link rel="stylesheet" href="/resources/datepicker/css/jquery-ui.css">
</head>
<style>

	body {
	   margin: 0 auto; /* 바디 마진을 0으로 하고 가로 가운데 정렬 */
	   background-color: #fff;
	}
	
	div >.page-content{
		width: 800px;
		background-color: #fff;
		margin: 110px auto;
		align-items: center;
	}
	  
	#profileTable.th, th {
	    background-color: transparent;
	    border-radius: 0;
	}
	
	#profileTable.th, td, th {
	    background-color: #fff;
	    text-align: center;
	    padding: 15px;
	    border-spacing: 10px;
	    border-bottom: 2px solid #fff;
	}
	  
	.resPage {
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
	}
	  

	/*달력속성 변경*/
	.hasDatepicker {
		display: inline-block;
		padding: .2em .2em 0;
	}
    
	/*readonly 백그라운드 색상 설정*/ 
	.memberInfo > input:read-only {
    	background-color: #ededed;
	}
    
	.infoForm {
		background-color: #FFF1E0;
		border-radius: 23px;
		padding-bottom: 50px;
		position: relative;
		z-index: 1;
		width: 97%;
		margin: 0 auto;
		height: 270px;
	}
  
	.resInfo {
		padding-bottom: 40px;
  		box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	  	border-radius: 23px;
	  	width: 100%;
	  	height: 600px;
     	margin: 0 auto;
     	position: relative;
      	z-index: 2;
	   	bottom: 50px;
	   	background-color: #fff;
	}
    
	.memberInfo > h3, .fiex > h3{
	   margin-bottom: 10px;
	   margin-top: 10px;
	}
    
	.pensionInfo input {
	    margin-left: 10px;
	    font-size: 20px;
	    border : none;
	    outline: none;
	    display: inline-block;
	    background-color: transparent;
	    position: relative;
	    top: 18px;
	}
    
    #pname {
    	font-weight: bold;
	}
    
	.pImg {
	    border: 1px solid black;
	    width:200px;
	    height:200px;
	    display:inline-block;
	    float:left;
	    margin: 10px;
	    border-radius: 23px;
	}
    
	.memberInfo {
	    display: inline-block;
	    margin-left: 10px;
	    font-size: 16px;
	    padding-bottom: 10px;
	    position: relative;
	    right: 65px;
	}
    
	.memberInfo > input {
	    margin: 3px;
	    border: 1px solid #ffc48c;
	    border-radius: 15px;
	    padding: 6px;
	    font-size: 15px;
	}
    
	#user_id {
		position: relative;
		left: 42px;
	}
    
    #user_email {
	    position: relative;
	    left: 26px;
    }
    
    #user_tel {
	    position: relative;
	    left: 14px;
    }
    
    #Resbtn {
	    position: relative;
	    top: 376px;
	    left: -15px;
    }
    
    .resvation {
	    position: relative;
	    bottom: 60px;
	    left: 9px;
    }
    
    .resvation > input {
	    border: none;
	    outline: none;
    }
    
    .checkIn, .checkOut{
	    display: inline-block;
	    position: relative;
	    top: 340px;
    }
    
    .checkOut {
	    position: relative;
	    left: 50px;
    }
    

    #date1, #date2 {
	    border: none;
	    outline: none;
	    padding-top: 20px;
	    border-bottom: 1px solid #FFC48C;;
	    width: 200px;
	    float: left;
	    margin-bottom: 20px;
    }
    
    .paycnt, #pay {
	    width: 250px;
	    display: inline-block;
	    position: relative;
	    padding: 10px;
	    bottom: 115px;
	    left: 335px;
    }
    
    .payinfo {
		display: inline-block;
	    bottom: 128px;
	    position: relative;
	    left: 260px;
    }
    
    .paycnt > input,.payinfo > input{
	    border: none;
	    outline: none;
		background-color: transparent;
    }
    
    .payinfo > input, .payinfo > small {
    	color: grey;
    }
    
    .paycnt > p, #pay {
    	font-size: 20px;
    	font-weight: bold;
    }
    
    button {
	    display: inline-block;
	    background-color: #fff; 
	    padding: 5px;
	    border: 1px solid #FFC48C;
	    border-radius: 5px;
	    width: 70px;
	    font-weight: bold;
	    margin-left: 10px;
    }
    
    .btn {
	    float: right;
	    display: inline-block;
	    position: relative;
	    bottom: 145px;
	    right: 27px;
	    z-index: 3;
    }
    
    .btn > #payment {
	    background-color: #FFC48C;
	    color:#fff;
	    width: 100px;
	    height: 40px;
    }
    
	.btn > #goback {
	    width: 100px;
	    height: 40px;
	    border-color: #cbcbcb;
	    color: #cbcbcb;
    }
    
    #direct {
	    float: left;
	    position: relative;
		top: 10px;
	    left: 120px;
	}
    	
	.payInfo > p {
		font-size: 20px;
	    font-weight: bold;
	}
	
	#pay {
		font-size: 35px;
	    font-weight: bold;
	    border: none;
	    outline: none;
	    position: relative;
	    top: -10px;
	    left: -5px;
	    background-color: transparent;
	}
	
	.card-img-top {
		height: 200px;
	    width: 300px;
	    border-radius: 5px;
	    margin: 10px;
	    display: inline-block;
	    float: left;
	}
	
	.footer p {
		color: black;
	}
	
	.footer p a {
		color : #ffc48c;
	}
	
	
    
</style>
<body>
 <!-- 헤더 시작 -->
	<%@include file="../main/header.jsp" %>
<!-- 헤더 끝 -->

  <div class="container">
    <div class="row">
      <div class="col-lg-12">
      	<div class="page-content">
      	<!-- 예약하기 -->
			<div class="pension" style="display:inline-block; width:800px;">
			<div class="resPage">
			<!-- 서브밋 폼 -->
			<form class="resForm" onsubmit="return false" action="resAction">
				<div class="infoForm">
				<!-- 숙소 정보 -->
					<div class='pensionInfo'>
	   					<img src="/peco/display?fileName=${pImg}" class="card-img-top" alt="펜션이미지">
						   <c:forEach var="p" items="${pList}">
							   <input type="text" value="${p.pname}" id="pname"><br>
							   <input type="hidden" value="${p.p_id}" id="p_id">
							   <input type="text" value= "${p.roomname}" id="roomname">
					</div>
		 			<!-- 숙소 정보 끝 -->
				</div>
      	
      			<!-- 날짜정보 -->
      	 		<div class="resInfo">
      	
      	
      			<div class="resvation" style="text-align: center;">
      			<!-- 입퇴실날짜 -->
         			<div class="checkIn" style="width: 250px;">
		         		<b style="float: left;">체크인</b><br>
		         		<input type="text" id="date1" readonly>
		         	</div>
		         	<div class="checkOut" style="width: 250px;">
		         		<b style="float: left;">체크아웃</b><br>
		         		<input type="text" id="date2" readonly>
		         	</div>
         			<button id="Resbtn">선택</button><br>
	         	<!-- 달력 -->
	         	<div class="datepicker1" style="width: 300px; height: 280px;"></div>
	          	<div class="datepicker2" style="width: 300px; height: 280px;"></div>
	           	<br>
        		<!-- 날짜정보 끝 -->
      			</div>
      	
   		
		   	<div class="memberInfo">
   			<h3 style="position: relative;">예약자 정보 </h3>
   			<!-- 예약자 정보 -->
			   		<input type="hidden" value="${sessionScope.member.m_id }" id="m_id">
			         이름      <input type="text" value="${sessionScope.member.mname }" id="user_id" readonly><br>
			         이메일   <input type="text" value="${sessionScope.member.email }" id="user_email" readonly><br>
			         전화번호<input type="text" value="${sessionScope.member.mphone }" id="user_tel" readonly>
		   </div>
		   
		   <button id="direct">직접입력</button><br>  
		   <!-- 예약자 정보 끝 -->
		   
		   
      	<!-- 결제금액 -->
      	<div class="paycnt">
	      	<p>총 결제금액</p>
	        <input type="text" id="pay" readonly>
        </div>
        <!-- 결제금액 끝 -->
        
        <!-- 결제정보 -->
        <div class="payinfo">
	    	<small>1박당/</small><input type="text" value="${p.price}" id="price" readonly><br>
	        <input type="text" id="period" readonly>
	    <!-- 결제정보 끝 -->
        </div>
      					</c:forEach> <%--pList forEach --%>
		
		</div><br>
		
		<!-- 결제버튼 -->
	   <div class="btn">
		   <button id="payment">결제</button>
		   <button id="goback" onclick="history.back()">뒤로가기</button>
	   </div>
	   <!-- 결제버튼 끝 -->
			</form>
			<!-- 폼 끝 -->
		</div>
		<!-- 예약 끝 -->
	
		<!-- 비활성화 날짜 계산 -->
	   <c:forEach var="dis" items="${disabledate}">
		   <input type="hidden" value="${dis.startdate}" name="startDate">
		   <input type="hidden" value="${dis.enddate}" name="endDate">
	   </c:forEach>
			
			</div>
			</div>
        </div>
	</div>
</div>

<footer>
	<div class="footer">
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright © 2036 <a href="#">Petconomy</a> Company. All rights reserved. 
				<br>Design: <a href="https://templatemo.com" target="_blank" title="free CSS templates">TemplateMo</a>  Distributed By <a href="https://themewagon.com" target="_blank" >ThemeWagon</a></p>
			</div>
		</div>
	</div>
</footer>

<!-- Scripts -->
  
<script>
let disDays = []; //비활성화 할 날짜 배열
let listDate = []; //시작날짜와 끝날짜 사이의 배열
            
$(function() {
	//예약된 날짜 가져오기
    inputDisDays();

    $(".datepicker1").datepicker({ //체크인 날짜 달력
   		showOtherMonths: true
		,showMonthAfterYear:true
		,selectOtherMonths: true 
        ,buttonText: "선택"        
        ,yearSuffix: "년"
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,dayNamesMin: ['일','월','화','수','목','금','토']
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
        ,minDate: "0"
        ,maxDate: "+1y"
        ,dateFormat: 'yy-mm-dd',
        onSelect: function(date1) { //달력이 선택된 경우 date1에 출력
        	$('#date1').val(date1);
        }
        ,beforeShowDay: function(date) { //비활성화 설정
			var dateString = $.datepicker.formatDate('yy-mm-dd', date);
			if(disDays.indexOf(dateString) != -1) {
				return [false];
	        } else {
				return [true];
	        }
        }
    });       
            

	$(".datepicker2").datepicker({ //체크아웃 날짜 달력
		showOtherMonths: true
        ,showMonthAfterYear:true
        ,selectOtherMonths: true
        ,buttonText: "선택"
        ,yearSuffix: "년"
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
        ,dayNamesMin: ['일','월','화','수','목','금','토']
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
        ,minDate: "+1D"
        ,maxDate: "+1y" 
        ,dateFormat: 'yy-mm-dd',
        onSelect: function(date2) { //달력이 선택된 경우 date1에 출력
        	$('#date2').val(date2);
        }
        ,beforeShowDay: function(date) { //비활성화 설정
			var dateString = $.datepicker.formatDate('yy-mm-dd', date);
            if(disDays.indexOf(dateString) != -1) {
                return [false];
            } else {
                return [true];
            }
        } 
	}); 

            
Resbtn.addEventListener('click', function() { //선택 버튼 눌렀을 때 
	listDate = []; //시작날짜와 끝날짜 넣을 배열
	let sDay = document.querySelector('#date1').value; //체크인날짜
	let eDay = document.querySelector('#date2').value; //체크아웃날짜
	//console.log('s'+sDay,length);
	//console.log('e'+eDay);

	if(!sDay.length || !eDay.length) { //만약 input 값이 비었다면
		alert('날짜를 선택해주세요');
	} else {
		//yy-mm-dd로 받은 값을 -를 구분자로 하여 Date 배열로 반환
		var startday = sDay.split('-');
		var endday = eDay.split('-');
		var sArr = new Date(startday[0], startday[1]-1, startday[2]);
		var eArr = new Date(endday[0], endday[1]-1, endday[2]);
		// console.log(sArr);
		// console.log(eArr);

		getDateRange(sDay, eDay, listDate); //체크인날짜와 체크아웃 사이의 날짜를 배열로 반환
		console.log('l '+listDate);
		console.log('d '+disDays)

		//예약날짜에 예약불가일자가 포함된 경우 알림처리
		for(var i=0; i<listDate.length; i++) {
			for(var j=0; j<disDays.length; j++) {
				if(listDate[i]===disDays[j]) {
					alert('예약불가 일자가 포함되었습니다\n'+listDate[i]+'일은 예약할 수 없습니다');
		            // console.log('l '+ listDate[i]);
		            // console.log('d '+ disDays[j]);
		            return false;
		        } 
		    }
		}
                    
	if(eArr.getTime() <= sArr.getTime()) { //만약 체크인날짜와 체크아웃 날짜가 같을 경우
    	alert('하루이상 선택해주세요');
	} else { //날짜 사이의 시간 계산
    	const diffDate = eArr.getTime() - sArr.getTime();
    	diffday = Math.abs(diffDate / (1000 * 60 * 60 * 24));
    	//console.log(Math.abs(diffDate / (1000 * 60 * 60 * 24)));

	if(diffday > 0) {
        alert('선택되었습니다');
        $('#period').val(diffday+'박'+(diffday+1)+'일');
       
    //총 결제금액 구하기(기간+1)+1박당 가격
    console.log($('#price').val());
    let priceCnt = $('#price').val()*diffday;
    //console.log(priceCnt);
    $('#pay').val(priceCnt);
                        

    	}
    }

    }
}) //선택버튼 끝


//예약자정보 직접입력 전환 기본값:readonly(disable로 설정 시 서브밋할때 안넘어감)
direct.addEventListener('click', function() {
   $('#user_id').attr('readonly',false);
   $('#user_email').attr('readonly',false);
   $('#user_tel').attr('readonly',false);
   //console.log('aaa');
})
                    
         
$('#payment').click(function () { //결제버튼
	var date1 = document.querySelector('#date1').value;
    var date2 = document.querySelector('#date2').value;
    var pay = document.querySelector('#pay').value;
	
		if(!date1.length || !date2.length) { //체크인 체크아웃 날짜가 비어있지 않은 경우
			alert('날짜를 선택해주세요');
		} else if(!pay) {
			alert('선택버튼을 눌러주세요');	
		} else {
			var IMP = window.IMP;
			IMP.init('imp07586387');
                     
             //DOM객체들에서 사용할 데이터 뽑기
             var p_id = $('#p_id').val();
             var m_id = $('#m_id').val();
             var pname = $('#pname').val();
             var period = $('#period').val();
             var pay = $('#pay').val();
             var user_id = $('#user_id').val();
             var user_email = $('#user_email').val();
             var user_tel =  $('#user_tel').val();
             var startdate = $('#date1').val();
             var enddate = $('#date2').val();
             var roomname = $('#roomname').val();
             
             if(!user_id.length || !user_email.length || !user_tel.length) {
             	alert('예약자 정보를 입력해주세요');
             	return false;
             }

             IMP.request_pay({ //결제요청
                 //카카오페이 결제시 사용할 정보 입력
                 pg: 'kakaopay',
                 pay_method: "card",
                 name: pname,
                 amount: pay,
                 buyer_email: user_email,
                 buyer_name: user_id,
                 buyer_tel: user_tel,
             }, function (rsp) { //결제가 된 경우          
				console.log(rsp);
         		// 결제검증
       			$.ajax({
       	        	type : "POST",
       	        	url : "/payment/verifyIamport/" + rsp.imp_uid 
       	        }).done(function(data) {
					console.log(data);
      	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
						if(rsp.paid_amount == data.response.amount){
							var msg = "결제 및 결제검증완료";
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\n결제 금액 : ' + rsp.paid_amount+'원';
							
								if(rsp.apply_num === null || rsp.apply_num === undefined || rsp.apply_num === '') {
                               	rsp.apply_num = '카카오페이머니';
                               	}
							msg += '\n카드 승인번호 : ' + rsp.apply_num;                                    	
              		        	
							$.ajax({ //db에 결제정보 삽입
	                            url: "/peco/insert",
	                            type: 'post',
		                            data: {
		                            p_id: p_id, //펜션아이디   
		                            period: period, //기간
		                            pricecnt: pay, //결제할 가격
		                            startdate : startdate, //입실일
		                            enddate : enddate, //퇴실일
		                            pr_name: user_id, //예약자명
		                            pr_email: user_email, //예약자 이메일
		                            pr_tel: user_tel, //예약자 전화번호
		                            imp_uid: rsp.imp_uid, //거래고유번호
		                            pr_id: rsp.merchant_uid, //주문고유번호=펜션예약번호
									pr_pay: rsp.apply_num, //카드승인번호
									m_id : m_id, //회원번호 -예약자명 직접입력 경우 다를 경우
									pname : pname, //펜션명
									roomname : roomname,//객실명
                                   }                               
                                 });
							 //정상적으로 결제 진행된 경우 토큰 생성(환불 시 사용)
                             console.log('토큰생성'); 
                             	$.ajax({
                               		type : "POST",
                      	        	url : "/payment/complete"
                               	})
                              console.log('토큰생성완료');
                               
                              $('#resForm').submit(); 
                      			alert(msg);
                  				console.log(m_id);
                      			window.location.replace("../profile?m_id=${member.m_id}"); //마이페이지 예약내역으로 이동
           	        	} else { //결제검증에 실패한 경우
              	       		var msg = '결제에 실패하였습니다.';
                       		msg += '에러내용 : ' + rsp.error_msg;
                      		alert(msg);
              	       	}     		
              	      });
                });  
         } 
              	
}); //결제버튼 끝

});
        
//시작 날짜와 끝 날짜 사이의 날짜 배열 생성
let getDateRange = function(startDate, endDate, listDate) {
	var dateMove = new Date(startDate);
	var strDate = startDate;

    if (startDate == endDate) {
        var strDate = dateMove.toISOString().slice(0,10);
        listDate.push(strDate);
    } else {
        while (strDate < endDate)  {
            var strDate = dateMove.toISOString().slice(0, 10);
            listDate.push(strDate);
            dateMove.setDate(dateMove.getDate() + 1);
        }
    }
    return listDate;
};
        
     
//테이블에서 예약된 날짜 선택불가처리
let inputDisDays = function() { 
   	
	let startArr = []; //시작날짜 배열
   	let endArr = []; //끝날짜 배열

    $("input[name=startDate]").each(function(index, item){ //시작날짜 배열 만들기
    	var startDate = $(item).val(); 	
    	startArr.push(startDate);
    });

   	$("input[name=endDate]").each(function(index, item){ //끝날짜 배열 만들기
   		var	endDate = $(item).val();  	
   		endArr.push(endDate);
    });

	
	//console.log('s'+startArr);
	//console.log('e'+endArr);
	
	for(i=0; i<startArr.length; i++) { //시작날짜와 끝날짜 배열을 받아서 사이의 날짜를 listDate에 반환
		getDateRange(startArr[i], endArr[i], listDate);
	}
	
	for(i=0; i<listDate.length; i++) { //listDate의 값을 선택불가날짜 배열에 삽입
		var dis = listDate[i];
		disDays.push(dis);	
		//console.log(dis);
	}
	//console.log(disDays);
}
</script>
  
  
  <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"></script>

  <script src="/resources/assets/js/isotope.min.js"></script>
  <script src="/resources/assets/js/owl-carousel.js"></script>
  <script src="/resources/assets/js/tabs.js"></script>
  <script src="/resources/assets/js/popup.js"></script>
  <script src="/resources/assets/js/custom.js"></script>


 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
  </body>

</html>