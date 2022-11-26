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
<body onload="javascript:getMovieByGenre()">
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
      <li class="genre_name click_genre" id="" onclick="handleGenre()">전체</li>
      <li class="genre_name" id="28" onclick="handleGenre()">액션</li>
      <li class="genre_name" id="12" onclick="handleGenre()">모험</li>
      <li class="genre_name" id="16" onclick="handleGenre()">애니메이션</li>
      <li class="genre_name" id="35" onclick="handleGenre()">코미디</li>
      <li class="genre_name" id="80" onclick="handleGenre()">범죄</li>
      <li class="genre_name" id="99" onclick="handleGenre()">다큐멘터리</li>
      <li class="genre_name" id="18" onclick="handleGenre()">드라마</li>
      <li class="genre_name" id="10751" onclick="handleGenre()">가족</li>
      <li class="genre_name" id="14" onclick="handleGenre()">판타지</li>
      <li class="genre_name" id="36" onclick="handleGenre()">역사</li>
      <li class="genre_name" id="27" onclick="handleGenre()">공포</li>
      <li class="genre_name" id="10402" onclick="handleGenre()">음악</li>
      <li class="genre_name" id="9648" onclick="handleGenre()">미스터리</li>
      <li class="genre_name" id="10749" onclick="handleGenre()">로맨스</li>
      <li class="genre_name" id="878" onclick="handleGenre()">SF</li>
      <li class="genre_name" id="10770" onclick="handleGenre()">TV 영화</li>
      <li class="genre_name" id="53" onclick="handleGenre()">스릴러</li>
      <li class="genre_name" id="10752" onclick="handleGenre()">전쟁</li>
      <li class="genre_name" id="37" onclick="handleGenre()">서부</li>
    </ul>

    <div class="content_all"></div>
  </section>
<jsp:include page="../footer.jsp" />
<script src="/javascript/movieAll.js"></script>
<script src="/javascript/movieSearch.js"></script>
</body>
</html>
