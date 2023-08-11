
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4793f7e09cabda709895d2261a8c2af&libraries=services"></script>
<div id="map" style="width:100%;height:400px;backgroundColor:yellow;"></div>
<script>
window.addEventListener('load', function(){
	
	//현재 위치 가져오기
	if ("geolocation" in navigator) {	/* geolocation 사용 가능 */
		navigator.geolocation.getCurrentPosition(function(data) {
		
			var latitude = data.coords.latitude;
			var longitude = data.coords.longitude;
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
	        //var locPosition = new kakao.maps.LatLng(latitude, longitude), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            //message = '<di>현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
        

	   	    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
	        //function displayMarker(locPosition, message) {

	            // 마커를 생성합니다
	            //var marker = new kakao.maps.Marker({  
	                //map: map, 
	                //position: locPosition
	            //}); 
	            
	            //var iwContent = message, // 인포윈도우에 표시할 내용
	                //iwRemoveable = true;

	            // 인포윈도우를 생성합니다
	            //var infowindow = new kakao.maps.InfoWindow({
	            //    content : iwContent,
	                //removable : iwRemoveable
	            //});
	            
	            // 인포윈도우를 마커위에 표시합니다 
	            //infowindow.open(map, marker);
	            
	            // 지도 중심좌표를 접속위치로 변경합니다
	            //map.setCenter(locPosition);      
	       		 //}	    
			var positions = [
				<c:forEach items="${list }" var="list">
				    { 
				        address : "${list.addr }"
				    },
				</c:forEach>
				];

			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
			    	positions.forEach(function (position) { //추가한 코드
			       
				    	// 주소로 좌표를 검색합니다
				        geocoder.addressSearch(position.address, function(result, status) {
				            if (status === kakao.maps.services.Status.OK) {
				        	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						    // 마커를 생성합니다
								    var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position: coords, // 마커를 표시할 위치
								        image : markerImage // 마커 이미지 
								    });
			            	}
			       		 })
			    })

		        // 마커와 인포윈도우를 표시합니다
		        //displayMarker(locPosition, message);

		}, function(error) {
			alert(error);
		}, {
			enableHighAccuracy: true,
			timeout: Infinity,
			maximumAge: 0
		});
	} else {	/* geolocation 사용 불가능 */
		alert('geolocation 사용 불가');
	}
	
});


</script>
</body>
</html>




