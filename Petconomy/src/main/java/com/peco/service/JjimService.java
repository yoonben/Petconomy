package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.JjimVO;

@Service
public interface JjimService {

	public int count(JjimVO jjimVO);
	
	public int delete(JjimVO jjimVO);
	
	public int insert(JjimVO jjimVO);
	
	public List<JjimVO> jList(String m_id);
	
}
