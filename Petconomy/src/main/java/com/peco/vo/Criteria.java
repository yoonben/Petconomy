package com.peco.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private String searchField; //검색조건
	private String searchWord;  //검색어
	
	private int pageNo = 1;		//요청 페이지 번호
	private int amount = 10;	//한 페이지당 게시물 수
	
	private int startNo = 1;
	private int endNo 	= 10;

	//pageNo 값만 바뀌어도 endNo,startNo가 같이 바뀜
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			startNo = pageNo * amount - (amount-1);
		}
	}
	
}
