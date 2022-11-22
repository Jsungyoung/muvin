<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-21
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/login.css"/>
    <title>Title</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="container">
    <div class="login-wrapper">
        <h2>회원탈퇴</h2>
        <form method="post" action="/user/delete" id="login-form">
            <h4>Password</h4>
            <input type="password" name="password" id="password">
            <input type="submit" value="회원탈퇴">
            <button type="button" onclick="location.href='/user/mypage'">뒤로가기</button>
        </form>
    </div>
</section>
</body>
</html>
