package com.peco.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.BusinessMapper;
import com.peco.vo.PensionVO;

@Service
public class BusinessServiceImpl implements BusinessService{
	@Autowired
	BusinessMapper businessMapper;

	@Override
	public int pensionInsert(PensionVO pension) {
		return businessMapper.pensionInsert(pension);
	}

	@Override
	public PensionVO pensionGetOne(PensionVO pension) {
		return businessMapper.pensionGetOne(pension);
	}
	
}
