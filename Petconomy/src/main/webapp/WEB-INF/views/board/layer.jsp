<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery.js"></script>
<title>Insert title here</title>
</head>
<script>
function closeLayer( obj ) {
	$(obj).parent().parent().hide();
}

$(function(){

	/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	$('.imgSelect').click(function(e)
	{
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;

		var oWidth = $('.popupLayer').width();
		var oHeight = $('.popupLayer').height();

		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.clientX + 10;
		var divTop = e.clientY + 5;

		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;

		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;

		$('.popupLayer').css({
			"top": divTop,
			"left": divLeft,
			"position": "absolute"
		}).show();
	});

});

</script>
<style>
.imgSelect {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 350px;
	height: 150px;
	padding: 10px;
}
.popupLayer div {
	position: absolute;
	top: 5px;
	right: 5px
}
</style>
<body>
<!-- 클릭 이미지 -->
<p>
	<a class="imgSelect">클릭1</a>
	<a class="imgSelect">클릭2</a>
	<a class="imgSelect">클릭3</a>
	<a class="imgSelect">클릭4</a>
	<a class="imgSelect">클릭5</a>
	<a class="imgSelect">클릭6</a>
	<a class="imgSelect">클릭7</a>
	<a class="imgSelect">클릭8</a>
	<a class="imgSelect">클릭9</a>
	<a class="imgSelect">클릭10</a>
</p>
<p>
	<a class="imgSelect">클릭11</a>
	<a class="imgSelect">클릭12</a>
	<a class="imgSelect">클릭13</a>
	<a class="imgSelect">클릭14</a>
	<a class="imgSelect">클릭15</a>
	<a class="imgSelect">클릭16</a>
	<a class="imgSelect">클릭17</a>
	<a class="imgSelect">클릭18</a>
	<a class="imgSelect">클릭19</a>
	<a class="imgSelect">클릭20</a>
</p>
<p>
	<a class="imgSelect">클릭21</a>
	<a class="imgSelect">클릭22</a>
	<a class="imgSelect">클릭23</a>
	<a class="imgSelect">클릭24</a>
	<a class="imgSelect">클릭25</a>
	<a class="imgSelect">클릭26</a>
	<a class="imgSelect">클릭27</a>
	<a class="imgSelect">클릭28</a>
	<a class="imgSelect">클릭29</a>
	<a class="imgSelect">클릭30</a>
</p>
<!-- //클릭 이미지 -->
 
<!-- 폼 레이어  -->
<div class="popupLayer">
	<div>
		<span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
	</div>
	여긴 레이어~</br>
	클릭하면 바로 나타나는 레이어에요^^
</div>
<!-- //폼 레이어  -->

<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
<p><br/></p>
</body>
</html>