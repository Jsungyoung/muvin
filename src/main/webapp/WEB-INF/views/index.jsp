<%@ page import="com.example.muvin.domain.user.UserDto" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-11-13
  Time: 오후 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/slide.css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body onload="loadMainMovie()">
<jsp:include page="header.jsp" />
<section>

<%--    <div><strong>지도</strong></div>--%>
<%--    <div class="movie-container map">--%>
<%--        <c:forEach items="${}" var="">--%>
<%--            <div class="movie" onclick="location.href='movieView?movie_id=${movie_id}';">--%>
<%--                <script src="/javascript/movieSearch.js">const path = getPosterById(${movie_id})</script>--%>
<%--                <div><img class="poster-img" src=`https://image.tmdb.org/t/p/original/${path}`></div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>



    <div style="font-size: 20px;"><strong>상위 랭킹</strong></div>
    <div class="movie-container rated"></div>

<%--    <div><strong>일일 박스오피스</strong></div>--%>
<%--    <div class="movie-container boxoffice"></div>--%>

    <div style="font-size: 20px;"><strong>인기 영화</strong></div>
    <div class="movie-container popular"></div>


</section>
<footer>
    선준 진규 성영 진아 승우
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="></script>
</body>
<script src="/javascript/movieSearch.js"></script>
<script src="/javascript/loadMain.js"></script>
</html>
