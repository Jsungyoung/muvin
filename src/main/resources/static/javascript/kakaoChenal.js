

function kakaoOnLoad(){ // 채널 관계 확인
    $.ajax({
        method: "GET",
        url: "https://kapi.kakao.com/v1/api/talk/channels",
        headers: {
            "Authorization": `Bearer ${ACCESS_TOKEN}/KakaoAK ${APP_ADMIN_KEY}`
        }
    })
}