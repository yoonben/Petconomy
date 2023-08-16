package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.peco.vo.HospitalFileuploadVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.RegionCri;

@Service
public interface HospitalService {
	
	public HospitalVO getOne(String h_id);
	
	public int starAvg(String h_id);

	public List<HospitalVO> mapList(RegionCri cri);
	
	public List<HospitalVO> hospitalList(RegionCri cri);
	
	public int hospitalInsert(HospitalVO vo);
	
	public int totalCnt(RegionCri cri);
	
	public List<HospitalVO> hospitaltop();
	
	public int update_H(HospitalVO vo);
	
	public HospitalVO getOne_H(String m_id);
	
	public HospitalFileuploadVO getHospitaImg(@Param(value="h_id") String h_id);
	
	public int totalCount(RegionCri cri);
}
