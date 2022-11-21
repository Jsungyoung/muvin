<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-17
  Time: 오후 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="/css/contentAll.css">
</head>
<body onload="javascript:getDramaByGenre()">
<jsp:include page="../header.jsp" />
<section>

  <h3 class="category">국가</h3>
  <ul class="nation">
    <li class="nation_name click_nation" id="" onclick="handleNation()">전체</li>
    <li class="nation_name" id="ko" onclick="handleNation()">국내</li>
    <li class="nation_name" id="es" onclick="handleNation()">남미</li>
    <li class="nation_name" id="en" onclick="handleNation()">영미</li>
    <li class="nation_name" id="ja" onclick="handleNation()">일본</li>
    <li class="nation_name" id="zh" onclick="handleNation()">중국</li>
  </ul>

  <h3 class="category">장르</h3>
  <ul class="genre">
    <li class="genre_name" id="" onclick="getDramaByGenre(this.id)">전체</li>
    <li class="genre_name" id="10759" onclick="getDramaByGenre(this.id)">액션/모험</li>
    <li class="genre_name" id="35" onclick="getDramaByGenre(this.id)">코미디</li>
    <li class="genre_name" id="80" onclick="getDramaByGenre(this.id)">범죄</li>
    <li class="genre_name" id="99" onclick="getDramaByGenre(this.id)">다큐멘터리</li>
    <li class="genre_name" id="18" onclick="getDramaByGenre(this.id)">드라마</li>
    <li class="genre_name" id="10751" onclick="getDramaByGenre(this.id)">가족</li>
    <li class="genre_name" id="10762" onclick="getDramaByGenre(this.id)">어린이용</li>
    <li class="genre_name" id="9648" onclick="getDramaByGenre(this.id)">미스터리</li>
    <li class="genre_name" id="10765" onclick="getDramaByGenre(this.id)">SF/판타지</li>
    <li class="genre_name" id="10766" onclick="getDramaByGenre(this.id)">연속극</li>
    <li class="genre_name" id="10768" onclick="getDramaByGenre(this.id)">전쟁/정치</li>
    <li class="genre_name" id="37" onclick="getDramaByGenre(this.id)">서부</li>
  </ul>

  <div class="content_all"></div>
</section>
<script src="/javascript/dramaAll.js"></script>
<script src="/javascript/dramaSearch.js"></script>
</body>
</html>
