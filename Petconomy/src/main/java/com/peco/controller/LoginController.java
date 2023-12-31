package com.peco.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peco.controller.CommonRestController;
import com.peco.service.KakaoService;
import com.peco.service.MailSendService;
import com.peco.service.MemberService;
import com.peco.vo.MemberVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/peco/*")
@Log4j
public class LoginController extends CommonRestController {

	@Autowired
	MemberService memberService;

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		
		return "login";
	}
	
	@GetMapping("/main")
	public String main() {
		return "/main/mainpage";
	}

	@PostMapping("/loginAction")
	public @ResponseBody Map<String, Object> loginAction(@RequestBody MemberVO member, Model model,
			HttpSession session) {

		member = memberService.login(member);
		if (member != null) {
			session.setAttribute("member", member);
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "로그인 되엇습니다.");
			map.put("url", "/peco/main/mainpage");

			return map;
		} else {

			return responseMap(REST_FAIL, "아이디와 비밀번호를 확인해주세요");
		}

	}
	
	@PostMapping("/updatepw")
	public @ResponseBody Map<String, Object> updatepw(@RequestBody MemberVO member, Model model,
			HttpSession session) {

		int res = memberService.updatePw(member);
		if (res > 0) {
			return responseMap(REST_SUCCESS, "비밀 번호가 변경되었습니다.");
		} else {

			return responseMap(REST_FAIL, "비밀 번호 변경중 오류가 발생하였습니다.");
		}

	}

	@PostMapping("/register")
	public @ResponseBody Map<String, Object> register(@RequestBody MemberVO member, Model model) {

		try {

			int res = memberService.insert(member);
			
			System.out.println("member1=========================="+member);
			
			member = memberService.apiLogin(member);

			System.out.println("member2=========================="+member);
			
			Map<String, Object> map = responseWriteMap(res);
			
			map.put("m_id", member.getM_id());
			
			return map;

		} catch (Exception e) {
			e.printStackTrace();
			return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
		}
	}

	@PostMapping("/idCheck")
	public @ResponseBody Map<String, Object> idCheck(@RequestBody MemberVO member) {
		int res = memberService.idCheck(member);

		if (res == 0) {
			return responseMap(REST_SUCCESS, "사용가능한 아이디 입니다.");
		} else {
			return responseMap(REST_FAIL, "이미 사용중인 아이디 입니다.");
		}

	}

	@PostMapping("/nicknameCheck")
	public @ResponseBody Map<String, Object> nicknameCheck(@RequestBody MemberVO member) {
		int res = memberService.nicknameCheck(member);

		if (res == 0) {
			return responseMap(REST_SUCCESS, "사용가능한 닉네임 입니다.");
		} else {
			return responseMap(REST_FAIL, "이미 사용중인 닉네임 입니다.");
		}

	}
	
	@PostMapping("/findId")
	public @ResponseBody Map<String, Object> findId(@RequestBody MemberVO member) {
		System.out.println(member.getMname());
		
		int res = memberService.nameCheck(member);
		
		if (res > 0) {
			MemberVO findid = memberService.findId(member);
			return responseMap(REST_SUCCESS, findid.getId());
		} else {
			return responseMap(REST_FAIL, "아이디를 찾을 수 없습니다.이름을 확인해주세요");
		}

	}
	
	@PostMapping("/findpw")
	public @ResponseBody Map<String, Object> findpw(@RequestBody MemberVO member) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int res = memberService.idCheck(member);
		
		if (res > 0) {
			MemberVO vo = memberService.apiLogin(member);
			System.out.println("email===================="+vo.getEmail());
			System.out.println("m_id===================="+vo.getM_id());
			map.put("email", vo.getEmail());
			map.put("m_id", vo.getM_id());
			
			return map;
		} else {
			return responseMap(REST_FAIL, "아이디를 찾을 수 없습니다.");
		}

	}
	
	@GetMapping("/naver_callback")
	public String naverLogin_callback(HttpServletRequest request, HttpSession session, Model model) {
		Map<String, String> naverData = memberService.naverLogin(request, model);

		MemberVO member = new MemberVO();

		member.setId(naverData.get("id"));

		int res = memberService.idCheck(member);

		if (res > 0) {
			System.out.println("======naver로그인=======");
			member = memberService.apiLogin(member);
			if (member == null) {
				responseMap(REST_FAIL, "네이버 로그인중 오류가 발생하였습니다.");

				return "/login";
			}
			session.setAttribute("member", member);
	        
	        return "redirect:/peco/main";

		} else {
			System.out.println("======naver회원가입=======");

			boolean showSignupForm = true; // 회원가입 폼을 보여줄지 여부를 결정하는 변수
			model.addAttribute("showSignupForm", showSignupForm);

			return "/login";
		}

	}
	
	@Autowired
	KakaoService kakaoService;
	
	@RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
	public String redirectkakao(@RequestParam String code, HttpSession session,  Model model) throws IOException {
		System.out.println("code:: " + code);

		// 접속토큰 get
		String kakaoToken = kakaoService.getReturnAccessToken(code);

		// 접속자 정보 get
		Map<String, Object> result = kakaoService.getUserInfo(kakaoToken);
		log.info("result:: " + result);
		String snsId = (String) result.get("id");
		String userName = (String) result.get("nickname");
		String email = (String) result.get("email");
		
		// 분기
		MemberVO memberVO = new MemberVO();
		// 일치하는 snsId 없을 시 회원가입
		memberVO.setId(snsId);
		System.out.println(memberService.idCheck(memberVO));
		if (memberService.idCheck(memberVO) < 1) {
			log.warn("카카오로 회원가입");
			
			boolean showSignupForm = true; // 회원가입 폼을 보여줄지 여부를 결정하는 변수
			model.addAttribute("showSignupForm", showSignupForm);

			model.addAttribute("apiId", snsId);
			model.addAttribute("apiName", userName);
			model.addAttribute("apiEmail", email);
			
			return "/login";
		}else {
		
			System.out.println("======naver로그인=======");
			
			memberVO = memberService.apiLogin(memberVO);
			if (memberVO == null) {
				responseMap(REST_FAIL, "카카오 로그인중 오류가 발생하였습니다.");

				return "/login";
			}
			session.setAttribute("member", memberVO);
	        
	        return "redirect:/peco/main";

		}

	}

	

	@Autowired
	private MailSendService mailService;

	// 이메일 인증
	@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheck(String email) {
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
		}
	
	@GetMapping("/mailCheck2")
	@ResponseBody
	public String mailCheck2(String email) {
		System.out.println("이메일 인증 요청이 들어옴2!");
		System.out.println("이메일 인증 이메일2 : " + email);
		return mailService.joinEmail2(email);
	}
}
