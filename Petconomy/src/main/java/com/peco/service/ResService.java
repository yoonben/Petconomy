package com.peco.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.peco.vo.H_RESVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.MemberVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionVO;

@Service
public interface ResService {
	public List<MemberVO> getMemberList();
	
	public List<PensionVO> getPensionList();
	
	public List<P_RESVO> getPensionDisableDate();
	
	public List<P_RESVO> getResPensionList();
	
	public int insertResvationPension(P_RESVO p_resVO);
	
	public int deleteResPension(String imp_uid);
	
	public List<HospitalVO> getHospitalList();
	
	public List<H_RESVO> getHospitalDisableDate();
	
	public List<H_RESVO> getResHospitalList();
	
	public int insertResvationHospital(H_RESVO h_resVO);
	
	public int deleteResHospital(String imp_uid);

}
