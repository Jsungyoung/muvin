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
<body onload="loadMovie()">
<jsp:include page="header.jsp" />
<section>

    <button onclick="location.href='/next'" value="영화 페이지"></button>

    <div><strong>지도</strong></div>
    <div class="movie-container map"></div>

    <div><strong>일일 박스오피스</strong></div>
    <div class="movie-container boxoffice"></div>

    <div><strong>인기 영화</strong></div>
    <div class="movie-container popular"></div>

    <div class="gallery">
        <ul class="clearfix">
            <li><div class="img">box4</div></li>
            <li><div class="img">box5</div></li>
            <li><div class="img"><img src="/images/sampleimg8.jpg"></div></li>
            <li><div class="img">box2</div></li>
            <li><div class="img">box3</div></li>
            <li><div class="img">box4</div></li>
            <li><div class="img">box5</div></li>
            <li><div class="img">box1</div></li>
        </ul>
    </div>

    <div class="g_item">
        <ul>
            <li class="on"></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>

    <div class="container-holder">
        <div class="click-prev nav-button">◀</div>
        <div class="outsideViewBefore container"><img src="/images/sampleimg1.jpg" /></div>
        <div class="inView1 container"><img src="/images/sampleimg2.jpg" /></div>
        <div class="inView2 container"><img src="/images/sampleimg3.jpg" /></div>
        <div class="inView3 container"><img src="/images/sampleimg4.jpg" /></div>
        <div class="inView4 container"><img src="/images/sampleimg5.jpg" /></div>
        <div class="inView5 container"><img src="/images/sampleimg6.jpg" /></div>
        <div class="outsideViewAfter container"><img src="/images/sampleimg7.jpg" /></div>
        <div class="click-next nav-button">▶</div>
    </div>

</section>
<footer>
    선준 진규 성영 진아 승우
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="></script>
</body>
<script src="/javascript/movieSearch.js"></script>
<script src="/javascript/slide.js"></script>
</html>
