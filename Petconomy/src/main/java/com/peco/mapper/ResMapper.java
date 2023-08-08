package com.peco.mapper;

import java.util.List;

import com.peco.vo.H_RESVO;
import com.peco.vo.HospitalVO;
import com.peco.vo.MemberVO;
import com.peco.vo.P_RESVO;
import com.peco.vo.PensionVO;

public interface ResMapper {
	
	public List<MemberVO> getMemberList(); //멤버정보
	
	public List<PensionVO> getPensionList();//펜션정보
	
	public List<P_RESVO> getPensionDisableDate();//펜션예약불가날짜
	
	public List<P_RESVO> getResPensionList(); //펜션예약내역조회
	
	public int insertResvationPension(P_RESVO p_resVO); //펜션예약하기
	
	public int deleteResPension(String imp_uid); //펜션예약정보 삭제
	
	public List<HospitalVO> getHospitalList();//병원정보
	
	public List<H_RESVO> getHospitalDisableDate();//병원예약불가날짜
	
	public List<H_RESVO> getResHospitalList(); //병원예약내역조회
	
	public int insertResvationHospital(H_RESVO h_resVO); //병원예약하기
	
	public int deleteResHospital(String imp_uid); //병원예약정보 삭제
	
	
}
