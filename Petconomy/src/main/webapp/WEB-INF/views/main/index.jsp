<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
<script>
var response_data= [];

$(document).ready(function () {
	  var baseURL = "https://api.odcloud.kr/api/15111389/v1/uddi:41944402-8249-4e45-9e9d-a52d0a7db1cc?"
			  + "serviceKey=JWFQQ8%2Fl2mzSIciMFp6OsEWf0FY%2FjZtaVBpKpNb2ga1UmCMhSzskajf3HKN%2Beu3E959Qv6UYx6vq0jKX3tB0hA%3D%3D
			  + "&perPage=1000
			  + "&returnType=Json";

	  // Loop through page numbers 1 to 10
	  for (var pageNo = 1; pageNo <= 25; pageNo++) {
	    // Append the current page number to the base URL
	    var url = baseURL + "&page=" + pageNo;
	$.ajax({
	    type : "GET",
	    url : url,
	    data : {},
	    success : function(response){

		      $.each(response.data, function(i) {

		    	  if(response.data[i].카테고리3=="펜션"){
		    	  response_data.push(response.data[i]); 		    		  
		    	  }

		      })

		      $.ajax({
		    	     method: 'post',
		    	     url: '/peco/insertPension',
		    	     traditional: true,
		    	     data: {
		    	       data: JSON.stringify(response_data)
		    	     },
		    	     dataType: 'json',
		    	     success: function (res) {
		    	        if (res.result) {
		    	          console.log("완료")
		    	        }
		    	     }
		    	   });
	    }
	    
	})
  }
})

</script>
</head>
<body>

</body>
</html>