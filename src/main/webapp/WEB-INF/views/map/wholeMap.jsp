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
<div id="map" style="width:100% ;height:100%;"></div>
<div class="tvmovie"></div>

<c:if test="${!empty movieid}">
    <c:set var="idinfo" value="${sessionScope.movieid}"/>
    <input type="hidden" id="movieid" name="idinfo" value="${idinfo}">
</c:if>

<c:if test="${!empty tvid}">
    <c:set var="idinfo" value="${sessionScope.tvid}"/>
    <input type="hidden" id="tvid" name="idinfo" value="${idinfo}">
</c:if>


<table class="container-movie">
    <thead class="title2">
    </thead>
    <tbody class="container2">
    </tbody>
</table>
<table class="container-movie2">
    <thead class="title3">
    </thead>
    <tbody class="container3">
    </tbody>
</table>

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
    container.style.width = '500px';
    container.style.height = '500px';

    setTimeout(function(){
        relayout();
        map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
    }, 100);



</script>
</body>
</html>
