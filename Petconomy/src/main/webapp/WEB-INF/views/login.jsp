<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src='/resources/js/jquery-3.7.0.js'></script>

<script src="/resources/js/login.js"></script>

<title>페코 로그인</title>


<!-- Bootstrap core CSS -->
<%@include file="./commo/css.jsp"%>
</head>

<body>

	<!-- header -->
	<%@include file="./main/header.jsp"%>

	<!-- 로그인 -->
	<div class="container">
		<div class="page-content" style="background-color: bisque;">
			<!-- ***** login Start *****-->
			<div class="page-login">
			
			<form name="signinForm" id="signinForm"
				<c:if test="${not empty showSignupForm}"> style='display: none;' </c:if>>
				<div class="login-img">
					<!-- 이미지 -->
				</div>
				<div id="msg">
					<h1 class="h3 mb-3 fw-normal" style="color: #ec6090">로그인</h1>
				</div>

				<div class="form-login">
					<input type="text" class="form-control" id="id" placeholder="아이디"> 
				</div>
				<div class="form-login">
					<input type="password" class="form-control" id="pw" placeholder="비밀번호"> 
				</div>

				<button class="w-100 btn btn-lg btn-warning" type="submit"
					id="btnLogin">Login</button>
				
				<div class="login-menu">
					<div class="login-menu_left">
						<a class="mt-5 mb-3 text-muted" id='btnSignupView'>회원가입</a>
					</div>
					
					<div class="login-menu_right">
						<a class="mt-5 mb-3 text-muted" id='btnPasswordResetView'>비밀번호 찾기</a>
					</div>
					
					<div class="login-menu_right">
						<a class="mt-5 mb-3 text-muted">/</a>
					</div>
					<div class="login-menu_right">
						<a class="mt-5 mb-3 text-muted" id='openModalButton'>아이디 찾기</a>
					</div>
				</div>
					<p class="text-muted text-or"> 또는 </p>
				
				<!-- 네이버 로그인 -->
				<%
					String clientId = "vThUa8bHb7IlAn52GUi5";//애플리케이션 클라이언트 아이디값";
					String redirectURI = URLEncoder.encode("http://localhost:8080/peco/naver_callback", "UTF-8");
					SecureRandom random = new SecureRandom();
					String state = new BigInteger(130, random).toString();

					// 요청URL -> 네이버 로그인및 사용자정보제공 동의 -> 콜백으로 코드를 제공
					String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					apiURL += "&client_id=" + clientId;
					apiURL += "&redirect_uri=" + redirectURI;
					apiURL += "&state=" + state;
					session.setAttribute("state", state);
				%>
				
				<div class="login-api">
					<a href="<%=apiURL%>"><img height="50px"
						src="/resources/img/naver_login.jpg" /></a>
				</div>
				<!-- 네이버 로그인 end-->

				<!-- 카카오 로그인 -->
				<div class="login-api" >
					<img alt="카카오로그인" height="50px"
						src="/resources/img/certi_kakao_login.png"
						onclick="loginWithKakao()">	
				</div>	

				<script type="text/javascript"
					src="https://developers.kakao.com/sdk/js/kakao.min.js"
					charset="utf-8"></script>
				<script type="text/javascript">
					$(document).ready(function() {
						Kakao.init('5b1adb5037f620021df4924bf30ee375');
						Kakao.isInitialized();
					});

					function loginWithKakao() {
						Kakao.Auth
								.authorize({
									redirectUri : 'http://localhost:8080/peco/kakao_callback'
								}); // 등록한 리다이렉트uri 입력
					}
				</script>
				<!-- 카카오 로그인 End -->
			</form>
			<!-- ***** login End ***** -->
			
			<!-- 모달 -->
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close">&times;</span>
				    <h1 class="h3 mb-3 fw-normal text-dark">아이디 찾기</h1>
				     
				    <form >
				    	<input type="text" name="findname" id="findname" placeholder="이름">
				    	<input type="submit" value="아이디 찾기" id="findIdbtn">
				    </form>
				    	<div id="findIdText"></div>
				  </div>
				</div>
				
				<div id="passwordResetModal" class="modal">
				    <div class="modal-content">
				        <span class="close">&times;</span>
				        <h1 class="h3 mb-3 fw-normal text-dark">비밀번호 찾기</h1>
				
				        <form>
				        	<input type="text" id="emailpwCheckRes">
				            <input type="text" name="findid" id="findid" placeholder="아이디">
				            <input type="submit" value="아이디 인증" id="findPasswordbtn">
				            <div class="form-group email-form">
								 <div class="input-group">
									<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
								</div>
							<div class="form-login">
								<div class="input-group-addon">
									<button type="button" class="btn btn-primary" id="mail-Check-Btn2">본인인증</button>
								</div>
								<div class="mail-check-box2">
									<input class="form-control mail-check-input2" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
								</div>
							</div>   
								<span id="mail-check-warn"></span>
							</div>
				        </form>
				        <div id="findPasswordText"></div>
				    </div>
				</div>
			<!-- 모달 끝 -->
			<!-- ***** 회원 가입 ***** -->
			<form name='signupForm' id='signupForm'
				<c:if test="${empty showSignupForm}"> style='display: none;' </c:if>>

				<div class="login-img">
					<!-- 이미지 -->
				</div>


				<!-- 회원 가입 체크 인풋 -->
				<c:if test="${empty showSignupForm}">
					<input type="hidden" id="idCheckRes">
				</c:if>
				<c:if test="${not empty showSignupForm}">
					<input type="hidden" id="idCheckRes" value="1">
				</c:if>
				
				
				<c:if test="${empty showSignupForm}">
					<input type="hidden" id="emailCheckRes">
				</c:if>
				<c:if test="${not empty showSignupForm}">
					<input type="hidden" id="emailCheckRes" value="1">
				</c:if>

				<c:if test="${empty showSignupForm}">
					<input type="hidden" id="pwCheckRes">
				</c:if>
				<c:if test="${not empty showSignupForm}">
					<input type="hidden" id="pwCheckRes" value="1">
				</c:if>

				<input type="hidden" id="nickNameRes">
				 
				<input type="hidden" name="m_id" id="m_id" value="">
				
				<h1 class="h3 mb-3 fw-normal" style="color: #ec6090">회원가입</h1>
				<div id="signupMsg"></div>
				<div class="form-login">
					<div class="text-line">
						<input type="text" class="form-control" id="signUpName"	
						value="${apiName }" placeholder="이름"> 
					</div>
				</div>

				<c:if test="${empty showSignupForm}">
					<div class="form-login">
						<div class="text-btnline">
							<input type="text" class="form-control" id="signUpId" 
							value="${apiId }" placeholder="아이디"> 
						</div>
						<div class="text-btn">
							<button class="btn btn-warning" type="button" id="btnid" >중복 확인</button>
						</div>
					</div>
				</c:if>

				<c:if test="${not empty showSignupForm}">
					<div class="form-login">
						<input type="hidden" class="form-control" id="signUpId" value="${apiId }">
					</div>
				</c:if>

				<c:if test="${empty showSignupForm}">
					<div class="form-login"> 
						<div class="text-line">
							<input type="password" class="form-control" id="signUpPw"
							placeholder="비밀번호" >
						</div>
					</div>

					<div class="form-login">
						<div class="text-line">
							<input type="password" class="form-control" id="pwCheck"
							placeholder="비밀번호 확인" >
						</div>
					</div>
				</c:if>

				<c:if test="${not empty showSignupForm}">
					<div class="form-login">
						<label for="signUpPw">Password</label>
						<input type="hidden" class="form-control" id="signUpPw"	value="null"> 
					</div>

					<div class="form-login">
						<label for="signUpPwCheck">Password Check</label>
						<input type="hidden" class="form-control" id="pwCheck" value="null"> 
					</div>
				</c:if>

				<div class="form-login">
					<div class="text-btnline">
						<input type="text" class="form-control" id="nickName" placeholder="닉네임"> 
					</div>
					<div class="text-btn">
						<button class="btn btn-warning" type="button" id="btnNickName">중복 확인</button>
					</div>
				</div>
				
				<div class="text-line">
					<div class="form-login">
						<input type="text" class="form-control" id="age" placeholder="나이"> 
					</div>
				</div>

				<c:if test="${empty showSignupForm}">
					<div class="form-login">
						<%@include file="./emailCheck.jsp"%>
						<input type="hidden" id="email">
					</div>
				</c:if>

				<c:if test="${not empty showSignupForm}">
					<div class="form-login">
						<input type="hidden" id="email" value=${apiEmail }>
					</div>
				</c:if>
				
				<div class="text-line">
					<div class="form-login">
						<input type="text" class="form-control" id="phone" 
						value="${apiMobile }" placeholder="핸드폰 번호"> 
					</div>
				</div>

				<div class="form-login">
					<label for="signUpPwCheck">프로필첨부</label>
					<input type="file" class="form-control" id="files" name="files">
				</div>


				<button class="w-100 btn btn-lg btn-warning" type="submit"  id="btnSignup">회원가입</button>
				<a class="mt-5 mb-3 text-muted" id='btnSigninView'>로그인</a>
			</form>
			</div>
			<!-- ***** 회원가입 End ***** -->
		</div>
	</div>


	<footer> </footer>


	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.min.js"
		integrity="sha512-8Y8eGK92dzouwpROIppwr+0kPauu0qqtnzZZNEF8Pat5tuRNJxJXCkbQfJ0HlUG3y1HB3z18CSKmUo7i2zcPpg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script src="/resources/assets/js/isotope.min.js"></script>
	<script src="/resources/assets/js/owl-carousel.js"></script>
	<script src="/resources/assets/js/tabs.js"></script>
	<script src="/resources/assets/js/popup.js"></script>
	<script src="/resources/assets/js/custom.js"></script>


</body>

</html>