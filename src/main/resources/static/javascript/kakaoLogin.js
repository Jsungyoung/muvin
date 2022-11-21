const REST_API_KEY = "6a4c077fca80e32384fcf93a071c6788";
let code = new URL(window.location.href).searchParams.get("code");
if(code!=null){
    kakaoLogin();
}

function kakaoLogin(){
    if(code==null) {
        location.href = 'https://kauth.kakao.com/oauth/authorize?client_id=6a4c077fca80e32384fcf93a071c6788&redirect_uri=http://localhost:8084/loginForm&response_type=code';
    }
    console.log(code);
    if(code!=null) {
        $.ajax({
            method: "POST",
            url: "https://kauth.kakao.com/oauth/token",
            header: {
                contentType: "application/x-www-form-urlencoded;charset=utf-8"
            },
            data: {
                grant_type : "authorization_code",
                client_id: REST_API_KEY,
                redirect_url: "http://localhost:8084/loginForm",
                code: code
            }
        }).done(function (res) {
            console.log(res.access_token);
            getUserInfo(res.access_token)
        });
    }
}

function getUserInfo(access_token){
    $.ajax({
        method: "GET",
        url: "https://kapi.kakao.com/v2/user/me?porperty",
        headers: {
            Authorization : `Bearer ${access_token}`
        }
    }).done(function (res) {
        let id = res.id;
        let email = res.kakao_account.email;
        let nickname = res.kakao_account.profile.nickname;
        $.ajax({
            async: false,
            method: "POST",
            url: "/v1/kakao/login",
            data: {
                id: id
            }
        }).done(function(res) {
            console.log(res);
            if(res==="/signUpForm"){
                let data = `{"id":"${id}","nickname":"${nickname}","email":"${email}"}`;
                sessionStorage.setItem("data",data);
            }
            location.replace(res);
        });
    });
}
