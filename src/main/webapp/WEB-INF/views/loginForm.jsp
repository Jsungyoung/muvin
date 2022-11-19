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
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<button onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=6a4c077fca80e32384fcf93a071c6788&redirect_uri=http://localhost:8087/login&response_type=code'">코드 받기</button>
<button onclick="kakaoLogin()">카카오 로그인</button>
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
<script src="javascript/kakaoLogin.js"></script>
</body>
</html>
