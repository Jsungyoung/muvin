<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-19
  Time: 오후 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/css/signUp.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="container">
    <div class="login-wrapper">
        <h2>회원정보 수정</h2>
        <form name="update" id="login-form" method="post" action="/user/update">
            <h4>아이디</h4>
            <input type="text" value="${user.id}" disabled>
            <input type="hidden" id="id" value="${user.id}">

            <h4>비밀번호</h4>
            <input type="password" id="password" name="password" value="${user.password}" onkeyup="isSame();">
            <div><span id="space"></span></div>

            <h4>비밀번호 확인</h4>
            <input type="password" id="passwordCheck" name="passwordCheck" value="${user.password}" onkeyup="isSame();">
            <div><span id="same"></span></div>

            <h4>이름</h4>
            <input type="text" name="name" id="name" value="${user.name}">
            <div><span id="nameChk"></span></div>

            <h4>닉네임</h4>
            <input type="text" value="${user.nickname}" disabled>
            <div><span id="myNick" value="N"></span></div>

            <h4>전화번호</h4>
            <input type="text" name="phone" id="phone" onkeyup="phone_keyup(this)" value="${user.phone}">
            <div><span id="phoneChk"></span></div>

            <h4>생년월일</h4>
            <input type="text" name="birth" id="birth" value="${user.birth}">

            <h4>이메일</h4>
            <input type="text" value="${user.email}" disabled>


            <button type="button" class="btn" onclick="update_check();">수정</button>
            <button type="button" onclick="location.href='/user/mypage'">취소</button>
        </form>
    </div>
</section>
    <script type="text/javascript" src="/javascript/update.js"></script>
</body>
</html>
