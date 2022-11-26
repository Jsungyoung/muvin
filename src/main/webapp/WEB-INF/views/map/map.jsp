<%--
  Created by IntelliJ IDEA.
  User: komlo
  Date: 2022-11-18
  Time: 오후 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>촬영지 지도</title>
    <link rel="stylesheet" href="css/wholeMap.css">
</head>
<body>
<div class="map" id="map" style="width:700px;height:700px;"></div>

<div class="xy"></div>


<div>

    <form>
    <select class="areaName" onchange="printResult()">
        <option>선택</option>
        <option value="">전체</option>
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="인천">인천</option>
        <option value="부산">부산</option>
        <option value="대전">대전</option>
        <option value="광주">광주</option>
        <option value="대구">대구</option>
        <option value="경상">경상</option>
        <option value="전라">전라</option>
        <option value="제주">제주</option>
        <option value="강원">강원</option>
    </select>

    </form>

    <table class="all_map" id="all_map">
        <thead class="title1">
        </thead>
        <tbody class="container">
        </tbody>
    </table>


</div>
<script>




    function printResult() {
        // 마커 클러스터러를 생성합니다
        // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
        // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
        // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
        // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
        let clusterer = new kakao.maps.MarkerClusterer({
            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
            minLevel: 10, // 클러스터 할 최소 지도 레벨
            disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
        });
        function redraw() {
            clusterer.redraw();
        }

        let areaName = $('.areaName').val();

        console.log("areaName :" + areaName);

        // 데이터를 가져오기 위해 jQuery를 사용합니다
        // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
        $.get("http://localhost:8084/v1/map2/?areaName=" + areaName, function(data) {


            let markers = [];
            for(let i=0; i<data.length; i++) {
                let marker = new kakao.maps.Marker({
                    position : new kakao.maps.LatLng(data[i].y, data[i].x),
                    map : map
                });
                let overlay = new kakao.maps.CustomOverlay({
                    //오버레이에 띄울 내용
                    position: marker.getPosition(),
                    content: '<div class="wrap">' +
                        '    <div class="info">' +
                        '        <div class="title">' +
                        data[i].placeName+
                        '        </div>' +
                        '        <div class="body">' +
                        '            <input type="hidden" value="'+data[i].movieCode+'" id="movie_id" >'  +
                        '            <div class="img">' +
                        '                <img referrerpolicy="no-referrer" src="'+ data[i].placeURL+'"'+ 'width="73" height="70">' +
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

        /////////////////////////////////////////////////////////////////
        $('.title1').empty();
        $('.container').empty();
        areaName = $('.areaName').val();



        console.log(areaName);
        let settings = {
            url: "http://localhost:8084/v1/map2/?areaName=" + areaName,
            method: "GET",
            timeout: 0,
            headers: {
                "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
                "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L",
            },
        };

        $.ajax(settings).done(function (response) {
            const list = response;

            $('.title1').append(
                `<tr>
                    <th>이미지</th>
                    <th>장소명</th>
                    <th>주소</th>
                    <th>영화바로가기</th>
                    <th>신고하기</th>
                </tr>`
            );

            let str = '';

            list.forEach(e => {
                console.log(e);
                let placeURL = e.placeURL;
                let placeName = e.placeName;
                let areaName = e.areaName;
                let movieCode = e.movieCode;
                let areaCode = e.areaCode;
                let placeNo = e.code;
                let selmord = e.selmord;


                str = '<tr>'
                str += "<td>" + '<img style="width : 50px; height : 50px;" src=' + placeURL + '>' + "</td>";
                str += "<td>" + placeName + "</td>";
                str += "<td>" + areaName + "</td>";
                str += "<td>" + movieCode + "</td>";
                if(selmord === 1) {
                    str += "<td>" + "<a href=movieView?movie_id=" + movieCode + '>' + movieCode + "</a></td>";
                } else if(selmord === 2){
                    str += "<td>" + "<a href=tvView?tv_id=" + movieCode + '>' + movieCode + "</a></td>";

                }
                str += "</tr>";
                $('.container').append(str);


            })
        });
    };


</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e0146e3fc3c4cc6c4776c917bccae6c&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/javascript/allMap.js"></script>
</body>
</html>
