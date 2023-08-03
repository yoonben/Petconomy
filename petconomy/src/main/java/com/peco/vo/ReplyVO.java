package com.peco.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private String rno;
	private String reply;
	private String replyer;
	private String nickname;
	private String regdate;
	private String updatedate;
	
	
	private int bno;
}
