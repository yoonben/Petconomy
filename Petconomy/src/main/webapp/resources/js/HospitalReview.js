console.log('reply.js=========')

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
	
	let h_id = document.querySelector('#h_id').value;
	let reviewer = document.querySelector('#reviewer').value;
	console.log('h_id : ', h_id);
	
	console.log('/peco/reviewHospital/list/' + h_id + '/' + page);
	console.log(`/peco/reviewHospital/list/${h_id}/${page}`);
	
	// url : 요청경로
	// callback : 응답결과를 받아 실행시킬 함수
	fetchGet(`/peco/reviewHospital/list/${h_id}/${page}`, replyView)
	
}

// 리스트 결과를 받아서 화면에 출력
function replyView(map){
	let list = map.list;
	let reviewerList = map.reviewerList;
	let pageDto = map.pageDto;	
	let reviewer = document.querySelector('#reviewer').value;
	console.log(list);
	console.log(reviewerList);
	
	
	console.log('pageDto=============', pageDto);

	console.log(reviewer);
	 
	reviewerList.forEach(reply => {
		
		
		
		if(reviewer == reply.reviewer){
			reviewDiv.innerHTML = 
			'	<div class="col-lg-17">'
		    +'        <div class="left-info" style="background-color: bisque;">'
		    +'                                      '
		    +'            <span style="text-align: left; color: black;"><b>이미 리뷰를 작성 하셨습니다.</b></span>'
		    +'                                                                 '
		    +'        </div>'
		    +'   </div>'
		}
	})
	
	
	// 리스트 사이즈를 확인하여 메세지 처리
	if(list.length == 0){
		replyDiv.innerHTML = 
			'	<div class="col-lg-17">'
		    +'        <div class="left-info" style="background-color: bisque;">'
		    +'                                      '
		    +'            <span style="text-align: left; color: black;"><b>등록된 리뷰가 없습니다.</b></span>'
		    +'                                                                 '
		    +'        </div>'
		    +'   </div>';
		if(reviewer == ''){
			reviewDiv.innerHTML = 
				'	<div class="col-lg-17">'
			    +'        <div class="left-info" style="background-color: bisque;">'
			    +'                                      '
			    +'            <span style="text-align: left; color: black;"><b>로그인이 필요합니다.</b></span>'
			    +'                                                                 '
			    +'        </div>'
			    +'   </div>';
		}
	} else {		
		
		let replyDivStr = '';

		
		// 리스트를 돌며 댓글목록을 생성
		list.forEach(reply => {
			replyDivStr +=
			 '	  <div id="tr'+reply.hr_no+'" data-value="'+reply.review+'" class="col-lg-17">																			'
			+'	    <div class="left-info" style="background-color: bisque;">											'
			+'	      <div class="left">																						'
			+'	        <h4 style="text-align: left; color: black;"><b>'+reply.reviewer +'</b></h4>                        '
			+'	        <span style="text-align: left; color: black;"><b>'+reply.review +'</b></span>                      '
			+'	      </div>                                                                                                   '
			+'	      <ul>                                                                                                     '
			+'	        <li>                                                                                                   '
			+'	          <div class="starReview" data-max="5" data-rate="'+reply.star +'" style="font-size: 1.4em;"></div>'
			+'	        </li>                                                                                                  '
			+'	        <li style="color: black;"><b>'+reply.regitdate+'</b></li>                                         '
			+'	      </ul>                                                                                                    '
			+'	    </div>                                                                                                     '
			+'	  </div>	                                                                                                   '
			
			// replyer.value : 로그인한 아이디
			// reply.replyer : 답글 작성자
			if(reviewer == reply.reviewer){
				replyDivStr +=
			 '	  <div style="width: 100%; text-align: right;">                       '
		    +'        <div class="edit-delete-buttons">                               '
		    +'          <div class="main-border-button" style="margin-top: 5px;" style="border: 1px solid #FFC48C; background-color: #FFF1E0; color: #FFC48C">     '
		    +'            <a href="#" onclick="replyDelete('+ reply.hr_no +')">삭제하기</a>  '
		    +'          </div>                                                        '
		    +'          <div class="main-border-button" style="margin-top: 5px;">     '
		    +'            <a href="#" onclick="replyEdit('+ reply.hr_no +')" style="border: 1px solid #FFC48C; background-color: #FFF1E0; color: #FFC48C">수정하기</a>'
		    +'          </div>                                                        '
		    +'        </div>                                                          '
		    +'      </div>                                                            '
			}
			
			
			
			
		})
		
		if(reviewer == ''){
			reviewDiv.innerHTML = 
				'	<div class="col-lg-17">'
			    +'        <div class="left-info" style="background-color: bisque;">'
			    +'                                      '
			    +'            <span style="text-align: left; color: black;"><b>로그인이 필요합니다.</b></span>'
			    +'                                                                 '
			    +'        </div>'
			    +'   </div>'
		}
		
		

		// 화면에 출력
		replyDiv.innerHTML = replyDivStr;
		
		
		                   				

		
		//별 시작
		
		jb(".starReview").score({
	        display: {
	          showNumber: true,
	          textColor: "black",
	        }
	      });
		

	    
	    //별 끝
		
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


// 답글 등록하기
function replyWrite(){
	
	// 답글 작성시 필요한 데이터 수집 - bno, reply, replyer
	let h_id = document.querySelector('#h_id').value;
	let review = document.querySelector('#review').value;
	let reviewer = document.querySelector('#reviewer').value;
	let star = document.querySelector('.point-input').value;
		
	// 전달할 객체로 생성
	let obj = {h_id : h_id
			, review : review
			, reviewer : reviewer
			, star : star};
	
	
	
	console.log(obj);
	
	// url : 요청경로
	// obj : JSON형식으로 전달할 데이터
	// callback : 콜백함수(응답결과를 받아서 처리할 함수)
	fetchPost('/peco/reviewHospital/insert', obj, replyRes);
}

// 답글 등록, 수정, 삭제의 결과를 처리하는 함수
function replyRes(map){
	console.log(map);
	if(map.result == 'success'){
		// 성공 : 리스트 조회및 출력
		getReplyList();
	} else {
		// 실패 : 메세지 출력
		alert(map.message);
	}
		
}

// 답글 삭제하기
function replyDelete(hr_no){
	console.log('hr_no', hr_no )
	fetchGet('/peco/reviewHospital/delete/' + hr_no, replyRes);
	location.reload();
}

function replyEdit(hr_no){
	let tr = document.querySelector('#tr'+hr_no);	
	let replyTxt = tr.dataset.value;
	console.log('tr',tr);
	console.log('replyTxt',replyTxt);
	tr.innerHTML = ''                                                                                                               
		                                                                                                                            
		+'	<div class="col-lg-17">                                                                                                 '
		+'	    <div class="left-info" style="background-color: rgb(247, 218, 218);">                                               '
		+'	      <div class="col-lg-13"> <textarea name="review'+hr_no+'" id="review'+hr_no+'" rows="5" style="width: 100%; border-radius: 15px;">'+replyTxt+'</textarea>    '
		+'	      </div>                                                                                                            '
		+'	      <ul>		'
		+'	        <li>                                                                                                            '
		+'	          <div class="main-border-button">                                                                              '
		+'	            <a href="#" onclick="replyEditAction('+ hr_no +')">리뷰 작성</a>                                                                                   	'
		+'	          </div>                                                                                                        '
		+'	        </li>                                                                                                           '
		+'	      </ul>																												'
		+'	    </div>																												'
		+'	  </div>'
}


function replyEditAction(hr_no){
	// 파라메터 수집
	let review = document.querySelector('#review'+hr_no).value;
	
	// 전송할 데이터를 JS 객체로 생성
	let obj = {
			hr_no : hr_no
			, review : review
	}
		
	// 서버에 요청
	fetchPost('/peco/reviewHospital/editAction', obj, replyRes);
	
}













