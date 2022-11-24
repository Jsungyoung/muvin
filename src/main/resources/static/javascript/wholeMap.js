// $(document).ready(function(){
//
// });


    // const mapContainer = document.getElementById('map'), // 지도의 중심좌표
    //     mapOption = {
    //         center: new kakao.maps.LatLng(41.1626276235169, 123.88085529289597), // 지도의 중심좌표
    //         level: 14 // 지도의 확대 레벨
    //     };
    //
    // let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    // // map.setBounds(bounds[, paddingTop, paddingRight, paddingBottom, paddingLeft]);

var container = document.getElementById('map'),
    options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 14
    };
var map = new kakao.maps.Map(container, options);

container.style.width = '500px';
container.style.height = '500px';

setTimeout(function(){
    map.relayout();
    map.setCenter(new kakao.maps.LatLng(33.450701, 126.570667));
    map.setLevel(14);
}, 100);







const urlParams = new URL(window.location.href).searchParams;
const movieid = urlParams.get('movie_id');
const tvid = urlParams.get('tv_id');


if(movieid != null) {
    let url = "http://localhost:8084/v1/wholemap?movie_code=" + movieid;

    $.get(url, function (data) {

        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (let i = 0; i < data.length; i++) {
            // 마커 이미지 크기
            let imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지 생성
            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            // 마커 생성
            let marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(data[i].y, data[i].x),
                image: markerImage,
                title: data[i].area_name
            });


            (function (marker, place) {
                //마크 클릭 시
                kakao.maps.event.addListener(marker, 'click', function () {
                    let overlay = new kakao.maps.CustomOverlay({
                        //오버레이에 띄울 내용
                        map: map,
                        position: marker.getPosition(),
                        content: '<div class="wrap">' +
                            '    <div class="info">' +
                            '        <div class="title">' +
                            place.place_name +
                            '        </div>' +
                            '        <div class="body">' +
                            '            <div class="img">' +
                            '                <img referrerpolicy="no-referrer" src="' + place.place_URL + '" width="73" height="70">' +
                            '           </div>' +
                            '            <div class="desc">' +
                            '                <div class="ellipsis">' + place.area_name + '</div>' +
                            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                            '                <div><a href="" id="place.code" class="link" > 길찾기 </a></div>' +
                            '                <div><a href="wholeMap/roadView?x='+place.x+'&y='+place.y+'"' +' class="link" > 로드뷰 보기 </a></div>' +
                            '            </div>' +
                            '        </div>' +
                            '    </div>' +
                            '</div>'
                    });
                    overlay.setMap(map);
                    kakao.maps.event.addListener(map, 'mouseout', function (mouseEvent) {
                        overlay.setMap(null)
                    })
                })
            })(marker, data[i])


        }

    });
}
else if(tvid != null){
    let url = "http://localhost:8084/v1/wholemap?movie_code=" + tvid;

    $.get(url, function (data) {

        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        let imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

        for (let i = 0; i < data.length; i++) {
            // 마커 이미지 크기
            let imageSize = new kakao.maps.Size(24, 35);

            // 마커 이미지 생성
            let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

            // 마커 생성
            let marker = new kakao.maps.Marker({
                map: map,
                position: new kakao.maps.LatLng(data[i].y, data[i].x),
                image: markerImage,
                title: data[i].area_name
            });


            (function (marker, place) {
                //마크 클릭 시
                kakao.maps.event.addListener(marker, 'click', function () {
                    let overlay = new kakao.maps.CustomOverlay({
                        //오버레이에 띄울 내용
                        map: map,
                        position: marker.getPosition(),
                        content: '<div class="wrap">' +
                            '    <div class="info">' +
                            '        <div class="title">' +
                            place.place_name +
                            '        </div>' +
                            '        <div class="body">' +
                            '            <div class="img">' +
                            '                <img referrerpolicy="no-referrer" src="' + place.place_URL + '" width="73" height="70">' +
                            '           </div>' +
                            '            <div class="desc">' +
                            '                <div class="ellipsis">' + place.area_name + '</div>' +
                            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
                            '                <div><a href="" id="place.code" class="link" > 길찾기 </a></div>' +
                            '                <div><a href="wholeMap/roadView?x='+place.x+'&y='+place.y+'"' +' class="link" > 로드뷰 보기 </a></div>' +
                            '            </div>' +
                            '        </div>' +
                            '    </div>' +
                            '</div>'
                    });
                    overlay.setMap(map);
                    kakao.maps.event.addListener(map, 'dblclick', function (mouseEvent) {
                        overlay.setMap(null)
                    })
                })
            })(marker, data[i])
        }
    });
}

function movePlaceSearch(){
    let movie_id = new URL(window.location.href).searchParams.get("movie_id");
    let tv_id = new URL(window.location.href).searchParams.get("tv_id");
    if(movie_id!=null){
        location.href="/placeSearch?movie_id=" + movie_id;
    }else if(tv_id!=null){
        location.href="/placeSearch?tv_id=" + tv_id;
    }
}

