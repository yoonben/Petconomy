package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.ResMapper;
import com.peco.vo.MemberVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionVO;

@Service
public class ResServiceimpl implements ResService{
	
	@Autowired
	private ResMapper mapper;

	@Override
	public List<MemberVO> getMemberList() {
		return mapper.getMemberList();
	}

	@Override
	public List<PensionVO> getPensionList() {
		return mapper.getPensionList();
	}

	@Override
	public int insertResvation(P_RESVO p_resVO) {
		return mapper.insertResvation(p_resVO);
	}

	@Override
	public List<P_RESVO> getDisableDate() {
		return mapper.getDisableDate();
	}

	@Override
	public List<P_RESVO> getResvationList() {
		return mapper.getResvationList();
	}

	@Override
	public int deleteRes(String imp_uid) {
		return mapper.deleteRes(imp_uid);
	}

}
