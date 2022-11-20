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
<body onload="javascript:getMovie(${param.movie_id});">
<jsp:include page="../header.jsp" />

<section>
    <div id="movie-title"><strong>스파이더맨: 파 프롬 홈</strong></div>
    <div class="movie-info">
    <%-- 상단 콘텐츠 이미지/제목 등 주요 정보 들어갈 자리--%>
        <div class="image-container"><img class="image" src="/images/testspiderman.jpg"></div>
        <table>
            <tbody>
                <tr>
                    <td>year</td>
                    <td>2019</td>
                </tr>
                <tr>
                    <td>심의</td>
                    <td>12세</td>
                </tr>
                <tr>
                    <td>별점</td>
                    <td>가져오기</td>
                </tr>
                <tr>
                    <td>장르</td>
                    <td>액션</td>
                </tr>
                <tr>
                    <td>상영 시간</td>
                    <td>2시간 9분</td>
                </tr>
            </tbody>
        </table>
    </div>
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
            <p>엔드게임 이후 피터 파커는 친구들과 유럽 여행을 떠난다. 하지만 이내 닉 퓨리의 요청으로 정체불명의 조력자 미스테리오와 함께 세계를 위협하는 엘리멘탈 크리쳐스에 맞서야 하는 상황에 처한다.</p>
            <p>감독</p>
            <p>출연진 리스트</p>
            <p>관람등급</p>
            <p>누적관객수</p>
        </div>
        <div class="tab-pane fade" id="map">
            <p>지도 로드만 하고? 더보기.. 자세히보기.. 이런 거 누르면 넘어가기</p>
            <img src="/images/mapsample.png">
        </div>
        <div class="tab-pane fade" id="actors">
            <p>출연진.. 시간이 남으면 클릭 시 넘어가융 아니면 그냥 리스트업</p>
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
