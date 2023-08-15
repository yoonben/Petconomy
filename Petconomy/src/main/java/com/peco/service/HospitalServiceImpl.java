package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.HospitalMapper;
import com.peco.vo.HospitalVO;
import com.peco.vo.RegionCri;

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
	public List<HospitalVO> mapList(RegionCri cri) {
		// TODO Auto-generated method stub
		return hospitalMapper.mapList(cri);
	}

	@Override
	public List<HospitalVO> hospitalList(RegionCri cri) {
		// TODO Auto-generated method stub
		return hospitalMapper.hospitalList(cri);
	}

	@Override
	public int hospitalInsert(HospitalVO vo) {
		// TODO Auto-generated method stub
		return hospitalMapper.hospitalInsert(vo);
	}


	@Override
	public int totalCnt(RegionCri cri) {
		// TODO Auto-generated method stub
		return hospitalMapper.totalCnt(cri);
	}

	@Override
	public List<HospitalVO> hospitaltop() {
		// TODO Auto-generated method stub
		return hospitalMapper.hospitaltop();
	}


	@Override
	public int update_H(HospitalVO vo) {
		// TODO Auto-generated method stub
		return hospitalMapper.update_H(vo);
	}

	@Override
	public HospitalVO getOne_H(String m_id) {
		// TODO Auto-generated method stub
		return hospitalMapper.getOne_H(m_id);
	}

	@Override
	public int totalCount(RegionCri cri) {
		// TODO Auto-generated method stub
		return hospitalMapper.totalCount(cri);
	}

}
