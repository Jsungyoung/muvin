var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = {
        center: new kakao.maps.LatLng(36.6002, 127.8855), // 지도의 중심좌표
        level: 14 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다

$.get("http://localhost:8084/v1/wholemap?movie_code="+"<%=movie_id%>", function(data) {
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
                        '                <div><a href="" class="link" > 로드뷰 보기 </a></div>' +
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
//
// content : '<div class="wrap">' +
// '    <div class="info">' +
// '        <div class="title">' +
// '            카카오 스페이스닷원' +
// '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
// '        </div>' +
// '        <div class="body">' +
// '            <div class="img">' +
// '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
// '           </div>' +
// '            <div class="desc">' +
// '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' +
// '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
// '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
// '            </div>' +
// '        </div>' +
// '    </div>' +
// '</div>',
//
//
//     //마크를 클릭하면
//     kakao.maps.event.addListener(marker, 'click', function (){
//         let overlay = new kakao.maps.CustomOverlay({
//             content : this.content,
//             map : map,
//             position: marker.getPosition()
//         });
//         // 암데나 클릭하면 오버레이 닫기
//
//         console.log(overlay);
//         overlay.setMap(map);
//
//         kakao.maps.event.addListener(map, 'click', function (mouseEvent){
//             overlay.setMap(null)
//         })
//     })
// })(marker, positions[i])



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

function movePlaceSearch(){
    let movie_id = new URL(window.location.href).searchParams.get("movie_id");
    location.href=`/placeSearch?movie_id=${movie_id}`;
}