<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${member.nickname}<br>
 아이디 : ${member.id }<br>
  이름 : ${member.mname }<br>
 이메일 : ${member.email }<br>
 	<a href="/peco/profile?m_id=${member.m_id} ">프로필로 이동</a>
</body>
</html>