const REST_API_KEY = "6a4c077fca80e32384fcf93a071c6788";
const REDIRECT_URI = "https://localhost:8087";
let code = "";

function kakaoLogin(){
    let url = "https://kauth.kakao.com/oauth/token";
    url += "?grant_type=authorization_code";
    url += `&client_id${REST_API_KEY}`;
    url += `&redirect_uri=${REDIRECT_URI}`;
    url += `&code=H0kHpwpjqaozBCwzNUzdpjW2neK36RaR93hBbhVYpHZJgYgnS798rPBJ7voH0EIZQ_rypQo9cxcAAAGEjvYhgA`
    url += "&client_secret=MbVu8Zn9GcUQcp6fY04ydBR6aoqO8Sho"
    $.ajax({
        method : "POST",
        url : url,
        contentType : "application/x-www-form-urlencoded;charset=utf-8"
    });
}