package com.peco.vo;

import lombok.Data;

@Data
public class BusinessFileuploadVO {
	
	private String pi_id;
	private String p_id;
	private String uploadpath;
	private String filename;
	private String filetype;
	private String fileroom;
	
	private String savePath;
}
