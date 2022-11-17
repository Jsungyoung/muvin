<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.muvin.domain.map.MapDto" %>
<%@ page import="org.hibernate.boot.model.source.internal.hbm.MappingDocument" %><%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-15
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>지도</title>
    <link rel="stylesheet" href="css/wholeMap.css">
</head>
<body>

<%
    ArrayList<MapDto> content = new ArrayList<>();
    MapDto con = new MapDto(37.5608, 127.1109, "태왕사신기 촬영지", "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2Fdata29%2F2007%2F9%2F11%2F77%2F%25C5%25C2%25BF%25D5%25BB%25E7%25BD%25C5%25B1%25E2_dakness7.jpg&type=sc960_832", "https://ldb-phinf.pstatic.net/20150901_226/1441053764543OXyTi_JPEG/106078583949614_0.jpg", "고구려대장간마을");
    MapDto con2 = new MapDto(37.4505, 126.7444, "우리집", "naver.com", "daum.net", "우리집마을");
    content.add(con);
    content.add(con2);
    int idx = -1;
%>
<div id="map" style="width:500px;height:500px;"></div>

<a href="navi?"><img src="images/kakaonavi.png"></a>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c"></script>
<script>
    let mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
            level: 13 // 지도의 확대 레벨
        };

    let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    // [x,y, 영화이름, 영화포스터URL, 지역사진URL, 주소, 지역이름,]


   const data = [[]];
   <%


   %>

    // const data = [
    //     [37.5608, 127.1109, "태왕사신기 촬영지", "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2Fdata29%2F2007%2F9%2F11%2F77%2F%25C5%25C2%25BF%25D5%25BB%25E7%25BD%25C5%25B1%25E2_dakness7.jpg&type=sc960_832", "https://ldb-phinf.pstatic.net/20150901_226/1441053764543OXyTi_JPEG/106078583949614_0.jpg", "고구려대장간마을"],
    //     [37.4505, 126.7444, "우리집", "naver.com", "daum.net", "우리집마을"],
    //     [37.5433, 125.4445, "너네집", "naver.com", "daum.net", "너네집마을"]
    // ]

    for(let i=0; i<data.length; i++){

        let imageSrc = 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2Fdata29%2F2007%2F9%2F11%2F77%2F%25C5%25C2%25BF%25D5%25BB%25E7%25BD%25C5%25B1%25E2_dakness7.jpg&type=sc960_832', // 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(data[i][0], data[i][1]); // 마커가 표시될 위치입니다

        // 마커를 생성합니다
        let marker = new kakao.maps.Marker({
            position: markerPosition,
            map : map,
            image: markerImage // 마커이미지 설정
        });


        // 오버레이 내용
        let content = '<div class="wrap">' +
            '    <div class="info">' +
            '        <div class="title">' +
            '태왕사신기 촬영지'             +
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
            '        </div>' +
            '        <div class="body">' +
            '            <div class="img">' +
            '                <img src= "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2Fdata29%2F2007%2F9%2F11%2F77%2F%25C5%25C2%25BF%25D5%25BB%25E7%25BD%25C5%25B1%25E2_dakness7.jpg&type=sc960_832" width="73" height="70">' +
            '           </div>' +
            '            <div class="desc">' +
            '                <div class="ellipsis">구리시</div>' +
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
            '            </div>' +
            '        </div>' +
            '    </div>' +
            '</div>';



        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);


        // 마커 위에 커스텀오버레이를 표시합니다
        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
        let overlay = new kakao.maps.CustomOverlay({
            content: content,
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


    }



</script>
</body>
</html>
