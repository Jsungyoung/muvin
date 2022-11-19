<%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-15
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao 지도 시작하기</title>
    <style>
        #container {overflow:hidden;height:300px;position:relative;}
        #mapWrapper {width:100%;height:300px;z-index:1;}
        #rvWrapper {width:50%;height:300px;top:0;right:0;position:absolute;z-index:0;}
        #container.view_roadview #mapWrapper {width: 50%;}
        #roadviewControl {position:absolute;top:5px;left:5px;width:42px;height:42px;z-index: 1;cursor: pointer; background: url(https://t1.daumcdn.net/localimg/localimages/07/2018/pc/common/img_search.png) 0 -450px no-repeat;}
        #roadviewControl.active {background-position:0 -350px;}
        #close {position: absolute;padding: 4px;top: 5px;left: 5px;cursor: pointer;background: #fff;border-radius: 4px;border: 1px solid #c8c8c8;box-shadow: 0px 1px #888;}
        #close .img {display: block;background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/rv_close.png) no-repeat;width: 14px;height: 14px;}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
<div id="container">
    <div id="rvWrapper">
        <div id="roadview" style="width:100%;height:100%;"></div> <!-- 로드뷰를 표시할 div 입니다 -->
        <div id="close" title="로드뷰닫기" onclick="closeRoadview()"><span class="img"></span></div>
    </div>
    <div id="mapWrapper">
        <div id="map" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
        <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
    </div>
</div>

<script>
    $.ajax({
        url: "http://localhost:8087/v1/map",
        method: "GET",
        timeout: 0,
        headers: {
            "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
            "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
        }
    }).done(function (response) {
        console.log(response);
    });
</script>
</body>
</html>
