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
    <title>Title</title>
</head>
<body>
<form method="post" action="/delete">
    <div>
        <h2>회원탈퇴</h2>
        <div>
            <h4>Password</h4>
            <input type="password" name="password" id="password">
        </div>
        <div>
            <input type="submit" value="회원탈퇴">
            <button type="button" onclick="location.href='/mypage'">뒤로가기</button>
        </div>
    </div>
</form>
</body>
</html>
