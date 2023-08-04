package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.PensionMapper;
import com.peco.vo.PensionVO;

@Service
public class PensionServiceImpl implements PensionService {

	@Autowired
	PensionMapper pensionMapper;
	
	@Override
	public List<PensionVO> mapList() {
		// TODO Auto-generated method stub
		return pensionMapper.mapList();
	}

}
