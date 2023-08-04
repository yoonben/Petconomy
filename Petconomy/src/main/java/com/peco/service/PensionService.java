package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.PensionVO;

@Service
public interface PensionService {

	public List<PensionVO> mapList();

	public PensionVO getOne_P(String m_id);

	public int update_P(PensionVO vo);
}
