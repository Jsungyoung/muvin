var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
    level : 14 // 지도의 확대 레벨
});



function printResult() {

    function clear() {
        clusterer.clear();
    }
    let clusterer = new kakao.maps.MarkerClusterer({
        map: map,
        averageCenter: true,
        minLevel: 10,
        disableClickZoom: true
    });

    let areaName = $('.areaName').val();

    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    $.get("http://localhost:8084/v1/map2/?areaName=" + areaName, function(data) {
        clear();
        clusterer.redraw();
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
                    '                <div><a href="https://map.kakao.com/link/to/'+data[i].placeName+','+data[i].y+',' + data[i].x+ '"' +'  class="link" > 길찾기 </a></div>' +
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

            // 마우스 오버시 닫기
            kakao.maps.event.addListener(map, 'mouseover', function (mouseEvent) {
                overlay.setMap(null)
            })


        }
        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);

    });

    // 마커 클러스터러에 클릭이벤트를 등록합니다

    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-2;

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
            `
                <tr>
                <th>이미지</th>
                <th>장소명</th>
                <th>주소</th>
                <th>영화바로가기</th>
                <th>신고하기</th>
            </tr>    
            `
        );

        let str = '';

        list.forEach(e => {
            let placeURL = e.placeURL;
            let placeName = e.placeName;
            let areaName = e.areaName;
            let movieCode = e.movieCode;
            let areaCode = e.areaCode;
            let placeNo = e.code;
            let selmord = e.selmord;
            let href = "";
            if(selmord===1){
                href="movieView?movie_id=" + movieCode;
            }else{
                href="tvView?tv_id=" + movieCode;
            }

            str = '<tr>'
            str += "<td>" + '<img style="width : 50px; height : 50px;" src=' + placeURL + '>' + "</td>";
            str += "<td>" + placeName + "</td>";
            str += "<td>" + areaName + "</td>";
            if(selmord === 1) {
                str += "<td>" + "<a href=movieView?movie_id=" + movieCode + '>' + '정보보기' + "</a></td>";
            } else if(selmord === 2){
                str += "<td>" + "<a style='text-decoration: none;' href=tvView?tv_id=" + movieCode + '>' + '정보보기' + "</a></td>";
            }
            str += "<td><img  style='cursor:pointer ; width: 20px; height: 20px;' class='selected' id='" + placeNo + "/" + selmord + "' onclick='showPopup(this)' src='images/siren.png'></td>";
            str += "</tr>";
            $('.container').append(str);





        });
    });
};

