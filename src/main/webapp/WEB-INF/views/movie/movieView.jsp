<%--
  Created by IntelliJ IDEA.
  User: EZEN
  Date: 2022-11-16
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/contentView.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body onload="javascript:getMovie(${movie_id})">
<jsp:include page="../header.jsp" />
<c:set var="userId" value="${log}" scope="session"/>
<input type="hidden" value="${userId}" id="user">

<section>
    <div class = movie-view></div>

    <div class="mylist" style="margin: 10px auto; display: flex; align-items: flex-end; width: 80vw;">
        <div class="wish"></div>
        <div class="watch"></div>
    </div>
    <div>
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#details">상세정보</a></li>
            <li class="nav-item"><a class="nav-link" onmouseout="relayout()"  data-toggle="tab" href="#mapz">촬영지</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#actors">출연진</a></li>
            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#related">관련영화</a></li>
<%--            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#reviews">리뷰</a></li>--%>
<%--            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#season">시즌</a></li>--%>
        </ul>
    </div>


    <div class="tab-content">
        <div class="tab-pane fade show active" id="details">
            <div id="keywords"></div>
            <div id="plot"></div>
        </div>
        <div class="tab-pane fade" id="mapz">
            <jsp:include page="../map/wholeMap.jsp"/>
            <div id="map" style="width:500px ;height:300px;"></div>
            <input type="button" class="btn" onclick="movePlaceSearch()" value="촬영지 등록하기"/>
            <input type="button" class="btn" onclick="location.href='/board'" value="촬영지 후기 작성"/>
        </div>
        <div class="tab-pane fade" id="actors">
        </div>
        <div class="tab-pane fade" id="related">
        </div>

    </div>
    <input type="button" style="color: black" onclick="getSearchTitle2()" value="게시판 출력">
    <div class="write_button" id="write_button">
    </div>
    <table class="board_list" id="board_list">
    </table>
</section>
<jsp:include page="../footer.jsp" />
<script src="/javascript/boardView.js"></script>
<script src="/javascript/createBoard.js"></script>
<script src="/javascript/movieSearch.js"></script>
<script src="/javascript/myContent.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="/javascript/wholeMap.js"></script>
<script src="/javascript/report.js"></script>
</body>
</html>
