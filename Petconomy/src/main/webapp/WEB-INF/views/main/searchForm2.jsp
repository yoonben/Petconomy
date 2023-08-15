<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>

<script>

function regionChange(e){
	var gangwondo = ["강릉시","고성군","속초시","양양군","원주시","인제군","정선군","춘천시","평창군","홍천군","홍천군","화천군","횡성군"];
	var gyeonggido = ["가평군","김포시","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안성시","안양시","양주시","양평군","여주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","하남시","화성시"];
	var gyeongsangdo = ["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시","함안군","합천군","경산시","경주시","고령군","구미시","군위군","김천시","문경시","사천시","상주시","안동시","영양군","영주시","영천시","예천군","의성군","청도군","청송군","예천군","칠곡군","포항시","통영시","경주시","울진군"];
	var seoul = ["강남구","강동구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var busando = ["강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","중구","해운대구"];
	var gwangju = ["광산구","남구","동구","북구","서구"];
	var daegu = ["남구","달서구","달성군","동구","북구","서구","수성구","중구","대덕구","동구","서구","유성구","중구"];
	var incheonsi = ["강화군","옹진군","계양구","남동구","미추홀구","부평구","서구","연수구","중구"];
	var jeollado = ["강진군","고흥군","광양시","구례군","나주시","담양군","목포시","무안군","순천시","여수시","영광군","영암군","장선군","함평군","해남군","화순군","고창군","군산시","김제시","남원시","완주군","익산시","전주시","정읍시"];
	var chungcheongdo = ["금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","홍성군","괴산군","옥천군","제천시","진천군","청주시","충주시"];
	var jejudo = ["서귀포시","제주시"];
	 
	var smallregion =document.querySelector("#smallregion");
	 
	if(e.value == "강원") var changeItem = gangwondo;
	else if(e.value == "경기") var changeItem = gyeonggido;
	else if(e.value == "경상") var changeItem = gyeongsangdo;
	else if(e.value == "부산") var changeItem = busando;
	else if(e.value == "인천") var changeItem = incheonsi;
	else if(e.value == "전라") var changeItem = jeollado;
	else if(e.value == "충청") var changeItem = chungcheongdo;
	else if(e.value == "제주") var changeItem = jejudo;
	else if(e.value == "광주") var changeItem = gwangju;
	else if(e.value == "서울") var changeItem = seoul;
	$('#smallregion').empty();

	for(item in changeItem){                
		//var isSelected = (changeItem[item] === ) ? 'selected' : '';
		var option = $("<option id='"+changeItem[item]+"' value='"+changeItem[item]+"'>"+changeItem[item]+"</option>");
		
        $('#smallregion').append(option);
		    }


}	


function go(page){
	selectForm.pageNo.value=page;
	selectForm.submit();
}
</script>
<form id="search" action="/peco/main/hospital" method="get" name="selectForm">
<input type="hidden" name="pageNo" value="${pageDto.regioncri.pageNo}">
<input type="hidden" name="sRegion" value="${pageDto.regioncri.smallregion}">
<select class="form-select" id="megaregion" name="megaregion"  onchange="regionChange(this)" style="width:100px; display:inline-block;">
  <option value='' selected>시·도</option>
  <option value="강원" ${pageDto.regioncri.megaregion eq "강원" ? "selected" : " " }>강원도</option>
  <option value="경기" ${pageDto.regioncri.megaregion eq "경기" ? "selected" : " " }>경기도</option>
  <option value="경상" ${pageDto.regioncri.megaregion eq "경상" ? "selected" : " " }>경상도</option>
  <option value="광주" ${pageDto.regioncri.megaregion eq "광주" ? "selected" : " " }>경상도</option>
  <option value="부산" ${pageDto.regioncri.megaregion eq "부산" ? "selected" : " " }>부산시</option>
  <option value="서울" ${pageDto.regioncri.megaregion eq "서울" ? "selected" : " " }>부산시</option>
  <option value="인천" ${pageDto.regioncri.megaregion eq "인천" ? "selected" : " " }>인천시</option>
  <option value="전라" ${pageDto.regioncri.megaregion eq "전라" ? "selected" : " " }>전라도</option>
  <option value="충청" ${pageDto.regioncri.megaregion eq "충청" ? "selected" : " " }>충청도</option>
  <option value="제주" ${pageDto.regioncri.megaregion eq "제주" ? "selected" : " " }>제주도</option>
</select>
<select class="form-select form-select-inline" id="smallregion" name="smallregion"  id="smallregion" style=" width:100px; display:inline-block;">
<option value='' class="smallOpt">군·구</option>
</select>

<select class="form-select form-select-inline" id="sort" name="sort" id="smallregion" onchange="this.form.submit(this.value)" style=" width:150px; display:inline-block; ">
<option value='' ${pageDto.regioncri.sort eq "" ? "selected" : " " }>정렬기준</option>
<option value='' ${pageDto.regioncri.sort eq "" ? "selected" : "" }>전체</option>
<option value='cnt' ${pageDto.regioncri.sort eq "cnt" ? "selected" : " " }>리뷰많은순</option>
<option value='star' ${pageDto.regioncri.sort eq "star" ? "selected" : " " }>별점순</option>
<option value='max' ${pageDto.regioncri.sort eq "max" ? "selected" : " " }>고가순</option>
<option value='min' ${pageDto.regioncri.sort eq "min" ? "selected" : " " }>저가순</option>
</select>



</form>


 
</body>
</html>