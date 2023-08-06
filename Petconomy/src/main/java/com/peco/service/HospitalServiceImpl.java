package com.peco.service;

import java.util.List;

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

	@Override
	public List<HospitalVO> mapList() {
		// TODO Auto-generated method stub
		return hospitalMapper.mapList();
	}

	@Override
	public List<HospitalVO> hospitalList() {
		// TODO Auto-generated method stub
		return hospitalMapper.hospitalList();
	}

	@Override
	public int hospitalInsert(HospitalVO vo) {
		// TODO Auto-generated method stub
		return hospitalMapper.hospitalInsert(vo);
	}

}
