<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<title>예약</title>
	
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
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

</head>
<style>
	body{
	   margin: 0 auto; /* 바디 마진을 0으로 하고 가로 가운데 정렬 */
	   background-color: #ffec90;
	  }
	
	  div >.page-content{
	  width: 800px;
	  background-color: #fff;
	  margin: 110px auto;
	  align-items: center;
	  }
	  
	  .resPage {
	  width: 80%;
	  margin: 0 auto;
	  margin-top: 20px;
	  }
	  

    /*달력속성 변경*/
    .hasDatepicker {
        display: inline-block;
    }
    
    /*readonly 백그라운드 색상 설정*/ 
    .memberInfo > input:read-only {
    background-color: #ededed;
    }
    
    .pensionInfo input {
    margin-left: 10px;
    font-size: 20px;
    border : none;
    outline: none;
    display: inline-block;
    }
    
    #pname {
    font-weight: bold;
    }
    
    .memberInfo {
    display: inline-block;
    margin-left: 10px;
    font-size: 16px;
    padding-bottom: 10px;
    }
    
    .memberInfo > input {
    margin-left: 10px;
    margin-bottom: 3px;
    border-radius: 10px;
    padding: 3px;
    font-size: 14px;
    }
    
    .paycnt, .payinfo, #pay {
    width: 250px;
    display: inline-block;
    float: left;
    padding: 10px;
    }
    
    .paycnt > input,.payinfo > input{
    border: none;
    outline: none;
    }
    
    .payinfo > input, .payinfo > small {
    color: grey;
    }
    
    .paycnt > p, #pay {
    font-size: 20px;
    font-weight: bold;
    }
    
    #Resbtn {
    position: relative;
    top: 30px;
    right: 40px;
    }
    
    button {
    display: inline-block;
    background-color: #fff; 
    padding: 5px;
    border: 2px solid #ffec90;
    border-radius: 5px;
    width: 70px;
    color: #ffdd3a;
    font-weight: bold;
    margin-left: 10px;
    }
    
    #Resbtn:hover, #direct:hover {
    background-color: #ffdd3a;
    color:#fff;
    }
    
    .btn {
    float: right;
    display: inline-block;
    position: relative;
    bottom: 50px;
    }
    
    .btn > #payment {
    background-color: #ffdd3a;
    color:#fff;
    width: 100px;
    height: 40px;
    }
    
    .btn > #payment:hover {
    border-color:  #ffdd3a;
    background-color: #f7cd00;
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
    
    .xdsoft_datetimepicker.xdsoft_inline{
	border: none;
	}
	
	.xdsoft_datetimepicker .xdsoft_timepicker {
	width: 100px !important;
	}
	
	.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box>div>div {
    height: 35px !important;
    line-height: 35px !important;
	}
	
	.resvation {
	position: relative;
	top: 5px;
	left: 10px;
	padding: 5px;
	border: 1px solid #c5c5c5;
	}
	
	.ui-widget.ui-widget-content {
    border: 1px solid #ffffff !important;
	}

    
    
</style>
<body>
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="index.html" class="logo">
                        <img src="/resources/images/logo.png" alt="">
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
                        <li><a href="browse.html">Browse</a></li>
                        <li><a href="details.html" class="active">Details</a></li>
                        <li><a href="streams.html">Streams</a></li>
                        <li><a href="profile.html">Profile <img src="/resources/images/profile-header.jpg" alt=""></a></li>
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
      	<!-- 예약하기 -->
		   <div class="pension" style="display:inline-block; width:800px;">
			<div class="resPage">
			<h2>예약하기</h2><br>
			<!-- 서브밋 폼 -->
			<form class="resForm" onsubmit="return false" action="resAction">
				<!-- 숙소 정보 -->
				<div class='pensionInfo'>
   					<div class="pImg" style="border: 1px solid black; width:200px; height:200px; display:inline-block; float:left;">펜션이미지</div>
						<c:forEach var="h" items="${hList}">
						  <input type="hidden" value="${h.h_id}" id="h_id"><br>
						  <input type="text" value="${h.pname}" id="pname"><br>
						  <input type="text" value="${h.addr}" id="addr"><br>
						  <input type="text" value="${h.openhour}" id="openhour"><br>
						  <input type="text" value="${h.parkyn}" id="parkyn"><br>
						  <input type="text" value="${h.homepage}" id="homepage"><br>
						  <input type="text" value="${h.phone}" id="phone"><br>
				  </div><hr>
				  <!-- 숙소 정보 끝 -->
   		<!-- 예약자 정보 -->
		   <div class="memberInfo">
   			<h3>예약자 정보 </h3>
		   	<c:forEach var="mem" items="${mList}">
		   		<input type="hidden" value= "${mem.m_id}" id="m_id">
			    이름<input type="text" value="${mem.mname }" id="user_id" readonly><br>
		   	 이메일<input type="text" value="${mem.email }" id="user_email" readonly><br>
		         전화번호<input type="text" value="${mem.mphone }" id="user_tel" readonly>
		    <button id="direct">직접입력</button><br>  
		   </div>
		   <!-- 예약자 정보 끝 -->
      <hr>
      	<!-- 날짜정보 -->
      	<div class="resvation">
         	
         	<!-- 폼 -->
         	<div class="datepicker" style="display: inline-block;"></div>
           	<div style="display: inline-block;"><input type="text" class="timepicker"></div>
         	
         	<!-- 출력 -->
         	<div id="datepick">
         		<b style="float: left;">날짜</b><br>
         		<input type="text" id="date" readonly>
         	</div>
         	<div id="timepick">
       		<b style="float: left;">시간</b><br>
       		<input type="text" id="time" readonly>
         	</div>

         	<button id="Resbtn">선택</button><br>

      	</div>
         <!-- 날짜정보 끝 -->
      	
      	<!-- 결제금액 -->
      	<div class="paycnt">
	      	<p>총 결제금액</p>
	        <input type="text" id="pay" readonly>
        </div>
        <!-- 결제금액 끝 -->
        </div>
      </c:forEach></c:forEach>
		
		<br>
		<!-- 결제버튼 -->
	   <div class="btn">
		   <button id="payment">결제</button>
		   <button id="goback" onclick="goback()">뒤로가기</button>
	   </div>
	   <!-- 결제버튼 끝 -->
	</form>
	<!-- 폼 끝 -->
	</div>
	<!-- 예약 끝 -->
	
	<!-- 비활성화 날짜 계산 -->
  <c:forEach var="dis" items="${disabledate}">
   date<input type="text" value="${dis.hr_date}" name="hr_date">
   time<input type="text" value="${dis.hr_time}" name="hr_time">
  </c:forEach>
			
			</div>
        </div>
      </div>
    </div>

		  
  <script>
  //db에서 운영시간 가져와서 max min 설정
  //예약된 date와 time값 선택 비활성화 -> 이차원배열?
  //time은 1개만 date는 예약가능한 시간이 없을 경우
  //css
  //로고
  
  //date값이 선택될때마다 time테이블 리로드
  //date-time의 값을 비활성화
  //date의 값을 가진 이차원배열에서 time값을 빼내 비활성화 없을경우 그냥 리로드
  //이차원 배열에서 date-time가 있는지 확인하는건 함수로 리턴이 true일 경우 배열값 빼내 비활성화 
  //가져올 수 있는 time 값이 없는 경우 date 비활성화
  
	$(function() {
		
		$(".datepicker").datepicker({ //달력1
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
             $('#date').val(date);
             }
        }); 
    
		$('.timepicker').datetimepicker({
			  datepicker:false,
			  format:'H:i',
			  minDate:'-1970/01/02',
			  maxDate:'+1970/01/02',
			  opened: true,
			  inline: true,
		    onSelectTime:function(time){

		    	 $('#time').val(getTime());
		    }
		});      
		
		//timepicker 시간 가져오기
		let getTime = function() {
		    var selectVal = $('.timepicker').datetimepicker('getValue');
		    var selectValstr = selectVal.toString();
		    var time = selectValstr.substr(16,5);
		    return time;
		}
		
	});

       
       Resbtn.addEventListener('click', function() { //선택 버튼 눌렀을 때 
    	   let date = document.querySelector('#date').value;
           let time = document.querySelector('#time').value;
           console.log(date);
           console.log(time);
           
           if(!date.length || !time.length) { //만약에 input 값이 비었다면
       		alert('날짜/시간을 선택해주세요');
        	} else {
        		alert('선택되었습니다');
        		$('#pay').val(10000);
        	}
           
           
           
        }) //resbtn event


               //예약자정보 직접입력 전환 기본값:readonly(disable로 설정 시 서브밋할때 안넘어감)
               direct.addEventListener('click', function() {
                  $('#user_id').attr('readonly',false);
                  $('#user_email').attr('readonly',false);
                  $('#user_tel').attr('readonly',false);
                  //console.log('aaa');
               })
               
    
               $('#payment').click(function () { //결제버튼
               	   var date = document.querySelector('#date').value;
                   var time = document.querySelector('#time').value;
                   var pay = document.querySelector('#pay').value;
               	
                	if(!date.length || !time.length) { //체크인 체크아웃 날짜가 비어있지 않은 경우
                		alert('날짜를 선택해주세요');
                	} else if(!pay) {
                		alert('선택버튼을 눌러주세요');	
                	} else {
                 	   var IMP = window.IMP;
                       IMP.init('imp07586387');
                      
                       //DOM객체들에서 사용할 데이터 뽑기
                       var h_id = $('#h_id').val();
                       var m_id = $('#m_id').val();
                       var pname = $('#pname').val();
                       var user_id = $('#user_id').val();
                       var user_email = $('#user_email').val();
                       var user_tel =  $('#user_tel').val();
                      	
                       IMP.request_pay({
                            //카카오페이 결제시 사용할 정보 입력
                           pg: 'kakaopay',
                           pay_method: "card",
                           name: pname,
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
                                    url: "/peco/insertHospital",
                                    type: 'post',
                                    data: {
                                       h_id: h_id,//펜션아이디         
                                       pricecnt: pay,//결제할 가격
                                       hr_name: user_id,//예약자명
                                       hr_email: user_email,//예약자 이메일
                                       hr_tel: user_tel,//예약자 전화번호
                                       imp_uid: rsp.imp_uid, //거래고유번호
                                       hr_id: rsp.merchant_uid, //주문고유번호=펜션예약번호
								 	   hr_pay: rsp.apply_num, //카드승인번호
								 	   m_id : m_id,//회원번호 -예약자명 직접입력 경우 다를 경우
								 	   pname : pname, //펜션명
								 	  	hr_time : time,
								 	 	hr_date : date,
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
	                       			window.location.replace("./redirect");
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
 
 <!-- datetimepicker -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="/resources/datetimepicker/jquery.datetimepicker.full.min.js"></script>
  <link rel="stylesheet" href="/resources/datetimepicker/jquery.datetimepicker.min.css"/> 
 
 <link rel="stylesheet" href="/resources/datepicker/css/jquery-ui.css">
 </body>

</html>