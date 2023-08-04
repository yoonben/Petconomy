console.log('MemberList.js=========')

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
function getReplyList(page){
	
	/**
	 * falsey : false, 0, "", NaN, undefined, null
	 * falsey한 값 이외의 값이 들어 있으면  true를 반환
	 * 
	 * page에 입력된 값이 없으면 1을 세팅
	 */
	if(!page){
		page = 1;
	}	
	
	
	// url : 요청경로
	// callback : 응답결과를 받아 실행시킬 함수
	fetchGet(`/peco/admin/list/${page}`, replyView)
	
}

// 리스트 결과를 받아서 화면에 출력
function replyView(map){
	let list = map.list;
	let pageDto = map.pageDto;	
	console.log(list);
	console.log(reviewerList);
	
	
	console.log('pageDto=============', pageDto);

	console.log(reviewer);	
	
	// 리스트 사이즈를 확인하여 메세지 처리
	if(list.length == 0){
		replyDiv.innerHTML = '등록된 맴버가 없어요'
	} else {		
		
		let replyDivStr =
			+'<table border="1px">'
			+'<tr>'            
            +'<td>회원번호</td>   '
            +'<td>아이디</td>     '
            +'<td>비밀번호</td>   '
            +'<td>이름</td>       '
            +'<td>닉네임</td>     '
            +'<td>나이</td>       '
            +'<td>이메일</td>     '
            +'<td>전화번호</td>   '
            +'</tr>';          

		
		// 리스트를 돌며 댓글목록을 생성
		list.forEach(reply => {
			replyDivStr +=
				'<tr>'            
	            +'<td>'+ reply.m_id +'</td>   '
	            +'<td>'+ reply.id +'</td>     '
	            +'<td>'+ reply.pw +'</td>   '
	            +'<td>'+ reply.mname +'</td>       '
	            +'<td>'+ reply.nicename +'</td>     '
	            +'<td>'+ reply.age +'</td>       '
	            +'<td>'+ reply.email +'</td>     '
	            +'<td>'+ reply.mphone +'</td>   '
	            +'</tr>';
			
		})
		
		replyDivStr += '</table>'

		// 화면에 출력
		replyDiv.innerHTML = replyDivStr;
		

		
		// 페이지 블럭 생성
		let pageBlock = 
				  `<nav aria-label="...">                                                 `
				+ `  <ul class="pagination justify-content-center">                       `;
			
		if(pageDto.prev){
			// prev 버튼
			pageBlock += `    <li class="page-item disabled"`
				+ ` 					onclick="getReplyList(${pageDto.startNo-1})">     `
				+ `      <a class="page-link">Previous</a>                                `
				+ `    </li>                                                              `;
		}
		
		for(let i=pageDto.startNo; i<=pageDto.endNo; i++){
			let active = pageDto.cri.pageNo == i ? 'active' : '';
			// 페이지 버튼 startNo ~ endNo
			pageBlock += `    <li class="page-item ${active}" onclick="getReplyList(${i})">`
						+ `		<a class="page-link" href="#">`
						+ `		${i}`
						+ `		</a></li>     `;
		}
		
		if(pageDto.next){
			// next 버튼
			pageBlock += `    <li class="page-item" `
				+ `						onclick="getReplyList(${pageDto.endNo+1})">       `
				+ `      <a class="page-link" href="#">Next</a>                           `
				+ `    </li>                                                              `;
		}

				
		pageBlock += `  </ul>                                                               `
				+ `</nav>                                                                 `;
			                                                                      
		paginationDiv.innerHTML = pageBlock;	
	}
		
                        
}




/*// 답글 삭제하기
function replyDelete(pr_no){
	console.log('pr_no', pr_no )
	fetchGet('/peco/review/delete/' + pr_no, replyRes);
	location.reload();
}*/














