package com.peco.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.peco.vo.HospitalFileuploadVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.RegionCri;

public interface HospitalMapper {

	public HospitalVO getOne(@Param(value="h_id") String h_id);
	
	public int starAvg(@Param(value="h_id") String h_id);
	
	public List<HospitalVO> mapList(RegionCri cri);
	
	public List<HospitalVO> hospitaltop();
	
	public List<HospitalVO> hospitalList(RegionCri cri);	
	
	public HospitalFileuploadVO getHospitalImg(@Param(value="h_id") String h_id);
	
	public int hospitalInsert(HospitalVO vo);
	
	public int totalCnt(RegionCri cri);
	
	public int update_H(HospitalVO vo);
	
	public HospitalVO getOne_H(String m_id);
	
	public int totalCount(RegionCri cri);
}
