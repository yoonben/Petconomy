console.log('AdminPension.js=========')

// get방식 요청
function fetchGet(url, callback){
	try{
		// url 요청
		fetch(url)
			// 요청결과 json문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));			
	}catch(e){
		console.log('fetchGet',e);
	}
}

// post방식 요청
function fetchPost(url, obj, callback){
	try{
		// url 요청
		fetch(url
				, {
					method : 'post'
					, headers : {'Content-Type' : 'application/json'}
					, body : JSON.stringify(obj)
				})
			// 요청결과 json문자열을 javascript 객체로 반환
			.then(response => response.json())
			// 콜백함수 실행
			.then(map => callback(map));			
	}catch(e){
		console.log('fetchPost', e);
	}
	
}


// 댓글 조회및 출력
function getPensionList(page){
	
	/**
	 * falsey : false, 0, "", NaN, undefined, null falsey한 값 이외의 값이 들어 있으면 true를
	 * 반환
	 * 
	 * page에 입력된 값이 없으면 1을 세팅
	 */
	if(!page){
		page = 1;
	}	
	
	console.log('/peco/adminPension/list/' + page);
	console.log(`/peco/adminPension/list/${page}`);
	
	// url : 요청경로
	// callback : 응답결과를 받아 실행시킬 함수
	fetchGet(`/peco/adminPension/list/${page}`, adminPensionView)
	
}

// 리스트 결과를 받아서 화면에 출력
function adminPensionView(map){
	let list = map.list;
	let pageDto = map.pageDto;	
	console.log(list);
	
	
	console.log('pageDto=============', pageDto);	
	
	// 리스트 사이즈를 확인하여 메세지 처리
	if(list.length == 0){
		pensionDiv.innerHTML = '대기중인 펜션이 없습니다.'
	} else {		
		
		let pensionDivStr =
			'<table border="1px">'
			+'<tr>'            
            +'<td>펜션번호</td>   '
            +'<td>회원번호</td>     '
            +'<td>펜션이름</td>       '
            +'<td>주소</td>     '
            +'<td>오픈시간</td>       '
            +'<td>주차여부</td>     '
            +'<td>사업자 등록증 확인</td>     '
            +'<td>등록 승인</td>     '
            +'</tr>';          

		
		// 리스트를 돌며 댓글목록을 생성
		list.forEach(pension => {
			pensionDivStr +=
				'<tr>'            
	            +'<td>'+ pension.p_id +'</td>   '
	            +'<td>'+ pension.m_id +'</td>     '
	            +'<td>'+ pension.pname +'</td>       '
	            +'<td>'+ pension.addr +'</td>     '
	            +'<td>'+ pension.openhour +'</td>       '
	            +'<td>'+ pension.parkyn +'</td>     '
	            +'<td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick=pensionBImg("'+ pension.p_id +'")>사업자 등록증 확인</button></td>   '

	            
	            +'<td><button type="button" class="btn btn-danger" onclick=pensionUpdate("'+ pension.p_id +'")>등록 승인</button></td>   '
	            +'</tr>';
			
		})
		
		pensionDivStr += '</table> <br>'

		// 화면에 출력
		pensionDiv.innerHTML = pensionDivStr;
		
		

		// 화면에 출력
		pensionDiv.innerHTML = pensionDivStr;
		
		
		// 페이지 블럭 생성
		let pageBlock = 
				  `<nav aria-label="...">                                                 `
				+ `  <ul class="pagination justify-content-center">                       `;
			
		if(pageDto.prev){
			// prev 버튼
			pageBlock += `    <li class="page-item disabled"`
				+ ` 					onclick="getPensionList(${pageDto.startNo-1})">     `
				+ `      <a class="page-link">Previous</a>                                `
				+ `    </li>                                                              `;
		}
		
		for(let i=pageDto.startNo; i<=pageDto.endNo; i++){
			let active = pageDto.cri.pageNo == i ? 'active' : '';
			// 페이지 버튼 startNo ~ endNo
			pageBlock += `    <li class="page-item ${active}" onclick="getPensionList(${i})">`
						+ `		<a class="page-link" href="#">`
						+ `		${i}`
						+ `		</a></li>     `;
		}
		
		if(pageDto.next){
			// next 버튼
			pageBlock += `    <li class="page-item" `
				+ `						onclick="getPensionList(${pageDto.endNo+1})">       `
				+ `      <a class="page-link" href="#">Next</a>                           `
				+ `    </li>                                                              `;
		}

				
		pageBlock += `  </ul>                                                               `
				+ `</nav>                                                                 `;
			                                                                      
		pensionpaginationDiv.innerHTML = pageBlock;	
	}
		
                        
}


// 답글 등록, 수정, 삭제의 결과를 처리하는 함수
function pensionRes(map){
	console.log(map);
	if(map.result == 'success'){
		// 성공 : 리스트 조회및 출력
		getPensionList();
	} else {
		// 실패 : 메세지 출력
		alert(map.message);
	}
		
}

function pensionbRes(map){
	console.log(map);
	if(map.result == 'success'){
		// 성공 : 리스트 조회및 출력
		let blist = map.list;		
		
		blist.forEach(b => {
			var savePath = b.savePath.replace('\\', '/');
			console.log(savePath,'그냥주소');
			var savePathR= encodeURIComponent(savePath);

			bImgDiv.innerHTML = ' <img src="/peco/display?fileName=' + savePathR+'" style="width: 100%">' ;

		})
		
		
	} else {
		// 실패 : 메세지 출력
		alert(map.message);
	}
		
}

function pensionUpdate(p_id){
	
	console.log('p_id', p_id );
	fetchGet('/peco/adminPension/update/' + p_id, pensionRes);
	location.reload();
}

function pensionBImg(p_id) {
	
	fetchGet('/peco/adminPension/imgOn/' + p_id, pensionbRes);
	
}














