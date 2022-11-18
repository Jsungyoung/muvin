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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>지도</title>
    <link rel="stylesheet" href="css/wholeMap.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c"></script>

</head>
<body>

<div id="map" style="width:500px ;height:500px;"></div>

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 14 // 지도의 확대 레벨
        };



    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다




    <c:forEach items="${list}" var="places">

    // 지도에 마커를 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(<c:out value="${places.x}"/>, <c:out value="${places.y}"/>)
    });
    // 커스텀 오버레이에 표시할 컨텐츠 입니다
    // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
    // 별도의 이벤트 메소드를 제공하지 않습니다
    var content = '<div class="wrap">' +
        '    <div class="info">' +
        '        <div class="title">' +
        '           <c:out value="${places.place_name}" /> '+
        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
        '        </div>' +
        '        <div class="body">' +
        '            <div class="img">' +
        '                <img src="<c:out value="${places.place_URL}"/>" width="73" height="70">' +
        '           </div>' +
        '            <div class="desc">' +
        '                <div class="ellipsis"></div>' +
        '                <div class="jibun ellipsis"><c:out value="${places.area_name}"/></div>' +
        '                <div><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=<c:out value='${places.place_name}'/>" target="_blank" class="link">네이버 검색</a></div>' +
        '            </div>' +
        '        </div>' +
        '    </div>' +
        '</div>';

    // 마커 위에 커스텀오버레이를 표시합니다
    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
    var overlay = new kakao.maps.CustomOverlay({
        content: content,
        map: map,
        position: marker.getPosition()
    });

    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
    function closeOverlay() {
        overlay.setMap(null);
    }

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        overlay.setMap(map);
    });


    </c:forEach>
</script>

    <div class="layout">
        <table>
            <thead>
                <tr>
                    <th>장소의 x좌표</th>
                    <th>장소의 y좌표</th>
                    <th>지역 이름</th>
                    <th>영화 코드</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="place">
                <tr>
                    <td><c:out value="${place.x}"/></td>
                    <td><c:out value="${place.y}"/></td>
                    <td><c:out value="${place.area_name}"/></td>
            </c:forEach>
            </tbody>

        </table>




    </div>



</body>
</html>
