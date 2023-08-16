package com.peco.vo;

import lombok.Data;

@Data
public class R_ReplyVO {
	
	private String rno;	   	   //원댓글 번호
	
	private String rrno;	   //댓글 번호
	private String reply;	   //댓글 내용
	private String replyer;	   //댓글작성자
	private String regdate;    //댓글 작성일
	private String updatedate; //댓글 수정일
	
	private String nickname;   //멤버 테이블 참조키 
	private String m_id;  	   //멤버 테이블 참조키
	private int bno;  	       //게시글 테이블 참조키


}
