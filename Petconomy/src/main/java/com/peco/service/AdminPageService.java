package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.MemberVO;

@Service
public interface AdminPageService {
	
	List<MemberVO> getMemberList(Criteria cri);
	
	int totalCnt();
	
}
