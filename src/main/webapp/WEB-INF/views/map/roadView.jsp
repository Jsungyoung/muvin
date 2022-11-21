<%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-15
  Time: 오후 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로드뷰</title>
</head>
<body>

<%
    String movie_id = request.getParameter("movie_id");
%>
<div id="roadview" style="width:500px;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c"></script>
<script>


//        var settings = {
//            "url": "http://localhost:8084/v1/wholemap?movie_code=12539",
//            "method": "GET",
//            "timeout": 0,
//            "headers": {
//                "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
//                "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
//            },
//        };
//
//        $.ajax(settings).done(function (response) {
//            console.log(response);
//        });
        $.get("http://localhost:8084/v1/map?movie_code=<%=movie_id%>", function(data) {
            let roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
            let roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
            let roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

            let position = new kakao.maps.LatLng(data.y, data.x);

            // 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
            roadviewClient.getNearestPanoId(position, 50, function(panoId) {
                roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
            });


        });






</script>
</body>
</html>
