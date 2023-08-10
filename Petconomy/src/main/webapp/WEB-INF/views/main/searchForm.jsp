<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>


<form id="search" action="/peco/main/pension" method="get" name="selectForm">
<div class="test-score1" data-max="5" data-rate="5"></div>
<input type="hidden" name="pageNo" value="${pageDto.regioncri.pageNo}">
<input type="hidden" name="sRegion" value="${pageDto.regioncri.smallregion}">
<select class="form-select" id="megaregion" name="megaregion"  onclick="regionChange(this)"  style=" width:100px; display:inline-block;">
  <option value='' selected>시·도</option>
  <option value="강원" ${pageDto.regioncri.megaregion eq "강원" ? "selected" : " " }>강원도</option>
  <option value="경기" ${pageDto.regioncri.megaregion eq "경기" ? "selected" : " " }>경기도</option>
  <option value="경상" ${pageDto.regioncri.megaregion eq "경상" ? "selected" : " " }>경상도</option>
  <option value="부산" ${pageDto.regioncri.megaregion eq "부산" ? "selected" : " " }>부산시</option>
  <option value="인천" ${pageDto.regioncri.megaregion eq "인천" ? "selected" : " " }>인천시</option>
  <option value="전라" ${pageDto.regioncri.megaregion eq "전라" ? "selected" : " " }>전라도</option>
  <option value="충청" ${pageDto.regioncri.megaregion eq "충청" ? "selected" : " " }>충청도</option>
  <option value="제주" ${pageDto.regioncri.megaregion eq "제주" ? "selected" : " " }>제주도</option>
</select>
<select class="form-select form-select-inline" id="smallregion" name="smallregion" onchange="smallRegion()" id="smallregion"  style=" width:100px; display:inline-block;">
<option value=''>군·구</option>
</select>


<select class="form-select form-select-inline" id="sort" name="sort" style=" width:150px; display:inline-block; ">
<option value=''>정렬기준</option>
<option value='review' ${pageDto.regioncri.sort eq "review" ? "selected" : " " }>리뷰많은순</option>
<option value='star' ${pageDto.regioncri.sort eq "star" ? "selected" : " " }>별점순</option>
<option value='highprice' ${pageDto.regioncri.sort eq "highprice" ? "selected" : " " }>고가순</option>
<option value='lowprice' ${pageDto.regioncri.sort eq "lowprice" ? "selected" : " " }>저가순</option>
</select>
  <div class="col-sm-3">
    <button type="button" class="btn1" onclick="go(1)">검색</button>
  </div>
</form>

<script>
function regionChange(e) {
    smallOpt(e);
}
function smallOpt(e) {
    var regionMap = {
        "강원": ["춘천시","인제군","철원군","평창군","정선군","영월군","속초시","양양군","고성군","강릉시","동해시","삼척시","태백시","홍천군","횡성읍","원주시"],
        "경기": ["가평·청평·양평","수원·화성","고양·파주·김포","의정부·포천·동두천","용인·동탄","오산·평택","남양주·구리·성남·분당","이천·광주·여주·하남","부천·광명·시흥·안산","안양·의왕·군포"],
    	"경상" : ["경주","거제·통영","포항·영덕·울진·청송","창원·마산·진해·김해·부곡","남해·사천·하동·진주","울산·양산","대구·구미·안동·문경"],
    	"부산" : ["해운대·마린시티","벡스코·센텀시티","송정·기장·정관","광안리·경성대","부산역","자갈치·남포동·영도","송도·다대포","서면·연산·범일","동래·온천·금정구","사상·강서·김해공항"],
    	"인천" : ["인천국제공항·강화·을왕리","주안·간석·인천시청","송도·소래포구","영종도·월미도","청라·계양·부평"],
    	"전라" : ["광주·나주·함평","순천·광양·담양·보성·화순","군산·익산","전주·완주","여수","남원·부안·정읍·고창·무주·구례","목포·신안·영광·진도·고흥·영암·완도·강진"],
    	"충청" : ["천안·아산·도고","보령·대천·부여·공주·금산","충주·제천·단양·괴산·증평","대전·세종","안면도·태안·서산·덕산","청주·음성·진천"],
    	"제주" : ["제주·국제공항","서귀포·모슬포","중문","함덕·김녕·세화","애월·한림·협재","표선·성산"]
    };

    var smallRegionSelect = document.querySelector("#smallregion");
    smallRegionSelect.innerHTML = ""; // 기존 옵션 초기화

    var selectedRegion = regionMap[e.value];
    if (selectedRegion) {
        for (var i = 0; i < selectedRegion.length; i++) {
            var option = document.createElement("option");
            option.text = selectedRegion[i];
            smallRegionSelect.add(option);
            
            if (selectedRegion[i] === $('input[name=sRegion]').val()) {
                option.selected = true;
            }
        }
    }
    
    regionSelect.addEventListener("change", function () {
        // 선택된 값 저장
        localStorage.setItem("smallregion", smallregion.value);
        smallOpt(regionSelect);
});
}

window.addEventListener('load', function(){
    // 페이지가 로드될 때 실행되는 코드


    // 저장된 선택된 값 불러오기
    if (localStorage.getItem("smallregion")) {
        var storedValue = localStorage.getItem("smallregion");
        regionSelect.value = storedValue;
        smallOpt(regionSelect);
    }


});




</script>
 
</body>
</html>