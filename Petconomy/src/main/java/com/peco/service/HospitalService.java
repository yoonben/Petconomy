package com.peco.service;

import org.springframework.stereotype.Service;

import com.peco.vo.HospitalVO;

@Service
public interface HospitalService {
	
	public HospitalVO getOne(String h_id);
	
	public int starAvg(String h_id);

}
