<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-21
  Time: 오후 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <link rel="stylesheet" href="/css/login.css"/>
    <title>Title</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section class="container">
  <div class="login-wrapper">
    <h2>아이디 찾기</h2>
    <form method="post" action="/user/findId" id="login-form">
      <input type="text" name="name" id="name" placeholder="name">
      <input type="text" name="phone" id="phone" onkeyup="phone_keyup(this)" maxlength="13" placeholder="phone">
      <input type="submit" id="check" value="아이디 찾기">
      <button type="button" onclick="location.href='/user/loginForm '">취소</button>
    </form>
  </div>
</section>
<jsp:include page="../footer.jsp" />
<script type="text/javascript" src="/javascript/find.js"></script>
</body>
</html>
