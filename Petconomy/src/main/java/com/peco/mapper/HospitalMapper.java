package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.HospitalVO;

public interface HospitalMapper {

	public HospitalVO getOne(@Param(value="h_id") String p_id);
	
	public int starAvg(@Param(value="h_id") String p_id);
	
	public List<HospitalVO> mapList();
	
	public List<HospitalVO> hospitalList();
	
	public int hospitalInsert(HospitalVO vo);
}
