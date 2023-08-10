<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>


<style>
.searchbox{
height:50px;

}

/* 추가한 스타일 */
.col-auto .form-select,
.col-sm-6 .form-control {
  border-radius: 15px; /* 모서리 둥글게 설정 */
  border: 2px solid rgb(255, 189, 8);; /* 테두리 노란색으로 설정 */
}
</style>


</head>
<body>

	<form class="row g-2" action="/peco/board/search" name="searchForm">
	
	<input type="hidden" class="form-control" name="bno" id="bno" >
	<input type="hidden" class="form-control" name="pageNo" id="pageNo" value="${pageDto.cri.pageNo }">
	
 	<div class="row g-2 justify-content-center searchbox" >
	  <!-- 검색필드 -->
	  <div class="col-auto">
		<select name="searchField" class="form-select" aria-label="Default select example">
		  <option value="title" ${pageDto.cri.searchField eq "title" ? "selected" : " " }>제목</option>
		  <option value="content" ${pageDto.cri.searchField eq "content" ? "selected" : " " }>내용</option>
		  <option value="writer" ${pageDto.cri.searchField eq "writer" ? "selected" : " " }>작성자</option>
		</select>
	  </div>
	  
	  <!--검색바 사이즈 조절 -> col-sm-숫자  -->
	  <!-- 검색키워드 -->
	  <div class="col-sm-6">
	    <label for="searchWord" class="visually-hidden"></label>
	    <input  type="text" class="form-control" name="searchWord" id="searchWord" value="${pageDto.cri.searchWord }">
	  </div>
	  
	  <!-- 검색버튼 -->
	  <div class="col-auto">
	    <button type="submit" class="btn btn-transparent  mb-3" onclick='go(1)' style="height:37px"><i class="fa fa-search"></i></button>
	  </div> 
	</div>
	
	
	
	
	
	
	  
	</form>
	
	
	
	
</body>
</html>