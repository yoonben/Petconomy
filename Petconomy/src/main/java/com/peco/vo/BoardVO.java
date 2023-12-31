package com.peco.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int bno        ;
	private String category      ;
	private String title      ;
	private String content    ;
	private String regdate    ;
	private String updatedate ;
	private int visitcount ;
	private String likecount  ;
	private String m_id       ;
	private String nickname   ;
	private String writer ;
	private String replycount ;
	private String id ;
	
	private String savePath;	//저장된 파일경로
	private String s_savePath;	//저장된 썸네일파일경로
	private String p_savePath;	//저장된 프로필일파일경로
	
	
}
