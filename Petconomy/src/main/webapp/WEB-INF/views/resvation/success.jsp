<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>

	tr, td {
	border : 1px solid black;
	}
	
	th{
	border : 1px solid black;
	background-color : black;
	color : white;
	}
	
	.index {
	border : none;
	outline: none;
	}
</style>
<body>

<h2>펜션예약내역</h2>
<form name='mypResForm' onsubmit="return false">
<table>
<tr>
	<th>예약번호</th>
	<th>펜션명</th>
	<th>객실명</th>
	<th>입실날짜</th>
	<th>퇴실날짜</th>
	<th>결제금액</th>
	<th>예약자명</th>
</tr>
<c:if test="${fn:length(getPrList )==0}">
<tr>
<td  colspan="9">예약내역이 없습니다</td>
</tr>
</c:if>
<c:forEach var="pr" items="${getPrList }" varStatus="status">
<tr>
<input type="hidden" value="${status.index}" id="index">
<c:choose>
	<c:when test="${fn:length(pr.imp_uid) > 1}">
		<td><input type="text" class="index" id="imp_uid" data-puid="${status.index}" value="${fn:substring(pr.imp_uid,4,16)}" readonly></td>
	</c:when>
</c:choose>
<td>${pr.pname }</td> 
<td>${pr.roomname }</td> 
<td>${pr.startdate }</td> 
<td>${pr.enddate }</td>
<td><input type="text" class="index" id="pcnt" data-pcnt="${status.index}" value="${pr.pricecnt }"readonly></td>
<td>${pr.pr_name }</td>
<td style="border: none;"><button onclick="delPension(${status.index})">예약취소</button></td>
</tr>
</c:forEach>
</table>
</form>


<h2>병원예약내역</h2>
<form name='myhResForm' onsubmit="return false">
<table>
<tr>
	<th>예약번호</th>
	<th>병원명</th>
	<th>예약날짜</th>
	<th>예약시간</th>
	<th>결제금액</th>
	<th>예약자명</th>
</tr>
<c:if test="${fn:length(getHrList )==0}">
<tr>
<td  colspan="9">예약내역이 없습니다</td>
</tr>
</c:if>
<c:forEach var="hr" items="${getHrList }" varStatus="status">
<tr>
<input type="text" value="${status.index}" id="index">
<c:choose>
	<c:when test="${fn:length(hr.imp_uid) > 1}">
		<td><input type="text" class="index" id="imp_uid" data-huid="${status.index}" value="${fn:substring(hr.imp_uid,4,16)}" readonly></td>
	</c:when>
</c:choose>
<td>${hr.hname }</td> 
<td>${hr.hr_date }</td> 
<td>${hr.hr_time }</td>
<td><input type="text" class="index" id="pcnt" data-hcnt="${status.index}" value="${hr.pricecnt }"readonly></td>
<td>${hr.hr_name }</td>
<td style="border: none;"><button onclick="delHospital(${status.index})">예약취소</button></td>
</tr>
</c:forEach>
</table>
</form>

<button type="button" onclick="location.href='/peco/restest'">예약하러가기</button>

<script>
//펜션 예약 취소
function delPension(index) {
	var i = index;
	console.log(i);

	var imp_uid = 'imp_'+$('input[data-puid="'+index+'"]').val();
	var pay = $('input[data-pcnt="'+index+'"]').val();

	console.log(imp_uid);
	console.log(pay);
	console.log('삭제실행');
	
	$.ajax({

	      url: "payment/cancel", 
	      type: "Post",
	      data: ({
	        imp_uid: imp_uid, //주문번호
	        amount: pay, //결제금액
	        
      })
    }).done(function(result) { // 환불 성공시 로직 
        alert("환불 성공");
    
	        $.ajax({

	            url: "delete", 
	            type: "Post",
	            data: ({
	                  imp_uid: imp_uid, //주문번호    
	            })
	        })
    
        alert("삭제완료");
	    location.reload();
    
    }).fail(function(error) { // 환불 실패시 로직
      	alert("환불 실패");
    });
	
}


//병원 예약 취소
function delHospital(index) {
	var i = index;
	console.log(i);

	var imp_uid = 'imp_'+$('input[data-huid="'+index+'"]').val();
	var pay = $('input[data-hcnt="'+index+'"]').val();

	console.log(imp_uid);
	console.log(pay);
	console.log('삭제실행');
	
	$.ajax({

	      url: "payment/cancel", 
	      type: "Post",
	      data: ({
	        imp_uid: imp_uid, //주문번호
	        amount: pay, //결제금액
	        
      })
    }).done(function(result) { // 환불 성공시 로직 
        alert("환불 성공");
    
	        $.ajax({

	            url: "hospitalDel", 
	            type: "Post",
	            data: ({
	                  imp_uid: imp_uid, //주문번호           
	            })
	        })
    
        alert("삭제완료");
	    location.reload();
    
    }).fail(function(error) { // 환불 실패시 로직
      	alert("환불 실패");
    });
	
}
		  
</script>

</body>
</html>