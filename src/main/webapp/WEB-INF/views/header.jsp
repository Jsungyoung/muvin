<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-16
  Time: 오후 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/grid.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <title>muvin</title>
</head>
<body>
<c:set var="id" value="${sessionScope.log}"/>

<div class="log">
  <c:if test="${id == null }">
    <a href="/user/loginForm">로그인</a>
  </c:if>
  <c:if test="${id != null }">
      <c:out value="${id}님 환영합니다 / "/>
    <a href="/user/logout">로그아웃</a>
  </c:if>
</div>
<header><h1><a href="/">muvin</a></h1></header>
<nav class="nav_tab">
    <ul class="menu">
        <li><a href="/search">검색</a></li>
        <li><a href="/movieAll">영화</a></li>
        <li><a href="/dramaAll">TV</a></li>
        <li><a href="map">지도</a></li>
        <c:if test="${id != null }">
            <li><a href="/user/mypage">마이페이지</a></li>
        </c:if>
        <li><a href="/board">게시판</a></li>
    </ul>
</nav>
</body>
</html>
