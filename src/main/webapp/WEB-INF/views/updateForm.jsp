<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-19
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="id" value="${sessionScope.log}"/>

<form name="signup" method="post" action="/update">
    <div>
        <h2>회원정보 수정</h2>
        <div>
            <h4>아이디</h4>
            <input type="text" id="id" name="id" value="${id}" readonly>
        </div>
        <div>
            <h4>비밀번호</h4>
            <input type="password" id="password" name="password" placeholder="영문자+숫자+특수문자 조합 8~16자리" onkeyup="isSame();">
            <div><span id="space"></span></div>
        </div>
        <div>
            <h4>비밀번호 확인</h4>
            <input type="password" id="passwordCheck" name="passwordCheck" id="passwordCheck" placeholder="영문자+숫자+특수문자 조합 8~16자리" onkeyup="isSame();">
            <div><span id="same"></span></div>
        </div>
        <div>
            <h4>이름</h4>
            <input type="text" name="name" id="name" placeholder="한글만 입력해주세요">
        </div>
        <div>
            <h4>닉네임</h4>
            <input type="text" name="nickname" id="nickname" placeholder="특수문자를 넣을 수 없습니다.">
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
            <input type="text" name="str_email02" id="str_email02" disabled value="선택하세요">
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
</body>
</html>
