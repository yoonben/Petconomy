
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
border:0px solid;
}
</style>
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
			        level: 7 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
	        
			var positions = [
				<c:forEach items="${lists }" var="list">
				    { 
				        content : '<div style="width:250px;  border: 10px solid #FFF1E0; background-color:#FFF1E0; text-algin:center"><a href="/peco/detail/hospitalDetailPage?h_id=${list.h_id }&pageNo=${pageDto.regioncri.pageNo }&megaregion=${pageDto.regioncri.megaregion}&smallregion=${pageDto.regioncri.smallregion}&pname=${list.pname}&filename=${list.savePath}"  style="color:#ff8040; text-align:center; font-weight:900">${list.pname}</a></div>',
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
						       	    // 마커에 표시할 인포윈도우를 생성합니다 
						       	    var infowindow = new kakao.maps.InfoWindow({
						       	        content: position.content // 인포윈도우에 표시할 내용
						       	    });

						       	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						       	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
						       	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						       	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
						       	    kakao.maps.event.addListener(marker, 'click', makeOutListener(infowindow));
			            	}
			       		 })
			    })
			    
			    function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}
				
				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}


				geocoder.addressSearch('${param.megaregion} ${param.smallregion}', function(result, status) {

					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {

					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});  
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




