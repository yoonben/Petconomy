<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
  	<meta charset="UTF-8">
	<title>예약</title>
	<link rel="stylesheet" href="/resources/datepicker/css/jquery-ui.css">
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
    
    .resvation > input {
    border: none;
    outline: none;
    }
    
    .checkIn, .checkOut{
    display: inline-block;
    }

    #date1, #date2 {
    border: none;
    outline: none;
    padding-top: 20px;
    border-bottom: 1px solid black;
    width: 200px;
    float: left;
    margin-bottom: 20px;
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
    
    .paycnt > p {
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
					   <c:forEach var="p" items="${pList}">
						   <input type="text" value="${p.pname}" id="pname"><br>
						   <input type="hidden" value="${p.p_id}" id="p_id">
						   <input type="text" value= "${p.roomname}" id="roomname">
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
        </div>
      </c:forEach></c:forEach>
	
		<br>
	   <div class="btn">
		   <button id="payment">결제</button>
		   <button id="goback" onclick="goback()">뒤로가기</button>
	   </div>
	   
	</form>
	</div>
   <c:forEach var="dis" items="${disabledate}">
   <input type="hidden" value="${dis.startdate}" name="startDate">
   <input type="hidden" value="${dis.enddate}" name="endDate">
   </c:forEach>
			
			</div>
        </div>
      </div>
    </div>
  </div>
</div>

  <!-- Scripts -->
  
  <script>

            let disDays = [];
            let listDate = [];
            
        $(function() {
            //선택불가 날짜 비활성화
            inputDisDays();
   
            $( "#datepicker1" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

            $(".datepicker1").datepicker({
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
                onSelect: function(date1) {
                $('#date1').val(date1);
                }
                ,beforeShowDay: function(date) {
                    var dateString = $.datepicker.formatDate('yy-mm-dd', date);
                    if(disDays.indexOf(dateString) != -1) {
                        return [false];
                    } else {
                        return [true];
                    }
                }
            });       
            
            
            
            $(".datepicker2").datepicker({
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
                onSelect: function(date2) { //박스2에 출력
                $('#date2').val(date2);
                 }
                ,beforeShowDay: function(date) { //비활성화 날짜
                    var dateString = $.datepicker.formatDate('yy-mm-dd', date);
                    if(disDays.indexOf(dateString) != -1) {
                        return [false];
                    } else {
                        return [true];
                    }
                } 
            }); 

            
            Resbtn.addEventListener('click', function() {
                listDate = [];
                let sDay = document.querySelector('#date1').value;
                let eDay = document.querySelector('#date2').value;
                //console.log('s'+sDay,length);
                //console.log('e'+eDay);

            	if(!sDay.length || !eDay.length) { //만약에 input 값이 비었다면
            		alert('날짜를 선택해주세요');
             	} else {
                //yy-mm-dd로 받은 값을 -를 구분자로 하여 Date 배열로 반환
                var startday = sDay.split('-');
                var endday = eDay.split('-');
                var sArr = new Date(startday[0], startday[1]-1, startday[2]);
                var eArr = new Date(endday[0], endday[1]-1, endday[2]);
                // console.log(sArr);
                // console.log(eArr);

                    getDateRange(sDay, eDay, listDate);
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
                    
                    if(eArr.getTime() <= sArr.getTime()) {
                        alert('하루이상 선택해주세요');
                    } else {
                        const diffDate = eArr.getTime() - sArr.getTime();
                        diffday = Math.abs(diffDate / (1000 * 60 * 60 * 24));
                        //console.log(Math.abs(diffDate / (1000 * 60 * 60 * 24)));
                    
                        if(diffday > 0) {
                            alert('선택되었습니다');
                            $('#period').val(diffday+'박'+(diffday+1)+'일');
                           
                        //총 결제금액 구하기(기간+1)+1박당 가격
                        console.log($('#price').val());
                        let priceCnt = $('#price').val()*diffday;
                        console.log(priceCnt);
                        $('#pay').val(priceCnt);
                        

                         }
                         }

                }
             })


                    //예약자정보 직접입력 전환 기본값:readonly(disable로 설정 시 서브밋할때 안넘어감)
                    direct.addEventListener('click', function() {
                       $('#user_id').attr('readonly',false);
                       $('#user_email').attr('readonly',false);
                       $('#user_tel').attr('readonly',false);
                       console.log('aaa');
                    })
         
                    $('#payment').click(function () {
                        console.log('aaaa')
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
                   	        	
                   	        	// 결제 유효성 검증
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
                   		        	
                                    $.ajax({
                                        url: "/peco/insert",
                                        type: 'post',
                                        data: {
                                           p_id: p_id,//펜션아이디   
	                                       period: period,//기간
	                                       pricecnt: pay,//결제할 가격
	                                       startdate : startdate, //입실일
	                                       enddate : enddate, //퇴실일
	                                       pr_name: user_id,//예약자명
	                                       pr_email: user_email,//예약자 이메일
	                                       pr_tel: user_tel,//예약자 전화번호
	                                       imp_uid: rsp.imp_uid, //거래고유번호
	                                       pr_id: rsp.merchant_uid, //주문고유번호=펜션예약번호
									 	   pr_pay: rsp.apply_num, //카드승인번호
									 	   m_id : m_id,//회원번호 -예약자명 직접입력 경우 다를 경우
									 	   pname : pname, //펜션명
									 	   roomname : roomname,//객실명
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
                       });
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
        
        
        //테이블에서 선택불가날짜 가져오기
        let inputDisDays = function() { 
        	
        	let startArr = [];
        	let endArr = [];

	        $("input[name=startDate]").each(function(index, item){
	        	var startDate = $(item).val(); 	
	        	startArr.push(startDate);
	        });

        	$("input[name=endDate]").each(function(index, item){
        		var	endDate = $(item).val();  	
        		endArr.push(endDate);
	        });

   			
			//console.log('s'+startArr);
			//console.log('e'+endArr);
			
			for(i=0; i<startArr.length; i++) {
				getDateRange(startArr[i], endArr[i], listDate);
			}
			
			for(i=0; i<listDate.length; i++) {
				var dis = listDate[i];
				disDays.push(dis);
				
				console.log(dis);
			}
			
			console.log(disDays);
		
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