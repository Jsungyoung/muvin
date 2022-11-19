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
  <link rel="stylesheet" href="/css/movieAll.css">
</head>
<body onload="javascript:getAllMovie()">
<jsp:include page="../header.jsp" />
  <section>
    <h3 class="category">장르</h3>
    <ul class="genre">
      <li class="genre_name" id="" onclick="getMovieByGenre(this.id)">전체</li>
      <li class="genre_name" id="28" onclick="getMovieByGenre(this.id)">액션</li>
      <li class="genre_name" id="12" onclick="getMovieByGenre(this.id)">모험</li>
      <li class="genre_name" id="16" onclick="getMovieByGenre(this.id)">애니메이션</li>
      <li class="genre_name" id="35" onclick="getMovieByGenre(this.id)">코미디</li>
      <li class="genre_name" id="80" onclick="getMovieByGenre(this.id)">범죄</li>
      <li class="genre_name" id="99" onclick="getMovieByGenre(this.id)">다큐멘터리</li>
      <li class="genre_name" id="18" onclick="getMovieByGenre(this.id)">드라마</li>
      <li class="genre_name" id="10751" onclick="getMovieByGenre(this.id)">가족</li>
      <li class="genre_name" id="14" onclick="getMovieByGenre(this.id)">판타지</li>
      <li class="genre_name" id="36" onclick="getMovieByGenre(this.id)">역사</li>
      <li class="genre_name" id="27" onclick="getMovieByGenre(this.id)">공포</li>
      <li class="genre_name" id="10402" onclick="getMovieByGenre(this.id)">음악</li>
      <li class="genre_name" id="9648" onclick="getMovieByGenre(this.id)">미스터리</li>
      <li class="genre_name" id="10749" onclick="getMovieByGenre(this.id)">로맨스</li>
      <li class="genre_name" id="878" onclick="getMovieByGenre(this.id)">SF</li>
      <li class="genre_name" id="10770" onclick="getMovieByGenre(this.id)">TV 영화</li>
      <li class="genre_name" id="53" onclick="getMovieByGenre(this.id)">스릴러</li>
      <li class="genre_name" id="10752" onclick="getMovieByGenre(this.id)">전쟁</li>
      <li class="genre_name" id="37" onclick="getMovieByGenre(this.id)">서부</li>
    </ul>

    <div class="movie_all"></div>
  </section>
<script src="/javascript/movieAll.js"></script>
<script src="/javascript/movieSearch.js"></script>
</body>
</html>
