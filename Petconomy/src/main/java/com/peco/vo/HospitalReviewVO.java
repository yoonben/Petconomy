package com.peco.vo;

import lombok.Data;

@Data
public class HospitalReviewVO {
	private int hr_no;
	private String h_id;
	private String review;
	private String regitdate;
	private String star;
	private String reviewer;
	
	private String pname;
}
