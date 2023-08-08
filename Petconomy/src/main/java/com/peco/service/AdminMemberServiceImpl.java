package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.AdminMemberMapper;
import com.peco.vo.Criteria;
import com.peco.vo.MemberVO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	AdminMemberMapper adminMapper;
	
	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		
		return adminMapper.getMemberList(cri);
	}

	@Override
	public int totalCnt() {
		
		return adminMapper.totalCnt();
	}

	@Override
	public int delete(String m_id) {
		
		return adminMapper.delete(m_id);
	}

	@Override
	public int update(String m_id) {

		return adminMapper.update(m_id);
	}

}
