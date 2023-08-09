<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>

<form id="myForm">
  <select id="smallregion">
    <!-- 옵션들은 JavaScript로 추가됩니다. -->
  </select>
  <input type="submit" value="Submit">
</form>


 <script>
 document.addEventListener("DOMContentLoaded", function() {
	  const changeItem = ["서울시", "부산시", "춘천시", "대전시", "광주시"];
	  const select = document.getElementById("smallregion");

	  // 이전에 저장한 선택된 옵션 값을 가져오기
	  const savedValue = localStorage.getItem("selectedOption");
	  
	  for (const item of changeItem) {
	    const option = document.createElement("option");
	    option.value = item;
	    option.text = item;
	    if (item === savedValue) {
	      option.selected = true;
	    }
	    select.appendChild(option);
	  }

	  // 폼 제출 시 선택된 옵션 값을 localStorage에 저장
	  document.getElementById("myForm").addEventListener("submit", function(event) {
	    event.preventDefault(); // 폼 제출 기본 동작 막기
	    
	    const selectedValue = select.value;
	    localStorage.setItem("selectedOption", selectedValue);
	    
	    // 폼 제출 후에 추가적인 동작 수행
	  });
	});






</script>
</body>
</html>