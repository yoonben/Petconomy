package com.peco.mapper;

import com.peco.vo.MemberVO;;

public interface MemberMapper {
	
	public MemberVO login(MemberVO member);
	public int insert(MemberVO member);
	public int idCheck(MemberVO member);
	public int nicknameCheck(MemberVO member);
	public MemberVO apiLogin(MemberVO apiMember);
	public MemberVO member_getOne(String m_id);
	public int update(MemberVO vo);
	public int nameCheck(MemberVO member);
	public MemberVO findId(MemberVO member);
}
