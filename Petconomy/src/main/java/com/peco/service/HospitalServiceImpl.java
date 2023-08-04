package com.peco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.HospitalMapper;
import com.peco.vo.HospitalVO;

@Service
public class HospitalServiceImpl implements HospitalService {
	
	@Autowired
	private HospitalMapper hospitalMapper;
	
	@Override
	public HospitalVO getOne(String h_id) {
		// TODO Auto-generated method stub
		return hospitalMapper.getOne(h_id);
	}

	@Override
	public int starAvg(String h_id) {
		// TODO Auto-generated method stub
		return hospitalMapper.starAvg(h_id);
	}

}
