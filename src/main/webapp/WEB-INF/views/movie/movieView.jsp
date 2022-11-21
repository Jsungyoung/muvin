<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-16
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/movieView.css">
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<c:set let="movie_id" value="2" scope="request"/>--%>
<body onload="javascript:getMovie(${movie_id})">
<jsp:include page="../header.jsp" />

<section>
    <div class = movie-view></div>

    <div style="margin: 10px auto; display: flex; align-items: flex-end; width: 80vw;">
        <div>키워드</div>
        <div>별점 매기는 거...........</div>
    </div>
    <div>
    <%-- 콘텐츠 주요 정보 하단에 선택할 nav 탭--%>
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#details">상세정보</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#map">촬영지</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#actors">출연진</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#related">관련영화</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reviews">리뷰</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#temp">임시탭</a></li>
        </ul>
    </div>

    <div class="tab-content">
        <div class="tab-pane fade show active" id="details">
            <p>감독</p>
            <p>출연진 리스트</p>
            <p>관람등급</p>
            <p>누적관객수</p>
        </div>
        <div class="tab-pane fade" id="map">
            <p>지도 로드만 하고? 더보기.. 자세히보기.. 이런 거 누르면 넘어가기</p>
            <img src="/images/mapsample.png">
            <input type="button" onclick="visableAddForm()" value="장소 등록" />
            <div class="plaseContainer">

                <form>
                    <input type="hidden" name="movieId"/>

                </form>
            </div>
        </div>
        <div class="tab-pane fade" id="actors">
        </div>
        <div class="tab-pane fade" id="related">
            <p>관련 영화 리스트 . . .  ajax? 이거 하려면,, 흠..api 확인하기</p>
        </div>
        <div class="tab-pane fade" id="reviews">
            <p>리뷰 작성하기</p>
            <p>리뷰 로드하기</p>
        </div>
        <div class="tab-pane fade" id="temp">
            <p>준 ㅂㅣ 중 . . .</p>
        </div>
    </div>
</section>
<script src="/javascript/movieSearch.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
