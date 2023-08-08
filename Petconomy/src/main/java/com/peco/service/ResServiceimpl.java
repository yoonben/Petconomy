package com.peco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peco.mapper.ResMapper;
import com.peco.vo.H_RESVO;
import com.peco.vo.HospitalVO;
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
	public int insertResvationPension(P_RESVO p_resVO) {
		return mapper.insertResvationPension(p_resVO);
	}

	@Override
	public List<P_RESVO> getPensionDisableDate() {
		return mapper.getPensionDisableDate();
	}

	@Override
	public List<P_RESVO> getResPensionList() {
		return mapper.getResPensionList();
	}

	@Override
	public int deleteResPension(String imp_uid) {
		return mapper.deleteResPension(imp_uid);
	}

	@Override
	public List<HospitalVO> getHospitalList() {
		return mapper.getHospitalList();
	}

	@Override
	public List<H_RESVO> getHospitalDisableDate() {
		return mapper.getHospitalDisableDate();
	}

	@Override
	public List<H_RESVO> getResHospitalList() {
		return mapper.getResHospitalList();
	}

	@Override
	public int insertResvationHospital(H_RESVO h_resVO) {
		return mapper.insertResvationHospital(h_resVO);
	}

	@Override
	public int deleteResHospital(String imp_uid) {
		return mapper.deleteResHospital(imp_uid);
	}

}
