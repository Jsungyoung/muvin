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
    <link rel="stylesheet" href="/css/contentView.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
</head>
<body onload="javascript:getDrama(${drama_id})">
<jsp:include page="../header.jsp" />

<section>
    <div class = drama-view></div>

    <div style="margin: 10px auto; display: flex; align-items: flex-end; width: 80vw;">
<%--        <div>별점 매기는 거...........</div>--%>
    </div>
    <div>
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#details">상세정보</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#mapz">촬영지</a></li>
<%--            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#actors">출연진</a></li>--%>
<%--            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#related">관련영화</a></li>--%>
<%--            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reviews">리뷰</a></li>--%>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#season">시즌</a></li>
        </ul>
    </div>

    <div class="tab-content">
        <div class="tab-pane fade show active" id="details">
            <div id="keywords"></div>
            <div id="plot"></div>
        </div>
        <div class="tab-pane fade" id="mapz">
            <jsp:include page="../map/wholeMap.jsp"/>
            <div id="map" style="width:500px ;height:500px;"></div>
            <input type="button" onclick="location.href='/board'" value="촬영지 후기 작성"/>
        </div>
<%--        <div class="tab-pane fade" id="actors">--%>
<%--        </div>--%>
<%--        <div class="tab-pane fade" id="related">--%>
<%--            <p>관련 영화 리스트 . . .  ajax? 이거 하려면,, 흠..api 확인하기</p>--%>
<%--        </div>--%>
<%--        <div class="tab-pane fade" id="reviews">--%>
<%--            <p>리뷰 작성하기</p>--%>
<%--            <p>리뷰 로드하기</p>--%>
<%--        </div>--%>
<%--        <div class="tab-pane fade" id="temp">--%>
<%--            <p>준 ㅂㅣ 중 . . .</p>--%>
<%--        </div>--%>
        <div class="tab-pane fade" id="season">
        </div>
    </div>
</section>
<script src="/javascript/dramaSearch.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
