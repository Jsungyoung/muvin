<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-21
  Time: 오후 6:08
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
        <h2>비밀번호 찾기</h2>
        <form method="post" action="/user/findPw" id="login-form">
            <input type="text" name="id" id="id" placeholder="ID">
            <input type="text" name="email" id="email" placeholder="email">
            <input type="submit" value="비밀번호 찾기">
            <button type="button" onclick="location.href='/user/loginForm '">취소</button>
        </form>
    </div>
</section>
</body>
</html>
