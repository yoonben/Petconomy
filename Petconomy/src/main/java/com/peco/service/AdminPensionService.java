package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.Criteria;
import com.peco.vo.PensionVO;

@Service
public interface AdminPensionService {

	List<PensionVO> getPensionList(Criteria cri);
	
	int totalCnt();
	
	int update(String p_id);
	
}
