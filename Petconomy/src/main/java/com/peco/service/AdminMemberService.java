package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.MemberVO;

@Service
public interface AdminMemberService {
	
	List<MemberVO> getMemberList(Criteria cri);
	
	int totalCnt();
	
	int delete(String m_id);
	
	int update(String m_id);
}
