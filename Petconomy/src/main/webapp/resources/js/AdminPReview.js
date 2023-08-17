console.log('AdminPReview.js=========')

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
function getPReviewList(page){
	
	/**
	 * falsey : false, 0, "", NaN, undefined, null falsey한 값 이외의 값이 들어 있으면 true를
	 * 반환
	 * 
	 * page에 입력된 값이 없으면 1을 세팅
	 */
	if(!page){
		page = 1;
	}	
	
	console.log('/peco/adminPpReview/list/' + page);
	console.log(`/peco/adminPpReview/list/${page}`);
	
	// url : 요청경로
	// callback : 응답결과를 받아 실행시킬 함수
	fetchGet(`/peco/adminPpReview/list/${page}`, pReviewView)
	
}

// 리스트 결과를 받아서 화면에 출력
function pReviewView(map){
	let list = map.list;
	let pageDto = map.pageDto;	
	console.log(list);
	
	
	console.log('pageDto=============', pageDto);	
	
	// 리스트 사이즈를 확인하여 메세지 처리
	if(list.length == 0){
		pReviewDiv.innerHTML = '등록된 회원이 없습니다.'
	} else {		
		
		let pReviewDivStr =
			'<table border="1px">'
			+'<tr>'            
            +'<td>펜션이름</td>   '
            +'<td>리뷰</td>     '
            +'<td>별점</td>       '
            +'<td>작성자</td>     '
            +'<td>작성일</td>       '
            +'<td>댓글 삭제</td>     '
            +'</tr>';          

		
		// 리스트를 돌며 댓글목록을 생성
		list.forEach(pReview => {
			pReviewDivStr +=
				'<tr>'            
	            +'<td>'+ pReview.pname +'</td>   '
	            +'<td>'+ pReview.review +'</td>     '
	            +'<td>'+ pReview.star +'</td>       '
	            +'<td>'+ pReview.reviewer +'</td>     '
	            +'<td>'+ pReview.regitdate +'</td>       '
	            +'<td><button type="button" class="btn btn-danger" onclick=pReviewDelete("'+ pReview.pr_no +'")>댓글삭제</button></td>   '	            
	            +'</tr>';
			
		})
		
		pReviewDivStr += '</table> <br>'

		// 화면에 출력
		pReviewDiv.innerHTML = pReviewDivStr;
		
		
		// 페이지 블럭 생성
		let pageBlock = 
				  `<nav aria-label="...">                                                 `
				+ `  <ul class="pagination justify-content-center">                       `;
			
		if(pageDto.prev){
			// prev 버튼
			pageBlock += `    <li class="page-item disabled"`
				+ ` 					onclick="getPReviewList(${pageDto.startNo-1})">     `
				+ `      <a class="page-link">Previous</a>                                `
				+ `    </li>                                                              `;
		}
		
		for(let i=pageDto.startNo; i<=pageDto.endNo; i++){
			let active = pageDto.cri.pageNo == i ? 'active' : '';
			// 페이지 버튼 startNo ~ endNo
			pageBlock += `    <li class="page-item ${active}" onclick="getPReviewList(${i})">`
						+ `		<a class="page-link" href="#">`
						+ `		${i}`
						+ `		</a></li>     `;
		}
		
		if(pageDto.next){
			// next 버튼
			pageBlock += `    <li class="page-item" `
				+ `						onclick="getPReviewList(${pageDto.endNo+1})">       `
				+ `      <a class="page-link" href="#">Next</a>                           `
				+ `    </li>                                                              `;
		}

				
		pageBlock += `  </ul>                                                               `
				+ `</nav>                                                                 `;
			                                                                      
		PReviewpaginationDiv.innerHTML = pageBlock;	
	}
		
                        
}


// 답글 등록, 수정, 삭제의 결과를 처리하는 함수
function pReviewRes(map){
	console.log(map);
	if(map.result == 'success'){
		// 성공 : 리스트 조회및 출력
		getPReviewList();
	} else {
		// 실패 : 메세지 출력
		alert(map.message);
	}
		
}

// 답글 삭제하기
function pReviewDelete(pr_no){
	
	console.log('pr_no', pr_no );
	fetchGet('/peco/adminPpReview/delete/' + pr_no, pReviewRes);

}















