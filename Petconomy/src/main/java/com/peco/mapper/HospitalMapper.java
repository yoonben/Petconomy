package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.HospitalVO;
import com.peco.vo.RegionCri;

public interface HospitalMapper {

	public HospitalVO getOne(@Param(value="h_id") String p_id);
	
	public int starAvg(@Param(value="h_id") String p_id);
	
	public List<HospitalVO> mapList();
	
	public List<HospitalVO> hospitalList(RegionCri cri);
	
	public List<HospitalVO> hospitaltop();
	
	public int hospitalInsert(HospitalVO vo);
	
	public int totalCnt(RegionCri cri);
	
}