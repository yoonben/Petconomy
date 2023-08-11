<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
</head>
<body>

<form class="goHospital" onsubmit="return false">
<input type="text" value="${h_id }">
<button type="button" onclick="location.href='/peco/hospitalRes?h_id=${h_id}'">병원예약</button>
</form>

<form class="goPension" onsubmit="return false">
<input type="text" value="${p_id }">
<input type="text" value="${room_no }">
<button type="button" onclick="location.href='/peco/PensionRes?p_id=${p_id}&room_no=${room_no}'">펜션예약</button>
</form>





<script>


</script>


</body>
</html>