<%@ page import="java.util.ArrayList" %>
<%@ page import="org.hibernate.boot.model.source.internal.hbm.MappingDocument" %>
<%@ page import="com.example.muvin.domain.place.Place" %>
<%@ page import="com.example.muvin.domain.place.PlaceRepository" %>
<%@ page import="com.example.muvin.domain.place.PlaceDto" %>
<%@ page import="com.example.muvin.service.PlaceService" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="javax.websocket.MessageHandler" %>
<%@ page import="com.example.muvin.controller.WholeMapController" %>
<%@ page import="org.springframework.stereotype.Service" %><%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-15
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>지도</title>
    <link rel="stylesheet" href="/css/wholeMap.css">
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
<div class="tvmovie"></div>

<c:if test="${!empty movieid}">
    <c:set var="idinfo" value="${sessionScope.movieid}"/>
    <input type="hidden" id="movieid" name="idinfo" value="${idinfo}">
</c:if>

<c:if test="${!empty tvid}">
    <c:set var="idinfo" value="${sessionScope.tvid}"/>
    <input type="hidden" id="tvid" name="idinfo" value="${idinfo}">
</c:if>

<div class="mapandboard">
    <div class="voard">
        <table class="container-movie">
            <thead class="title2">
            </thead>
            <tbody class="container2">
            </tbody>
        </table>
    </div>


<div id="map"></div>

</div>
<script src="/javascript/wholeMap.js"></script>
<script>

    let container = document.getElementById('map'),
        options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 14
        };
    let map = new kakao.maps.Map(container, options);

    function relayout() {
        map.relayout();

        map.setCenter(new kakao.maps.LatLng(36.7299, 127.9683));
    }
    container.style.width = '700px';
    container.style.height = '580px';

    setTimeout(function(){
        relayout();
        map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
    }, 100);

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


</script>
</body>
</html>
