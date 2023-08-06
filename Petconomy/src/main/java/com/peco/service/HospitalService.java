package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.HospitalVO;

@Service
public interface HospitalService {
	
	public HospitalVO getOne(String h_id);
	
	public int starAvg(String h_id);

	public List<HospitalVO> mapList();
	
	public List<HospitalVO> hospitalList();
	
	public int hospitalInsert(HospitalVO vo);
}
