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


<div id="map" style="width:500px ;height:500px;"></div>

<script>
    let mapContainer = document.getElementById('map'), // 지도의 중심좌표
        mapOption = {
            center: new kakao.maps.LatLng(36.6002, 127.8855), // 지도의 중심좌표
            level: 14 // 지도의 확대 레벨
        };

    let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다




    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다

    // var settings = {
    //     "url": "http://localhost:8084/v1/wholemap?movie_code=12539",
    //     "method": "GET",
    //     "timeout": 0,
    //     "headers": {
    //         "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
    //         "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
    //     },
    // };
    //
    // $.ajax(settings).done(function (response) {
    //     console.log(response);
    // });

    const urlParams = new URL(window.location.href).searchParams;
    const movieid = urlParams.get('movie_id');
    let url = "http://localhost:8084/v1/wholemap?movie_code=" + movieid;

    console.log(movieid)
    $.get(url, function(data) {

        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for(let i=0; i< data.length; i++){
            // 마커 이미지 크기
            let imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지 생성
            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            // 마커 생성
            let marker = new kakao.maps.Marker({
                map : map,
                position : new kakao.maps.LatLng(data[i].y, data[i].x),
                image : markerImage,
                title : data[i].area_name
            });



            (function (marker, place){
                //마크 클릭 시
                kakao.maps.event.addListener(marker, 'click', function (){
                    let overlay = new kakao.maps.CustomOverlay({
                        //오버레이에 띄울 내용
                        map : map,
                        position: marker.getPosition(),
                        content :  '<div class="wrap">' +
                            '    <div class="info">' +
                            '        <div class="title">' +
                                        place.place_name +
                            '        </div>' +
                            '        <div class="body">' +
                            '            <div class="img">' +
                            '                <img referrerpolicy="no-referrer" src="'+ place.place_URL +'" width="73" height="70">' +
                            '           </div>' +
                            '            <div class="desc">' +
                            '                <div class="ellipsis">' + place.area_name + '</div>' +
                            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                            '                <div><a href="" id="place.code" class="link" > 길찾기 </a></div>' +
                            '                <div><a href="roadView.jsp" class="link" > 로드뷰 보기 </a></div>' +
                            '            </div>' +
                            '        </div>' +
                            '    </div>' +
                            '</div>'
                    });
                    console.log(overlay);
                    overlay.setMap(map);
                    kakao.maps.event.addListener(map, 'dblclick', function (mouseEvent){
                        overlay.setMap(null)
                    })
                })
            })(marker, data[i])



        }




        // var marker = $(data).map(function(i, position) {
        //     var imageSize = new kakao.maps.Size(24, 35);
        //     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        //
        //     return new kakao.maps.Marker({
        //         map : map,
        //         position : new kakao.maps.LatLng(position.y, position.x),
        //         image : markerImage,
        //         title : position.area_name
        //     });


        });



</script>


</body>
</html>
