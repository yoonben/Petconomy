<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<title>병원예약</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	

    <!-- Bootstrap core CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/templatemo-cyborg-gaming.css">
    <link rel="stylesheet" href="/resources/assets/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/assets/css/owl.css">
    <link rel="stylesheet" href="/resources/assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

	<link rel="stylesheet" href="/resources/datepicker/css/jquery-ui.css">
</head>
<style>
	body{
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
	  
	/*달력속성 변경*/
	.hasDatepicker {
		display: inline-block;
	    padding: .2em .2em 0;
	}
    
	/*readonly 백그라운드 색상 설정*/ 
    .memberInfo > input:read-only {
    	background-color: #ededed;
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
    }
    
    #pname {
    	font-weight: bold;
    }
    
    .memberInfo {
	    display: inline-block;
	    margin-left: 10px;
	    font-size: 16px;
	    padding-bottom: 10px;
	    position: relative;
		top: 5px;
		left: 165px;
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
	    bottom: 30px;
	    left: 156px;
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
		bottom: 160px;
	    right: 157px;
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
    
    .btn > #goback:hover {
	    background-color: #cbcbcb;
	    color: #fff;
    }
	
	.resvation {
		height: 280px;
		margin: 0;
		padding: 0;
	}
	
	.datepicker {
		width: 300px;
		position: relative;
		left: 30px;
		top: 30px;
		float: left;
	}
	
	.timepicker {
		width: 450px;
		margin: 5px;
		position: relative;
		top: 35px;
		left: 15px;
		float: left;
	
	}
	
	.timepicker > input {
	    width: 80px;
	    padding: 10px;
	    background-color: #fff;
	    margin: 5px;
	    border: 1px solid #FFC48C;
	    border-radius: 5px;
	}
	
	.timepicker > input:disabled {
		border-color: lightgray;
	    background-color: #ededed;
	}
	
	.timepicker > input:focus, timepicker > input:hover  {
		background-color: #FFC48C;
		color: #fff; 
	}
	
	.fiex{
		position: relative;
	    top: 28px;
	    left: 65px;
	    display: inline-block;
	}
	
	
	#date, #time {
		border: none;
	    outline: none;
	    border-bottom: 1px solid #FFC48C;
	}
	
	.payInfo {
		position: relative;
	    left: 40px;
	    top: 15px;
	}
	
	.payInfo > p {
		font-size: 20px;
	    font-weight: bold;
	    position: relative;
	    left: 30px;
	}
	
	#pay {
		font-size: 35px;
	    font-weight: bold;
	    border: none;
	    outline: none;
	    position: relative;
	    left: 30px;
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
			<form class="resForm" onsubmit="return false">
				<div class="infoForm">
					<!-- 숙소 정보 -->
					<div class='pensionInfo'>
   						<img src="/peco/display?fileName=${hImg}" class="card-img-top" alt="병원이미지">
							<c:forEach var="h" items="${hList}">
							  <input type="hidden" value="${h.h_id}" id="h_id"><br>
							  <input type="text" value="${h.pname}" id="pname" style=""><br>
							  <div class="openhour"></div>
							  <input type="hidden" value="${h.openhour}" id="openhour"><br>
     						</c:forEach>
				  	</div>
				  	<!-- 숙소 정보 끝 -->
				</div>
      
      			<div class="resInfo">
      				<!-- 예약정보 -->
      				<!-- 입력 -->
   					<div class="resvation">
			         	<!-- 날짜선택폼 -->
			         	<div class="datepicker" style="display: inline-block;"></div>
           	
			           	<!-- 시간선택폼 *동적button생성 -->
			           	<div class="timepicker"></div>
   					</div>
      	
		         	<!-- 출력 -->
		         	<div class="fiex">
		         	<h3>예약정보</h3>
			         	<div id="datepick">
			         		<b style="float: left; font-size: 15px">날짜</b><br>
			         		<input type="text" id="date" readonly>
			         	</div>
			         	<div id="timepick">
			       			<b style="float: left; font-size: 15px">시간</b><br>
			       			<input type="text" id="time" readonly>
			         	</div>
         				<button id="Resbtn">선택</button><br>
         			</div>
         	
			         <!-- 예약자 정보 -->
					 <div class="memberInfo">
			   		 <h3>예약자 정보 </h3>
					   		<input type="hidden" value="${sessionScope.member.m_id }" id="m_id">
					         이름      <input type="text" value="${sessionScope.member.mname }" id="user_id" readonly><br>
					         이메일   <input type="text" value="${sessionScope.member.email }" id="user_email" readonly><br>
					         전화번호<input type="text" value="${sessionScope.member.mphone }" id="user_tel" readonly>
					    <button id="direct">직접입력</button><br>
		    
		  			 </div>
		   			<!-- 예약자 정보 끝 -->

      	
			      	<!-- 결제금액 -->
			      	<div class="payInfo">
				      	<p>총 결제금액</p>
				        <input type="text" id="pay" readonly>
			      	</div>
			        <!-- 결제금액 끝 -->

		
				</div>
				<br>
				<!-- 결제버튼 -->
			   <div class="btn">
				   <button id="payment">결제</button>
				   <button id="goback" onclick="history.back()">뒤로가기</button>
			   </div>
	   		   <!-- 결제버튼 끝 -->
			</form>
			<!-- 폼 끝 -->
	  		</div>
			</div>
			<!-- 예약 끝 -->
	
			<!-- 비활성화 날짜 계산 -->
			 <c:forEach var="dis" items="${disabledate}">
			 	<input type="hidden" value="${dis.hr_date}" name="hrDate">
			 	<input type="hidden" value="${dis.hr_time}" name="hrTime">
			 </c:forEach>
			
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
		  
<script>

//로그인 여부
function checkLogin() {
	
	var m_id = $('#m_id').val();
	
	if(m_id === '') { //세션변수에 값이 없으면
		alert('로그인 후 예약가능합니다');
		window.location.replace("./login");
	}
	
}

  let create2dArr = function() { //선택불가날짜 배열 만들기
	  
	  let disdateArr = []; //선택불가날짜 받을 배열
	  let distimeArr = []; //선택불가시간 받을 배열
	  
	  let count = 0;
	  
	  //선택불가날짜 배열에 값 삽입하고 배열 길이 설정
	  $("input[name=hrDate]").each(function(index, item){
      	var hrDate = $(item).val(); //값 가져오기
      	disdateArr.push(hrDate); //배열에 값 삽입
      	count += 1; 
      });
	  
	  //선택불가시간 배열에 값 삽입하고 배열 길이 설정
	  $("input[name=hrTime]").each(function(index, item){
      	var hrTime = $(item).val(); //값 가져오기
      	distimeArr.push(hrTime); //배열에 값 삽입
      });
		
      	//console.log(disdateArr);
      	//console.log(distimeArr);

	  //배열 선언1
	  let arr = [];
	  
	  //배열에 [날짜, 시간] 값 삽입
	 for(let i=0; i<count; i++) { //3
		arr.push([disdateArr[i],distimeArr[i]]);
	 }
	  //console.log('a'+arr);
	  
	  //배열 선언2
	  let dtArr = [];
	  
	 for(let i=0; i<disdateArr.length; i++) { //위 배열의 값을 밑의 배열에 삽입
				dtArr.push(arr[i]);
	}
	 //console.log(dtArr);
	  
	 return dtArr;
  }
  
	//날짜마다의 선택불가 시간 가져오기
	let getdisDate = function() {
		let disable = create2dArr();
		let date = document.querySelector('#date').value; //화면에서 선택된 값
	
		let distime = []; //비활성화할 시간
		
		//선택된 날짜에 예약된 시간이 있는지 체크
		for(var i=0; i<disable.length; i++) {
			//console.log(disable[i][0]);
			//console.log('d'+date);
			
			if(disable[i][0] === date) {
				distime.push(disable[i][1]);
			}
		}
		//console.log(distime);
		
		return distime;
		
	}

	//선택불가 시간
	let checkDisable = function() {
		
		$(".timepicker").empty();//동적으로 만들어진 button 초기화
		
		let time = openHour();  
		let dis = getdisDate();
	
		//console.log(dis.length);
		//console.log(time.length);
		var myClass = "time";
		
		if(dis.length === 0) { //예약불가시간이 없을 경우 운영시간만큼의 button 생성
			
			for(let i=0; i<time.length; i++) {
				var div = $("<input type='button' value='" + time[i] + "'></input>").addClass(myClass);
	            $(".timepicker").append(div);
			}
			
		} else {
			
			
			for (let j = 0; j < time.length; j++) {
			    let isDuplicate = false;
			    
			    for (let i = 0; i < dis.length; i++) { //운영시간에 예약불가시간이 있을 경우  true 반환
			        if (dis[i] === time[j]) {
			            isDuplicate = true;
			            break;
			        }
			    }
	
			    if (isDuplicate) { //isDuplicate이 ture이면
			    	
			        //console.log('dis[i]' + time[j]);
			        //console.log('time[j]' + time[j]);
	
			        if (!$(".timepicker").find("input[value='" + time[j] + "']").length) { //비활성화 버튼 생성
			            var div = $("<input type='button' disabled='disabled' value='" + time[j] + "'></input>").addClass(myClass);
			            $(".timepicker").append(div);
			        }
			    } else {
			        if (!$(".timepicker").find("input[value='" + time[j] + "']").length) { //isDuplicate가 false이면 버튼 생성
			            var div = $("<input type='button' value='" + time[j] + "'></input>").addClass(myClass);
			            $(".timepicker").append(div);
			        }
			    }
			}
			
		}
					
	}


	//운영시간 가져오기
	function openHour() {
		
		//전체시간 배열
		let time = ['00:00','01:00','02:00','03:00','04:00'
					,'05:00','06:00','07:00','08:00','09:00'
					,'10:00','11:00','12:00','13:00','14:00'
					,'15:00','16:00','17:00','18:00','19:00'
					,'20:00','21:00','22:00','23:00','24:00']
		
		//console.log(time);
		
		let openhour = nullhour();
		
		//console.log(openhour);
		
		//인덱스를 이용해 운영시간 구하기
		var split = openhour.indexOf(':');
		//console.log(split);
		
		let open = openhour.substr((split)-2, 5);
		//console.log(open);
		
		let close = openhour.substr((split)+4, 5);
		//console.log(close);
		
		//오픈시간이 30분단위일 경우 반올림
		if(open.search("30")>0) {
			split = open.indexOf(':');
			var hh = parseInt(open.substr(0,2));
			var mm = '00';
	
			hh += 1;
			
			var H = hh.toString();
			
			open = H+':'+mm;
			//console.log(open);
			
		}
	
		//마감시간이 30분단위일 경우 반내림
		if(close.search("30")>0) {
			split = close.indexOf(':');
			var hh = close.substr(0,2);
			var mm = '00';
			
			close = hh+':'+mm;
			//console.log(close);
			
		}
	
		
		//운영시간에 맞춰 배열 자름
		time = time.slice(time.indexOf(open), time.indexOf(close)+1);
		
		//console.log(time);
		
		return time;	
	}
	
	//운영시간이 정보없음일 경우 처리 && 운영시간 화면출력
	function nullhour() {
		
		let openhour = document.querySelector('#openhour').value;
		
		if(openhour === '정보없음') { //정보없음 처리
			openhour = "09:00~20:00";
            var div = $("<input type='text'value='" + openhour + "'></input>");
            $(".openhour").append(div);
		} else {
			let timearr = openhour.split(", "); //운영시간 여러줄 출력
			for(i=0; i<timearr.length; i++) {
				console.log(timearr[i]);
	            var div = $("<input type='text'value='" + timearr[i] + "'></input>");
	            $(".openhour").append(div);
			}
		}
		
		
		return openhour;
	} 
	
	
	$(function() {
		checkLogin(); //로그인여부
		checkDisable(); //시간버튼 출력
		
		$(".datepicker").datepicker({ //달력 출력
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
            ,dateFormat: 'yy-mm-dd'
            ,onSelect: function(date) {	
				$('#time').val('');
				$('#date').val(date);
				checkDisable();  //예약불가시간 처리
             }
        }); 
		
		
		
		
	});

       
       Resbtn.addEventListener('click', function() { //선택 버튼 눌렀을 때 
    	   let date = document.querySelector('#date').value;
           let time = document.querySelector('#time').value;
           //console.log(date);
           //console.log(time);
           
           if(!date.length || !time.length) { //만약에 input 값이 비었다면
       		alert('날짜/시간을 선택해주세요');
        	} else {
        		alert('선택되었습니다');
        		$('#pay').val(10000);
        	}
           
        }) //resbtn event
        
        
       //선택 버튼 값 가져와서 박스에 출력
        $(document).on("click",".time",function(){
        	var idx = $('.time').index(this);
        	var idxVal = $('.time').eq(idx).val();
            console.log(idxVal);
            $('#time').val(idxVal);
        })


        //예약자정보 직접입력 전환 기본값:readonly(disable로 설정 시 서브밋할때 안넘어감)
        direct.addEventListener('click', function() {
           $('#user_id').attr('readonly',false);
           $('#user_email').attr('readonly',false);
           $('#user_tel').attr('readonly',false);
        })
               
    
        $('#payment').click(function () { //결제버튼
        	var date = document.querySelector('#date').value;
            var time = document.querySelector('#time').value;
            var pay = document.querySelector('#pay').value;
        	
         	if(!date.length || !time.length) { //날짜랑 시간이 비어있는 경우
         		alert('날짜를 선택해주세요');
         	} else if(!pay) {
         		alert('선택버튼을 눌러주세요');	
         	} else {
          	   var IMP = window.IMP;
               IMP.init('imp07586387');
               
                //DOM객체들에서 사용할 데이터 뽑기
                var h_id = $('#h_id').val();
                var m_id = $('#m_id').val();
                var hname = $('#pname').val();
                var user_id = $('#user_id').val();
                var user_email = $('#user_email').val();
                var user_tel =  $('#user_tel').val();
                
                if(!user_id.length || !user_email.length || !user_tel.length) {
                	alert('예약자 정보를 입력해주세요');
                	return false;
                }
               	
                IMP.request_pay({
                     //카카오페이 결제시 사용할 정보 입력
                    pg: 'kakaopay',
                    pay_method: "card",
                    name: hname,
                    amount: pay,
                    buyer_email: user_email,
                    buyer_name: user_id,
                    buyer_tel: user_tel,
                }, function (rsp) {
                     
             	   console.log(rsp);
        			// 결제검증
        			$.ajax({
        	        	type : "POST",
        	        	url : "/payment/verifyIamport/" + rsp.imp_uid 
        	        }).done(function(data) {
        	        	
        	        	console.log(data);
        	        	
        	        	console.log(rsp.paid_amount);
        	        	console.log(data.response.amount);
        	        	// 결제 유효성 검증
        	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
        	        	if(rsp.paid_amount == data.response.amount){
        	        		
	       	        		console.log('aaaa');
	       	        		var msg = "결제 및 결제검증완료";
	       		        	msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\n결제 금액 : ' + rsp.paid_amount+'원';
                         
                         if(rsp.apply_num === null || rsp.apply_num === undefined || rsp.apply_num === '') {
                         	rsp.apply_num = '카카오페이머니';
                         }
                         	msg += '\n카드 승인번호 : ' + rsp.apply_num;                                    	

                         $.ajax({
                             url: "/peco/createHospital",
                             type: 'post',
                             data: {
                                h_id: h_id,//병원아이디         
                                pricecnt: pay,//결제할 가격
                                hr_name: user_id,//예약자명
                                hr_email: user_email,//예약자 이메일
                                hr_tel: user_tel,//예약자 전화번호
                                imp_uid: rsp.imp_uid, //거래고유번호
                                hr_id: rsp.merchant_uid, //주문고유번호=펜션예약번호
						 	    hr_pay: rsp.apply_num, //카드승인번호
						 	    m_id : m_id,//회원번호 -예약자명 직접입력 경우 다를 경우
						 	  	hname : hname, //병원명
						 	  	hr_time : time, //예약시간
						 	 	hr_date : date, //예약날짜
                             }                               
                           });
                          console.log('토큰생성');
                          $.ajax({
                          	type : "POST",
                 	        	url : "/payment/complete"
                          })
                          console.log('토큰생성완료');
                          
                          $('#resForm').submit(); 
                 			alert(msg);
                 			window.location.replace("./profile?m_id="+m_id);
        	        	} else {
        	        		var msg = '결제에 실패하였습니다.';
                         msg += '에러내용 : ' + rsp.error_msg;
                			alert(msg);
        	        	}     		
        	        });
                });  
         	} 
        	
        	}); //payment function
          
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