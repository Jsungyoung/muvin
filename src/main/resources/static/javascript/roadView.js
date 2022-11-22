const urlParams = new URL(window.location.href).searchParams;
const x = urlParams.get('x');
const y = urlParams.get('y');

console.log(x);
console.log(y);

let roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
let roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
let roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

let position = new kakao.maps.LatLng(y, x);

// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
roadviewClient.getNearestPanoId(position, 50, function (panoId) {
    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
});