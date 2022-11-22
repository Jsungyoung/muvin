<%--
  Created by IntelliJ IDEA.
  User: hanseung-u
  Date: 2022/11/21
  Time: 12:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
    <link rel="stylesheet" href="/css/mapGrid.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services"></script>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
                    <button type="submit">검색하기</button>
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    <div id="pointInfo" style="display: none">
        <input type="hidden" id="placeX"/>
        <input type="hidden" id="placeY"/>
        <p id="placeAddress"></p>
        <input type="text" id="areaName" placeholder="장소 이름">
        <input type="button" onclick="addPlace()" value="이 장소 추가하기"/>
    </div>
</div>
<script src="/javascript/placeSearch.js"></script>
</body>
</html>