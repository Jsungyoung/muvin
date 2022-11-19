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
    <link rel="stylesheet" href="/css/wholeMap.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>
<body>
<h1 class="fuck">테스트</h1>
<div id="map" style="width:500px ;height:500px;"></div>

<script>
    var mapContainer = document.getElementById('map'), // 지도의 중심좌표
        mapOption = {
            center: new kakao.maps.LatLng(36.6002, 127.8855), // 지도의 중심좌표
            level: 12 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다

    $.get("http://localhost:8084/v1/wholemap?movie_code=12539", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        var marker = $(data).map(function(i, position) {
            var imageSize = new kakao.maps.Size(24, 35);
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            return new kakao.maps.Marker({
                map : map,
                position : new kakao.maps.LatLng(position.y, position.x),
                image : markerImage
            });

            // 커스텀 오버레이에 표시할 컨텐츠 입니다
        // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
        // 별도의 이벤트 메소드를 제공하지 않습니다
            var content = '<div class="wrap">' +
                '    <div class="info">' +
                '        <div class="title">' +
                '            카카오 스페이스닷원' +
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
                '        </div>' +
                '        <div class="body">' +
                '            <div class="img">' +
                '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                '           </div>' +
                '            <div class="desc">' +
                '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' +
                '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
                '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
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

        // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                overlay.setMap(map);
            });

        // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
            function closeOverlay() {
                overlay.setMap(null);
            }


        });
    });

    var settings = {
        "url": "http://localhost:8084/v1/wholemap?movie_code=12539",
        "method": "GET",
        "timeout": 0,
        "headers": {
            "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
            "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
        },
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });


</script>


</body>
</html>
