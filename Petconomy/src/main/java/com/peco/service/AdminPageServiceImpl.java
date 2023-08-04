package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.AdminPageMapper;
import com.peco.vo.Criteria;
import com.peco.vo.MemberVO;

@Service
public class AdminPageServiceImpl implements AdminPageService {
	
	@Autowired
	AdminPageMapper adminMapper;

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		
		return adminMapper.getMemberList(cri);
	}

	@Override
	public int totalCnt() {
		// TODO Auto-generated method stub
		return adminMapper.totalCnt();
	}
	
}
