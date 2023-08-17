package com.peco.mapper;

import java.util.List;

import com.peco.vo.JjimVO;

public interface JjimMapper {

	public int count(JjimVO jjimVO);
	
	public int delete(JjimVO jjimVO);
	
	public int insert(JjimVO jjimVO);
	
	public List<JjimVO> jList(String m_id);
}
