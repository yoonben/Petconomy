package com.peco.mapper;

import com.peco.vo.PensionRoomVO;
import com.peco.vo.PensionVO;

public interface BusinessMapper {
	public int pensionInsert(PensionVO pension);
	public PensionVO pensionGetOne(PensionVO pension);
	
	public int pensionRoomInsert(PensionRoomVO pensionroom);
}
