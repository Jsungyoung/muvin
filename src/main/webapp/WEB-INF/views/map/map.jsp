<%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-18
  Time: 오후 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>촬영지 지도</title>
    <link rel="stylesheet" href="css/wholeMap.css">
</head>
<body>

<div id="map" style="width:700px;height:700px;"></div>

<div class="xy"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>

    let settings = {
        "url": "http://localhost:8084/v1/map",
        "method": "GET",
        "timeout": 0,
        "headers": {
            "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
            "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
        },
    };

    $.ajax(settings).done(function (response) {
        for(let i=0; i<response.length; i++) {
            console.log(JSON.stringify(response));
        }
    });

    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
        level : 14 // 지도의 확대 레벨
    });

    // 마커 클러스터러를 생성합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });

    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("http://localhost:8084/v1/map", function(data) {

     //   데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        let marker = $(data).map(function(i, position) {
            return new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.y, position.x)
            });
        });

        console.log(typeof marker);

        console.log(marker)
        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(marker);

        let markers = [];
        for(let i=0; i<data.length; i++) {
            let marker = new kakao.maps.Marker({
                position : new kakao.maps.LatLng(data[i].y, data[i].x),
                map : map
            });
            console.log(marker);
                    let overlay = new kakao.maps.CustomOverlay({
                        //오버레이에 띄울 내용
                        map: map,
                        position: marker.getPosition(),
                        content: '<div class="wrap">' +
                            '    <div class="info">' +
                            '        <div class="title">' +
                            data[i].place_name+
                            '        </div>' +
                            '        <div class="body">' +
                            '            <input type="hidden" value="'+data[i].movie_code+'" id="movie_id" >'  +
                            '            <div class="img">' +
                            '                <img referrerpolicy="no-referrer" src="'+ data[i].place_URL+'"'+ 'width="73" height="70">' +
                            '           </div>' +
                            '            <div class="desc">' +
                            '                <div class="ellipsis"></div>' +
                            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                            '                <div><a href="" class="link" > 길찾기 </a></div>' +
                            '                <div><a href="wholeMap/roadView?x='+data[i].x+'&y='+data[i].y+'"' +' class="link" > 로드뷰 보기 </a></div>' +
                            '            </div>' +
                            '        </div>' +
                            '    </div>' +
                            '</div>'
                    });
                    console.log(overlay);
                    markers.push(marker);

                    // 클릭시 열기
                    kakao.maps.event.addListener(marker, 'click', function (){
                        overlay.setMap(map);
                    })

                    // 더블클릭시 닫기
                    kakao.maps.event.addListener(map, 'mouseover', function (mouseEvent) {
                        overlay.setMap(null)
                    })


        }
            // 클러스터러에 마커들을 추가합니다
            clusterer.addMarkers(markers);
    });

    // 마커 클러스터러에 클릭이벤트를 등록합니다
    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });
</script>
</body>
</html>
