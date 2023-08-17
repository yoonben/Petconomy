package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.JjimMapper;
import com.peco.vo.JjimVO;

@Service
public class JjimServiceImpl implements JjimService {

	@Autowired
	JjimMapper mapper;
	
	@Override
	public int count(JjimVO jjimVO) {
		// TODO Auto-generated method stub
		return mapper.count(jjimVO);
	}

	@Override
	public int delete(JjimVO jjimVO) {
		// TODO Auto-generated method stub
		return mapper.delete(jjimVO);
	}

	@Override
	public int insert(JjimVO jjimVO) {
		// TODO Auto-generated method stub
		return mapper.insert(jjimVO);
	}

	@Override
	public List<JjimVO> jList(String m_id) {
		// TODO Auto-generated method stub
		return mapper.jList(m_id);
	}

}
