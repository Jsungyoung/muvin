<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-14
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/login.css"/>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="container">
    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="/user/login" id="login-form">
            <input type="text" name="id" id="id" placeholder="ID">
            <input type="password" name="password" id="password" placeholder="Password">
            <input type="submit" value="로그인">
            <a href="/user/findIdForm">아이디 찾기</a>
            <span>ㅣ</span>
            <a href="/user/findPwForm">비밀번호 찾기</a>
            <span>ㅣ</span>
            <a href="/user/signUpForm">회원가입</a>
        </form>
    </div>
    <input type="image" id="kakaoLoginBtn" src="/images/kakao_login_medium_narrow.png" onclick="kakaoLogin()"/>
</section>
<script src="/javascript/kakaoLogin.js?ver=3"></script>
</body>
</html>
