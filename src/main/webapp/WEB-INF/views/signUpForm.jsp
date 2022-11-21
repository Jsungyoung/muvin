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
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>

<form name="signup" method="post" action="/signUp">
    <div>
        <h2>회원가입</h2>
        <div>
            <h4>아이디</h4>
            <input type="text" id="id" name="id" placeholder="Id">
            <button id="checkId" type="button" value="N">중복확인</button><br>
            <div><span id="myid" value="N"></span></div>
        </div>
        <div>
            <h4>비밀번호</h4>
            <input type="password" id="password" name="password" placeholder="영문자+숫자+특수문자 조합 8~16자리" onkeyup="isSame();">
            <div><span id="space"></span></div>
        </div>
        <div>
            <h4>비밀번호 확인</h4>
            <input type="password" id="passwordCheck" name="passwordCheck" placeholder="영문자+숫자+특수문자 조합 8~16자리" onkeyup="isSame();">
            <div><span id="same"></span></div>
        </div>
        <div>
            <h4>이름</h4>
            <input type="text" name="name" id="name" placeholder="한글만 입력해주세요">
        </div>
        <div>
            <h4>닉네임</h4>
            <input type="text" name="nickname" id="nickname" placeholder="특수문자를 넣을 수 없습니다">
            <button id="checkNick" type="button" value="N">중복확인</button><br>
            <div><span id="myNick" value="N"></span></div>
        </div>
        <div>
            <h4>전화번호</h4>
            <input type="text" name="phone" id="phone" placeholder="01x-xxxx-xxxx">
        </div>
        <div>
            <h4>생년월일</h4>
            <input type="text" name="birth" id="birth" placeholder="birth">
        </div>
        <div>
            <h4>이메일</h4>
            <input type="text" name="str_email01" id="str_email01"><span id="middle">@</span>
            <input type="text" name="str_email02" id="str_email02" readonly value="선택하세요">
            <select name="selectEmail" id="selectEmail">
                <option value="" selected>선택하세요</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.com">daum.net</option>
                <option value="gmail.com">gmail.com</option>
                <option value="1">직접입력</option>
            </select>
            <input type="hidden" id="email" name="email">
            <button type="button" class="btn btn-primary" id="mail-Check-Btn" value="N">메일인증</button>
        </div>
        <div class="mail-check-box">
            <input id="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
        </div>
        <span id="mail-check-warn" value="N"></span>
        </div>
        <div>
            <button type="button" class="btn" onclick="sign_check();">회원가입</button>
            <button type="button" onclick="location.href='/'">취소</button>
        </div>
    </div>
</form>

<script type="text/javascript" src="/javascript/signUp.js"></script>
</body>
</html>
