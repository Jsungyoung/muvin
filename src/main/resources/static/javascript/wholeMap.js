



const urlParams = new URL(window.location.href).searchParams;
const movieid = urlParams.get('movie_id');
const tvid = urlParams.get('tv_id');


if(movieid !== null) {


    resultPrint()
    function resultPrint(){
        $('.title2').empty();
        $('.container2').empty();

    var settings = {
        url: "http://localhost:8084/v1/wholemap?movie_code="+movieid,
        method: "GET",
        timeout: 0,
        headers: {
            "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
            "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
        },
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        const list = response;

        $('.title2').append(
            `<tr>
                <th>이미지</th>
                <th>장소명</th>
                <th>주소</th>
                <th>장소 리뷰 보기</th>
                <th>신고하기</th>
            </tr>    
            `
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
            str += "<td>" + areaName + "</td>";
            str += "<td>" + placeName + "</td>";
            str += "<td>" + movieCode + "</td>";
            str += "<td><img class='selected' id='" + placeNo + "/" + selmord + "' onclick='showPopup(this)' src='images/siren.png'></td>";
            str += "</tr>";
            $('.container2').append(str);


        })

    });


    }


    let contentType = 1;
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
                            place.placeName +
                            '        </div>' +
                            '        <div class="body">' +
                            '            <div class="img">' +
                            '                <img referrerpolicy="no-referrer" src="' + place.placeURL + '" width="73" height="70">' +
                            '           </div>' +
                            '            <div class="desc">' +
                            '                <div class="ellipsis">' + place.areaName + '</div>' +
                            '                <div><a href="https://map.kakao.com/link/to/'+place.placeName+','+place.y+',' + place.x+ '"' +' id="place.code" class="link" > 카카오 길찾기 </a></div>' +
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

    resultPrint2()
    function resultPrint2(){
        $('.title2').empty();
        $('.container2').empty();

        let settings = {
            url: "http://localhost:8084/v1/wholemap?movie_code="+tvid,
            method: "GET",
            timeout: 0,
            headers: {
                "X-NCP-APIGW-API-KEY-ID": "yv0yf4rscg",
                "X-NCP-APIGW-API-KEY": "f09FxtmNmNjgmwc78UDv2IHazt5BrnbsAMP9vS8L"
            },
        };

        $.ajax(settings).done(function (response) {
            console.log(response);
            const list = response;

            $('.title2').append(
                `
                <tr>
                <th>이미지</th>
                <th>장소명</th>
                <th>주소</th>
                <th>장소리뷰하기</th>
                <th>신고하기</th>
            </tr>    
            `
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
                str += "<td>" + areaName + "</td>";
                str += "<td>" + placeName + "</td>";
                str += "<td>" + movieCode + "</td>";
                if(selmord === 1) {
                    str += "<td>" + "<a href=movieView?movie_id=" + movieCode + '>' + movieCode + "</a></td>";
                } else if(selmord === 2){
                    str += "<td>" + "<a href=tvView?tv_id=" + movieCode + '>' + movieCode + "</a></td>";
                }
                str += "<td><img class='selected' id='" + placeNo + "/" + selmord + "' onclick='showPopup(this)' src='images/siren.png'></td>";
                str += "</tr>";
                $('.container2').append(str);


            })

        });


    }







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
                            place.placeName +
                            '        </div>' +
                            '        <div class="body">' +
                            '            <div class="img">' +
                            '                <img referrerpolicy="no-referrer" src="' + place.placeURL + '" width="73" height="70">' +
                            '           </div>' +
                            '            <div class="desc">' +
                            '                <div class="ellipsis">' + place.areaName + '</div>' +
                            '                <div><a href="https://map.kakao.com/link/to/'+place.placeName+','+place.y+',' + place.x+ '"' +' id="place.code" class="link" > 카카오 길찾기 </a></div>' +
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

function movePlaceSearch(){
    let movie_id = new URL(window.location.href).searchParams.get("movie_id");
    let tv_id = new URL(window.location.href).searchParams.get("tv_id");
    if(movie_id!=null){
        location.href="/placeSearch?movie_id=" + movie_id;
    }else if(tv_id!=null){
        location.href="/placeSearch?tv_id=" + tv_id;
    }
}



