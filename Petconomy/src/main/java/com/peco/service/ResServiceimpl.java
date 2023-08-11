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
	public List<MemberVO> getMemberList(String m_id) {
		return mapper.getMemberList(m_id);
	}

	@Override
	public List<PensionVO> getPensionList(String p_id, String room_no) {
		return mapper.getPensionList(p_id, room_no);
	}

	@Override
	public int insertResvationPension(P_RESVO p_resVO) {
		return mapper.insertResvationPension(p_resVO);
	}

	@Override
	public List<P_RESVO> getPensionDisableDate(String p_id, String room_no) {
		return mapper.getPensionDisableDate(p_id, room_no);		
	}

	@Override
	public List<P_RESVO> getResPensionList(String m_id) {
		return mapper.getResPensionList(m_id);
	}

	@Override
	public int deleteResPension(String imp_uid) {
		return mapper.deleteResPension(imp_uid);
	}

	@Override
	public List<HospitalVO> getHospitalList(String h_id) {
		return mapper.getHospitalList(h_id);
	}

	@Override
	public List<H_RESVO> getHospitalDisableDate(String h_id) {
		return mapper.getHospitalDisableDate(h_id);
	}

	@Override
	public List<H_RESVO> getResHospitalList(String m_id) {
		return mapper.getResHospitalList(m_id);
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