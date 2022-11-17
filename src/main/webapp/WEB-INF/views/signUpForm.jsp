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
</head>
<body>
<form method="post" action="/signUp" modelAttribute="userDto">
    <div>
        <h2>signUp</h2>
        <div>
            <h4>아이디</h4>
            <input type="text" name="id" placeholder="Id">
        </div>
        <div>
            <h4>비밀번호</h4>
            <input type="password" name="password" placeholder="Password">
        </div>
        <div>
            <h4>비밀번호 확인</h4>
            <input type="password" name="passwordCheck" id="passwordCheck" placeholder="Password">
        </div>
        <div>
            <h4>이름</h4>
            <input type="text" name="name" id="name" placeholder="name">
        </div>
        <div>
            <h4>닉네임</h4>
            <input type="text" name="nickname" id="nickname" placeholder="nickname">
        </div>
        <div>
            <h4>전화번호</h4>
            <input type="text" name="phone" id="phone" placeholder="phone">
        </div>
        <div>
            <h4>생년월일</h4>
            <input type="text" name="birth" id="birth" placeholder="birth">
        </div>
        <div>
            <h4>이메일</h4>
            <input type="email" name="email" id="email" placeholder="email">
        </div>
        <div>
            <input type="submit" value="회원가입">
        </div>
    </div>
</form>
</body>
</html>
