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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<form name="signup" method="post" action="/signUp">
    <div>
        <h2>회원가입</h2>
        <div>
            <h4>아이디</h4>
            <input type="text" id="id" name="id" placeholder="Id">
        </div>
        <div>
            <h4>비밀번호</h4>
            <input type="password" id="password" name="password" placeholder="영문자+숫자+특수문자 조합 8~16자리" onkeyup="isSame();">
            <span id="space"></span>
        </div>
        <div>
            <h4>비밀번호 확인</h4>
            <input type="password" id="passwordCheck" name="passwordCheck" id="passwordCheck" placeholder="영문자+숫자+특수문자 조합 8~16자리" onkeyup="isSame();">
            <span id="same"></span>
        </div>
        <div>
            <h4>이름</h4>
            <input type="text" name="name" id="name" placeholder="한글만 입력">
        </div>
        <div>
            <h4>닉네임</h4>
            <input type="text" name="nickname" id="nickname" placeholder="특수문자 제외 2~10자리">
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
