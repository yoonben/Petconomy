package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.AdminPensionMapper;
import com.peco.vo.Criteria;
import com.peco.vo.PensionVO;

@Service
public class AdminPensionServiceImpl implements AdminPensionService {
	
	@Autowired
	AdminPensionMapper adminPensionMapper;
	
	@Override
	public List<PensionVO> getPensionList(Criteria cri) {
		// TODO Auto-generated method stub
		return adminPensionMapper.getPensionList(cri);
	}

	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return adminPensionMapper.totalCnt();	
	}

	@Override
	public int update(String p_id) {
		// TODO Auto-generated method stub
		return adminPensionMapper.update(p_id);
	}

}
