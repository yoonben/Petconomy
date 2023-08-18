console.log("js파일 연결 완료")

//get방식 요청
function fetchGet(url,callback){
	console.log(url);
	console.log(callback);
	
	try {
	//url 요청
	fetch(url)
		//요청 결과json 문자열을 javascript 객체로 반환
		.then(response => response.json())
		//매개로 받은 콜백함수 실행
		.then(map => callback(map));
		
	} catch (e) {
		console.log(e);
	}
	
	
}

//post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'post'
					,headers : {'Content-Type' : 'application/json'} 
					,body  : JSON.stringify(obj)
			  })
			//요청 결과json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			//매개로 받은 콜백함수 실행
			.then(map => callback(map))
			
			
		} catch (e) {
			console.log(e);

		
		}
	
	
}

//덧글 조회 및 출력
function getReplyList(page){
	let bno = document.querySelector('#bno').value;
	
	/**
	 * falsey : false, 0, "", NaN, undefined, null
	 * falsey한 값 이외의 값이 들어 있으면 true를 반환
	 * 
	 *  page에 입력된 값이없으면 1로 세팅
	 * 	 * @param map
	 * @returns
	 */
	if(!page){
		page = 1;
	}

	
	//백팃 쓰는법
	console.log("패치 매핑"+`/reply/list/${bno}/${page}`);
	
	fetchGet(`/reply/list/${bno}/${page}`, replyView);
}




let totalCnt;

function replyView(map){
	let list = map.list;
	let pageDto = map.pageDto;
	totalCnt = map.totalCnt;
	
	//총 댓글 수 출력
	document.getElementById('totalCnt').textContent = `댓글 : ${totalCnt}`;
	
	console.log("리스트 받고있니? -> ",list);
	console.log("pageDto 받고있니? -> ",pageDto);
	console.log("totalCnt 받고있니? -> ",totalCnt);
	
	
	
	if(list.length > 0 ){
		let replyDivStr = '' 								
		list.forEach((reply, index)=>{
		
		replyDivStr 	+=''
						+ '<div class="reply-box" id="reply-box'+reply.rno+'" data-value="'+reply.reply+'" data-rno="'+reply.rno+'" data-nickname="'+reply.nickname+'">                                                                    '
						+ '	<div class="reply-in">                                                                    '
						+ '		<div class="replyerdate">                                                             '
						+ '			<div>'+reply.nickname+'</div>                                                                 '
						+ '			<div>'+reply.regdate+'</div>                                                                 '
						+ '		</div>                                                                                '
						+ '		<div class="replynone"></div>                                                         '
						+ '		<div class="reply-content">'+reply.reply+'</div>                                            '
						+ '		<div class="r-reply">                                                                 '
						+ '			<div>                                                                             '
						+ '			<button name="r_reply" value="답글" class="r-reply-button"><a onclick="r_replyWrite('+reply.rno+')">답글</a></button>          '
						+ '			</div>                                                                            '
						+ '			                                                                                  ';
if(nickname == reply.nickname){
		replyDivStr		+='			<div>                                                                             '
						+ '			<button name="r_reply" value="수정" class="r-reply-button" onclick="replyEdit('+reply.rno+')">수정</button>          '
						+ '			<button name="r_reply" value="삭제" class="r-reply-button" onclick="replyDeleteModal('+reply.rno+')">삭제</button>          '
						+ '			</div>                                                                            ';
};
		replyDivStr		+=''
						+ '		</div>                                                                                '
						+ '	</div>                                                                                    '
						+ '</div>                                                                                     '
						+ '<div id="r_replyDiv'+reply.rno+'">                                                                                     '
						+ '</div>                                                                                     ';
		//대댓글 출력
		getRReplyList(reply.rno)
		});

		replyDiv.innerHTML = replyDivStr;
		
							
	//페이지 블록 붙이기
	let pageBlock 		=``						
						+` <nav aria-label="...">                                                `
						+`   <ul class="pagination justify-content-center">                      `
						if(pageDto.prev){		
			 pageBlock +=``
						+`     <li class="page-item" onclick="getReplyList(${(pageDto.startNo-1)})">                                   `
						+`       <a class="page-link disabled">Previous</a>                               `
						+`     </li>                                                             `;
						}
	
						for(i=pageDto.startNo; i <= pageDto.endNo; i++){
							let active = pageDto.cri.pageNo == i ? 'active' : '';
			 pageBlock +=``
				 		+`     <li class="page-item"><a class="page-link ${active}" href="#" onclick="getReplyList(${i})">${i}</a></li>    `
						};
						
						if(pageDto.next){
			 pageBlock +=``
				 		+`     <li class="page-item" onclick="getReplyList(${(pageDto.endNo+1)})">                                            `
						+`       <a class="page-link" href="#">Next</a>                          `
						+`     </li>                                                             `
						+`   </ul>                                                               `
						+` </nav>                                                                `;
						}
							replyDiv.innerHTML += pageBlock;
							
							
	
	}else{
		replyDiv.innerHTML+=''
							+'<div class="no-reply">                                                      '
						    +'	<div class="no-reply-text">첫 댓글을 남겨주세요!</div>                    	  '
						    +'	<div class="no-reply-imgbox">                                             '
						    +'		<img src="/resources/images/no_answer.png" class="no-reply-img">      '
						    +'	</div>                                                                    '
						    +'</div>                                                                      '	
	};
						
	
}







function replyWrite() {
    
	//bno 게시글번호
	//m_id 회원번호
	//reply 댓글내용
	//replyer 댓글 작성자
	let bno = document.querySelector('#bno').value;
	let reply = document.querySelector('#reply').value;
	let m_id = document.querySelector('#m_id').value;
	let replyer = document.querySelector('#writer').value;

	
	//전달할 객체로 생성
	let obj = {bno : bno
			,  reply : reply
			,  replyer : replyer
			,  m_id : m_id}
	
	//url : /reply/insert/
	//ojb : JSON형식으로 전달할 데이터
	//callback : 처리할때 호출할 콜백함수
	//			*메서드로 짜놓은 fetch 메서드에선 콜백함수를 넣을때 함수의 이름만 넣는다 
	//			 	뒤에 ()를 포함하면 함수가 바로실행이 되어버림
	fetchPost('/reply/insert/',obj,replyRes)

}

//댓글 등록, 수정, 삭제의 결과를  처리
function replyRes(map){
	console.log(map);
	//성공 : 리스트 조회 및 출력
	//실패 : 메세지 출력
	if(map.result =='success'){
		
		//댓글창 초기화
		document.querySelector('#reply').value = '';
		replyDiv.innerHTML = '';
		//등록성공
		getReplyList();
		
	}else{
		if (map.message.includes('SQLException')) {
            if (map.message.includes('ORA-12899')) {
                alert('댓글 내용이 너무 깁니다. 100자 이하로 작성해주세요.');
            } else {
                // 기타 SQLException에 해당하는 처리
                alert('댓글 추가 중에 오류가 발생했습니다.');
            }
        } else {
            // 기타 예외 메시지에 해당하는 처리
            alert(map.message);
        }
	}
}


/*댓글삭제*/
function replyDeleteAction(rno){
	console.log("매개변수 rno를 잘 받고 있니? :"+rno)
	fetchGet(`/reply/delete/${rno}`, replyRes);
}

/*대댓글삭제*/
function rreplyDeleteAction(rrno){
	console.log("매개변수 rrno를 잘 받고 있니? :"+rrno)
	fetchGet(`/r_reply/delete/${rrno}`, replyRes);
}

/*대댓글 리스트 출력*/
function getRReplyList(rno) {
    fetchGet(`/r_reply/list/${rno}`, function(map) {
        const rlist = map.rlist;
        const totalCnt = map.totalCnt;

        const rReplyDiv = document.querySelector(`#r_replyDiv${rno}`);
        rReplyDiv.innerHTML = ''; // 기존 대댓글 내용 초기화

        if (rlist.length > 0) {
        	let rReplyDivStr = ''
            rlist.forEach((rReply) => {
            	rReplyDivStr 	+=''
					+ '<div class="reply-box" id="reply-box'+rReply.rrno+'" data-value="'+rReply.reply+'" data-rrno="'+rReply.rrno+'" data-nickname="'+rReply.nickname+'">                                                                    '
					+ '	<div class="reply-in rreply_box">                                                                    '
					+ '		<div class="replyerdate">                                                             '
					+ '			<div>'+rReply.nickname+'</div>                                                                 '
					+ '			<div>'+rReply.regdate+'</div>                                                                 '
					+ '		</div>                                                                                '
					+ '		<div class="replynone"></div>                                                         '
					+ '		<div class="reply-content">'+rReply.reply+'</div>                                            '
					+ '		<div class="r-reply">                                                                 '
					+ '			<div>                                                                             '
					+ '			</div>                                                                            '
					+ '			                                                                                  ';
if(nickname == rReply.nickname){
	rReplyDivStr		+='			<div>                                                                             '
					+ '			<button name="r_reply" value="수정" class="r-reply-button" onclick="rreplyEdit('+rReply.rrno+')">수정</button>          '
					+ '			<button name="r_reply" value="삭제" class="r-reply-button" onclick="rreplyDeleteModal('+rReply.rrno+')">삭제</button>          '
					+ '			</div>                                                                            ';
};
rReplyDivStr		+=''
					+ '		</div>                                                                                '
					+ '	</div>                                                                                    '
					+ '</div>                                                                                     '
					+ '<div id="r_replyDiv'+rReply.rrno+'">                                                                                     '
					+ '</div>                                                                                     ';


	});

            rReplyDiv.innerHTML = rReplyDivStr;
        } else {
/*            const noReplyDiv = document.createElement('div');
            noReplyDiv.classList.add('no-reply');
            noReplyDiv.innerHTML = `
                <div class="no-reply-text">대댓글이 없습니다.</div>
            `;
            rReplyDiv.appendChild(noReplyDiv);*/
        }
    });
}


function r_replyWrite(rno) {
    let r_replyDiv = document.querySelector('#r_replyDiv' + rno);


    // 대댓글 작성 폼이 이미 생성되었는지 체크
    if (!r_replyDiv.querySelector('.reply-insert')) {
        let replyer = document.querySelector('#writer').value;

        r_replyDiv.innerHTML +=
            '<div>' +
            '    <div class="reply-insert">' +
            '        <div class="reply-nickname">' + replyer + '</div>' +
            '        <textarea placeholder="댓글을 입력하세요" id="r_reply"></textarea>' +
            '        <div class="reply-end">' +
            '            <div class="reply-end2"></div>' +
            '            <div><button class="reply-button" id="btnr_ReplyWrite" onclick="r_replyWriteAction(' + rno + ')">등록</button></div>' +
            '        </div>' +
            '    </div>' +
            '</div>' +
            '<hr>';
    }
    
    // 대댓글 작성폼으로 스크롤 이동
    r_replyDiv.scrollIntoView({ behavior: 'smooth', block: 'end' });
}





function r_replyWriteAction(rno){
	//bno 게시글번호
	//m_id 회원번호
	//reply 댓글내용
	//replyer 댓글 작성자
	let bno = document.querySelector('#bno').value;
	let reply = document.querySelector('#r_reply').value;
	let m_id = document.querySelector('#m_id').value;
	let replyer = document.querySelector('#writer').value;

	
	//전달할 객체로 생성
	let obj = {bno : bno
			,  rno : rno
			,  reply : reply
			,  replyer : replyer
			,  m_id : m_id}
	
	//url : /reply/insert/
	//ojb : JSON형식으로 전달할 데이터
	//callback : 처리할때 호출할 콜백함수
	//			*메서드로 짜놓은 fetch 메서드에선 콜백함수를 넣을때 함수의 이름만 넣는다 
	//			 	뒤에 ()를 포함하면 함수가 바로실행이 되어버림
	fetchPost('/r_reply/insert',obj,replyRes)
		

}

function replyEdit(rno){
										//rno매개변수를 줄때는 function replyEdit(rno)의 rno를 그대로 줘야함. 
										//reply.rno 아님
	let rbox = document.querySelector('#reply-box'+rno);
	let replyTxt = rbox.dataset.value; //답글 수정 눌렀을때 기존 답글내용 유지 접근하기
	let replyNickname= rbox.dataset.nickname; //답글 수정 눌렀을때 기존 답글내용 유지 접근하기
	rbox.innerHTML = ''
		/*
		+'<th colspan="3" class="Show_reply">'   
        +'<div class="reply-form-container">                                   '
		+'    <div class="header-and-buttons">                                 '
		+'        <div class="reply-form-header">댓글 수정</div>                '
		+'    </div>                                                           '
		+'    <textarea class="reply-textarea"  id="editReply'+rno+'" >'+replyTxt+'</textarea>         '
		+'    <button class="submit-button" id="btnReplyWrite" onclick="replyEditAction('+rno+')">수정하기</button>   '
		+'</div>                                                               '
		+'</th>'
		*/
		+'<div>                                                                                 '
		+'	<div class="reply-insert">                                                          '
		+'	<div class="reply-nickname">'+replyNickname+'</div>                                                  '
		+'		<textarea placeholder="수정할 내용을 입력하세요" id="editReply'+rno+'" >'+replyTxt+'</textarea>              		'
		+'		<div class="reply-end">                                                         '
		+'			<div class="reply-end2"></div>                                              '
		+'		    <div><button class="reply-button" id="btnReplyWrite" onclick="replyEditAction('+rno+')">수정</button></div>     '
		+'		</div>                                                                          '
		+'	</div>                                                                              '
		+'</div>                                                                                '
		+'<hr>                                                                                '
		
}

function replyEditAction(rno){

	let reply = document.querySelector('#editReply'+rno).value;

	
	//전달할 객체로 생성
	let obj = {rno : rno
			,  reply : reply}
	
	//url : /reply/insert/
	//ojb : JSON형식으로 전달할 데이터
	//callback : 처리할때 호출할 콜백함수
	//			*콜백함수를 넣을땐 함수의 이름만 넣는다 
	//			 	뒤에 ()를 포함하면 함수가 바로실행이 되어버림
	fetchPost('/reply/update/',obj,replyRes)
	
}


function rreplyEdit(rrno){
	//rno매개변수를 줄때는 function replyEdit(rno)의 rno를 그대로 줘야함. 
	//reply.rno 아님
let rrbox = document.querySelector('#reply-box'+rrno);
let rreplyTxt = rrbox.dataset.value; //답글 수정 눌렀을때 기존 답글내용 유지 접근하기
let rreplyNickname= rrbox.dataset.nickname; //답글 수정 눌렀을때 기존 답글내용 유지 접근하기
	rrbox.innerHTML = ''
	+'<div>                                                                                 '
	+'	<div class="reply-insert">                                                          '
	+'	<div class="reply-nickname">'+rreplyNickname+'</div>                                                  '
	+'		<textarea placeholder="수정할 내용을 입력하세요" id="editRReply'+rrno+'" >'+rreplyTxt+'</textarea>              		'
	+'		<div class="reply-end">                                                         '
	+'			<div class="reply-end2"></div>                                              '
	+'		    <div><button class="reply-button" id="btnReplyWrite" onclick="rreplyEditAction('+rrno+')">수정</button></div>     '
	+'		</div>                                                                          '
	+'	</div>                                                                              '
	+'</div>                                                                                '
	+'<hr>                                                                                '

}

function rreplyEditAction(rrno){

let rreply = document.querySelector('#editRReply'+rrno).value;


//전달할 객체로 생성
let obj = {rrno : rrno
		, reply : rreply}

//url : /reply/insert/
//ojb : JSON형식으로 전달할 데이터
//callback : 처리할때 호출할 콜백함수
//			*콜백함수를 넣을땐 함수의 이름만 넣는다 
//			 	뒤에 ()를 포함하면 함수가 바로실행이 되어버림
fetchPost('/r_reply/update',obj,replyRes)

}






