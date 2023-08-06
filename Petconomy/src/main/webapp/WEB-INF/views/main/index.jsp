<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
<script>

//$('#searchBtn').click(function(){
$("#btn1").on("click", function () {
	
	// 공공 api 주소 24000건 받아오기
	  var baseURL = "https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc?serviceKey=JWFQQ8%2Fl2mzSIciMFp6OsEWf0FY%2FjZtaVBpKpNb2ga1UmCMhSzskajf3HKN%2Beu3E959Qv6UYx6vq0jKX3tB0hA%3D%3D&perPage=1000&returnType=Json";

	  for (var pageNo = 1; pageNo <= 24; pageNo++) {

	    
	    var url = baseURL + "&page=" + pageNo;
	    
	// json 데이터 get 방식으로 받아오기
	$.ajax({
	    type : "GET",
	    url : url,
	    data : {},
	    success : function(response){

		  		var response_data= [];
		      	$.each(response.data, function(i) {
		    	  if(response.data[i].카테고리3=="펜션"){
		    	  response_data.push(response.data[i]); 
		    	  
		    	  }


		      })
				// json 배열 데이터 컨트롤러에서 insert 처리할 수 있도록  post 방식으로 보내줌
		      $.ajax({
		    	     method: 'post',
		    	     url: '/peco/insertPension',
		    	     traditional: true,
		    	     data: {
		    	       data: JSON.stringify(response_data)
		    	     },
		    	     dataType: 'json',
		    	     success: function (res) {
		    	    	 console.log("Data",JSON.stringify(response_data))
		    	     }
		    	   });
	    }
	    
	})
 }
})
$(document).ready(function () {
	
	// 공공 api 주소 24000건 받아오기
	  var baseURL = "https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc?serviceKey=JWFQQ8%2Fl2mzSIciMFp6OsEWf0FY%2FjZtaVBpKpNb2ga1UmCMhSzskajf3HKN%2Beu3E959Qv6UYx6vq0jKX3tB0hA%3D%3D&perPage=1000&returnType=Json";

	  for (var pageNo = 1; pageNo <= 24; pageNo++) {

	    
	    var url = baseURL + "&page=" + pageNo;
	    
	// json 데이터 get 방식으로 받아오기
	$.ajax({
	    type : "GET",
	    url : url,
	    data : {},
	    success : function(response){

		  		var response_data= [];
		      	$.each(response.data, function(i) {
		    	  if(response.data[i].카테고리3=="동물병원"){
		    	  response_data.push(response.data[i]); 
		    	  
		    	  }


		      })
				// json 배열 데이터 컨트롤러에서 insert 처리할 수 있도록  post 방식으로 보내줌
		      $.ajax({
		    	     method: 'post',
		    	     url: '/peco/insertHospital',
		    	     traditional: true,
		    	     data: {
		    	       data: JSON.stringify(response_data)
		    	     },
		    	     dataType: 'json',
		    	     success: function (res) {
		    	    	 console.log("Data",JSON.stringify(response_data))
		    	     }
		    	   });
	    }
	    
	})
 }
})

</script>
</head>
<body>
<h3>공공데이터 가져오기</h3>
<button id="btn1">펜션데이터</button>
<button id="btn2">병원데이터</button>
</body>
</html>