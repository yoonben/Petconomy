package com.peco.service;

import org.springframework.stereotype.Service;

import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;

@Service
public interface BusinessService {
	public int pensionInsert(PensionVO pension);
	public PensionVO pensionGetOne(PensionVO pension);
	
	public int pensionRoomInsert(PensionRoomVO pensionroom);
}
