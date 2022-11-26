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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/672b3d82aa.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <head>
        <!-- favicon image -->
        <link rel="shortcut icon" href="파비콘이미지.png">

        <meta property="og:title" content="링크타이틀">
        <meta property="og:description" content="링크에대한설명">
        <meta property="og:image" content="이미지주소">

        <!-- ... -->
    </head>
    <title>muvin</title>
</head>
<body>
<c:set var="id" value="${sessionScope.log}"/>

<div class="log">
  <c:if test="${id == null }">
    <a href="/user/loginForm"><i class="fa-solid fa-right-to-bracket">로그인</i></a>
  </c:if>
  <c:if test="${id != null }">
      <c:out value="${id}님 / "/>
      <a href="/user/logout"><i class="fa-solid fa-right-from-bracket">로그아웃</i></a>
  </c:if>
</div>
<header><h1><a href="/">muvin</a></h1></header>
<nav class="nav_tab">
    <ul class="menu">
        <li><a href="/search">검색</a></li>
        <li><a href="/movieAll">영화</a></li>
        <li><a href="/dramaAll">TV</a></li>
        <li><a href="map">지도</a></li>
        <c:if test="${id != null && id ne 'admin'}">
            <li><a href="/user/mypage">마이페이지</a></li>
        </c:if>
        <c:if test="${id eq 'admin'}">
            <li><a href="/manager">관리</a></li>
        </c:if>
    </ul>
</nav>
</body>
</html>