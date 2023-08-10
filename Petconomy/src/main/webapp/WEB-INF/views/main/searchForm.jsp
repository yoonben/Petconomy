<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>Script</title>
    <style>
      * {
        font-family: Consolas, sans-serif;
      }
    </style>
  </head>
  <body>
  <form id="search" action="/peco/main/pension" method="get" name="selectForm">
  <input type="text" name="sRegion" value="${pageDto.regioncri.smallregion}">
    <p>
      <select id="megaregion" name="megaregion" onchange="optionChange();">
        <option></option>
        <option value="서울" ${pageDto.regioncri.megaregion eq "서울" ? "selected" : " " }>서울</option>
        <option value="인천" ${pageDto.regioncri.megaregion eq "인천" ? "selected" : " " }>인천</option>
        <option value="대전" ${pageDto.regioncri.megaregion eq "대전" ? "selected" : " " }>대전</option>
        <option value="광주" ${pageDto.regioncri.megaregion eq "광주" ? "selected" : " " }>광주</option>
        <option value="대구" ${pageDto.regioncri.megaregion eq "대구" ? "selected" : " " }>대구</option>
        <option value="울산" ${pageDto.regioncri.megaregion eq "울산" ? "selected" : " " }>울산</option>
        <option value="부산" ${pageDto.regioncri.megaregion eq "부산" ? "selected" : " " }>부산</option>
        <option value="경기" ${pageDto.regioncri.megaregion eq "경기" ? "selected" : " " }>경기</option>
        <option value="강원" ${pageDto.regioncri.megaregion eq "강원" ? "selected" : " " }>강원</option>
        <option value="충청" ${pageDto.regioncri.megaregion eq "충청" ? "selected" : " " }>충청</option>
        <option value="전라" ${pageDto.regioncri.megaregion eq "전라" ? "selected" : " " }>전라</option>
        <option value="경상" ${pageDto.regioncri.megaregion eq "경상" ? "selected" : " " }>경상</option>
        <option value="제주" ${pageDto.regioncri.megaregion eq "제주" ? "selected" : " " }>제주</option>
      </select>
      <select id="smallregion" name="smallregion" >
        <option></option>
      </select>
      <button id="btn"></button>
    </p>
    </form>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
      function optionChange() {
    	var 지역 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충청","전라","경상","제주"];
    	var 서울 = ["구/군 선택","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    	var 인천 = ["구/군 선택","계양구","미추홀구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
    	var 대전 = ["구/군 선택","대덕구","동구","서구","유성구","중구"];
    	var 광주 = ["구/군 선택","광산구","남구","동구","북구","서구"];
    	var 대구 = ["구/군 선택","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
    	var 울산 = ["구/군 선택","남구","동구","북구","중구","울주군"];
    	var 부산 = ["구/군 선택","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    	var 경기 = ["구/군 선택","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
    	var 강원 = ["구/군 선택","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
    	var 충청 = ["구/군 선택","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군" ,"계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
    	var 전라 = ["구/군 선택","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    	var 경상 = ["구/군 선택","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
    	var 제주 = ["구/군 선택","서귀포시","제주시",];
    	var mega = $( '#megaregion' ).val();
    	var small;
        if ( mega == '서울' ) {
        	small = 서울;
        } else if ( mega == '인천' ) {
          small = 인천;
        } else if ( mega == '대전' ) {
          small = 대전;
        } else if ( mega == '광주' ) {
          small = 광주;
        } else if ( mega == '대구' ) {
          small = 대구;
        } else if ( mega == '울산' ) {
          small = 울산;
        } else if ( mega == '부산' ) {
          small = 부산;
        } else if ( mega == '경기' ) {
          small = 경기;
        } else if ( mega == '강원' ) {
          small = 강원;
        } else if ( mega == '충청' ) {
          small = 충청;
        } else if ( mega == '전라' ) {
          small = 전라;
        } else if ( mega == '경상' ) {
          small = 경상;
        } else if ( mega == '제주' ) {
          small = 제주;
        } else {
        	small = [];
        }
        $( '#smallregion' ).empty();
        $( '#smallregion' ).append( '<option>""</option>' );

        for ( var i = 0; i < small.length; i++ ) {
          var isSelected = (small[i] === smallregion) ? 'selected' : '';
          $( '#smallregion' ).append( '<option value="'+small[i]+'">' + small[ i ] + '</option>' );
        }
      }
      $('#btn').on('click', function(event) {
    	    event.preventDefault(); // 폼 제출 동작 막기
	      	var sregion = document.querySelector("input[name='sRegion']").value;

    	    // 선택된 옵션 설정
    	    $('#smallregion option[value=' + sregion + ']').attr('selected', 'selected');

    	    // 폼 제출
    	    $('#selectForm').submit(); // 폼 ID에 따라 변경
    	});
    </script>
  </body>
</html>