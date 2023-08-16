package com.peco.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.peco.vo.H_RESVO;
import com.peco.vo.HospitalFileuploadVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.MemberVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionFiileuploadVO;
import com.peco.vo.PensionVO;

@Service
public interface ResService {
	public List<MemberVO> getMemberList(String m_id);
	
	
	public List<PensionVO> getPensionList(String p_id, String room_no);
	
	public List<P_RESVO> getPensionDisableDate(String p_id, String room_no);
	
	public List<P_RESVO> getResPensionList(String m_id);
	
	public int insertResvationPension(P_RESVO p_resVO);
	
	public int deleteResPension(String imp_uid);
	
	public PensionFiileuploadVO getPesionImg(String p_id);
	
	public List<HospitalVO> getHospitalList(String h_id);
	
	public List<H_RESVO> getHospitalDisableDate(String h_id);
	
	public List<H_RESVO> getResHospitalList(String m_id);
	
	public int insertResvationHospital(H_RESVO h_resVO);
	
	public int deleteResHospital(String imp_uid);
	
	public HospitalFileuploadVO getHospitalImg(String h_id);


}