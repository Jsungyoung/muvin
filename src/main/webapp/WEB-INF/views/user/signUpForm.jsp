<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-14
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/signUp.css"/>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="container">
    <div class="login-wrapper">
        <h2>회원가입</h2>
        <div>
            <form name="signup" id="login-form" method="post" action="/user/signUp">
                <h4>아이디</h4>
                <input type="text" id="id" name="id" class="id" placeholder="아이디">
                <div><span id="myid" value="N"></span></div>

                <h4>비밀번호</h4>
                <input type="password" id="password" name="password" placeholder="비밀번호"
                       onkeyup="isSame();">
                <div><span id="space"></span></div>

                <h4>비밀번호 확인</h4>
                <input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인"
                       onkeyup="isSame();">
                <div><span id="same"></span></div>

                <h4>이름</h4>
                <input type="text" name="name" id="name" placeholder="이름">
                <div><span id="nameChk"></span></div>

                <h4>닉네임</h4>
                <input type="text" name="nickname" id="nickname" placeholder="닉네임">
                <div><span id="myNick" value="N"></span></div>

                <h4>전화번호</h4>
                <input type="text" name="phone" id="phone" onkeyup="phone_keyup(this)" maxlength="13" placeholder="전화번호">
                <div><span id="phoneChk"></span></div>

                <h4>생년월일</h4>
                <input type="text" name="birth" id="birth" placeholder="생년월일">

                <h4>이메일</h4>
                <input type="text" name="email" id="email" placeholder="이메일">
                <button type="button" class="btn btn-primary" id="mail-Check-Btn" value="N">메일인증</button>
                <input type="text" id="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
                <span id="mail-check-warn" value="N"></span>

                <button type="button" class="btn" onclick="sign_check();">회원가입</button>
                <button type="button" class="btn" onclick="location.href='/'">취소</button>
            </form>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp" />
<script type="text/javascript" src="/javascript/signUp.js"></script>
</body>
</html>
