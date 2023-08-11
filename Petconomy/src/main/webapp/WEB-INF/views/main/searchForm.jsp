<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	    
	<!-- 별점 cdn -->
	<script src="https://cdn.jsdelivr.net/gh/hiphop5782/score@latest/score.js"></script>
    
</head>
<body>

<script>

function regionChange(e){
	var gangwondo = ["춘천·인제·철원","평창·정선·영월","속초·양양·고성","강릉","동해·삼척·태백","홍천·횡성·원주"];
	var gyeonggido = ["가평·청평·양평","수원·화성","고양·파주·김포","의정부·포천·동두천","용인·동탄","오산·평택","남양주·구리·성남·분당","이천·광주·여주·하남","부천·광명·시흥·안산","안양·의왕·군포"];
	var gyeongsangdo = ["경주","거제·통영","포항·영덕·울진·청송","창원·마산·진해·김해·부곡","남해·사천·하동·진주","울산·양산","대구·구미·안동·문경"];
	var busando = ["해운대·마린시티","벡스코·센텀시티","송정·기장·정관","광안리·경성대","부산역","자갈치·남포동·영도","송도·다대포","서면·연산·범일","동래·온천·금정구","사상·강서·김해공항"];
	var incheonsi = ["인천국제공항·강화·을왕리","주안·간석·인천시청","송도·소래포구","영종도·월미도","청라·계양·부평"];
	var jeollado = ["광주·나주·함평","순천·광양·담양·보성·화순","군산·익산","전주·완주","여수","남원·부안·정읍·고창·무주·구례","목포·신안·영광·진도·고흥·영암·완도·강진"];
	var chungcheongdo = ["천안·아산·도고","보령·대천·부여·공주·금산","충주·제천·단양·괴산·증평","대전·세종","안면도·태안·서산·덕산","청주·음성·진천"];
	var jejudo = ["제주시·국제공항","서귀포시·모슬포","중문","함덕·김녕·세화","애월·한림·협재","표선·성산"];
	 
	var smallregion =document.querySelector("#smallregion");
	 
	if(e.value == "강원") var changeItem = gangwondo;
	else if(e.value == "경기") var changeItem = gyeonggido;
	else if(e.value == "경상") var changeItem = gyeongsangdo;
	else if(e.value == "부산") var changeItem = busando;
	else if(e.value == "인천") var changeItem = incheonsi;
	else if(e.value == "전라") var changeItem = jeollado;
	else if(e.value == "충청") var changeItem = chungcheongdo;
	else if(e.value == "제주") var changeItem = jejudo;

	smallregion.options.length=0;
	 
	for(item in changeItem){                
		var opt = document.createElement("option");
			opt.value=changeItem[item];
			opt.innerHTML=changeItem[item];
			smallregion.appendChild(opt);
	            }
}
	 

</script>
<form id="search" action="/peco/main/pension" method="get" name="selectForm">
<div class="test-score1" data-max="5" data-rate="5"></div>
<input type="hidden" name="pageNo" value="${pageDto.regioncri.pageNo}">
<select class="form-select" id="megaregion" name="megaregion"  onchange="regionChange(this)" style="display:inline-block; width:100px;" >
  <option value='' selected>시·도</option>
  <option value="강원" ${pageDto.regioncri.megaregion eq "강원" ? "selected" : " " }>강원</option>
  <option value="경기" ${pageDto.regioncri.megaregion eq "경기" ? "selected" : " " }>경기</option>
  <option value="경상" ${pageDto.regioncri.megaregion eq "경상" ? "selected" : " " }>경상</option>
  <option value="부산" ${pageDto.regioncri.megaregion eq "부산" ? "selected" : " " }>부산</option>
  <option value="인천" ${pageDto.regioncri.megaregion eq "인천" ? "selected" : " " }>인천</option>
  <option value="전라" ${pageDto.regioncri.megaregion eq "전라" ? "selected" : " " }>전라</option>
  <option value="충청" ${pageDto.regioncri.megaregion eq "충청" ? "selected" : " " }>충청</option>
  <option value="제주" ${pageDto.regioncri.megaregion eq "제주" ? "selected" : " " }>제주</option>
</select>
<select class="form-select form-select-inline" name="smallregion" onchange="this.form.submit()" id="smallregion" style="display:inline-block; width:100px;">
<option>군·구</option>
</select>

<select class="form-select form-select-inline" id="sort" name="sort" style=" width:150px; display:inline-block;" onchange="this.form.submit()">
<option value=''>정렬기준</option>
<option value='review' ${pageDto.regioncri.sort eq "review" ? "selected" : " " }>리뷰많은순</option>
<option value='star' ${pageDto.regioncri.sort eq "star" ? "selected" : " " }>별점순</option>
<option value='highprice' ${pageDto.regioncri.sort eq "highprice" ? "selected" : " " }>고가순</option>
<option value='lowprice' ${pageDto.regioncri.sort eq "lowprice" ? "selected" : " " }>저가순</option>
</select>

</form>



 
</body>
</html>