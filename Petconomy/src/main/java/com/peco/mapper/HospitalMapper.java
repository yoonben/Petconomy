package com.peco.mapper;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.HospitalVO;

public interface HospitalMapper {

	public HospitalVO getOne(@Param(value="h_id") String p_id);
	
	public int starAvg(@Param(value="h_id") String p_id);
	
}
