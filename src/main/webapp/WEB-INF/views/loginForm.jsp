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
    <link rel="stylesheet" href="/css/login.css" />
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<input type="image" id="kakaoLoginBtn" src="/images/kakao_login_medium_narrow.png" onclick="kakaoLogin()" />
<form method="post" action="/login">
    <div>
        <h2>로그인</h2>
        <div>
            <h4>ID</h4>
            <input type="text" name="id" id="id" placeholder="Id">
        </div>
        <div>
            <h4>Password</h4>
            <input type="password" name="password" id="password" placeholder="Password">
        </div>
        <div>
            <input type="submit" value="로그인">
        </div>
    </div>
</form>
<script src="javascript/kakaoLogin.js?ver=3"></script>
</body>
</html>
