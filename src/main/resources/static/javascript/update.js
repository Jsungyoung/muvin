function isSame() {
    let pw = document.getElementById('password').value;
    let checkPw = document.getElementById('passwordCheck').value;

    if (pw !== "" && checkPw !== "") {
        if (pw === checkPw) {
            document.getElementById('same').innerHTML = '비밀번호 일치';
            document.getElementById('same').style.color = 'green';
        }
        else {
            document.getElementById('same').innerHTML = '비밀번호 불일치';
            document.getElementById('same').style.color = 'red';
        }
    }
    if (pw.search(" ") !== -1) {
        document.getElementById('space').innerHTML = '공백을 섞을 수 없습니다.';
        document.getElementById('space').style.color = 'red';

    } else {
        document.getElementById('space').innerHTML = "";
    }

}
function phone_keyup(obj) {
    let number = obj.value.replace(/[^0-9]/g, "");
    let phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}
function update_check() {
    //변수에 담아주기
    let pw = document.getElementById("password");
    let pwCheck = document.getElementById("passwordCheck");
    let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let space = document.getElementById("space");
    let same = document.getElementById("same");
    let nameChk = document.getElementById("nameChk");
    let phoneChk = document.getElementById("phoneChk");

    // 정규식
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    let nameCheck = (/^[가-힣]+$/);

    if(pw.value === "") {
        space.innerHTML = '비밀번호를 입력해주세요.';
        space.style.color = 'red';
        pw.focus();
        return false;
    }
    if (!pwdCheck.test(pw.value)) {
        space.innerHTML = '비밀번호는 영문자+숫자+특수문자 조합으로 8~20자리 사용해야 합니다.';
        space.style.color = 'red';
        pw.focus();
        return false;
    } else if (pwCheck.value !== pw.value) {
        same.innerHTML = '비밀번호가 일치하지 않습니다.';
        same.style.color = 'red';
        pwCheck.focus();
        return false;
    } else if (pw.value.search(" ") !== -1) {
        space.innerHTML = '비밀번호에 공백을 넣을 수 없습니다.';
        space.style.color = 'red';
        pw.focus();
        return false;
    }

    if (name.value === "") {
        nameChk.innerHTML = '이름을 입력하세요.';
        nameChk.style.color = 'red';
        name.focus();
        return false;
    }else if(!nameCheck.test(name.value)){
        nameChk.innerHTML = '한글만 입력해주세요';
        nameChk.style.color = 'red';
        name.focus();
        return false;
    }

    if (phone.value === "") {
        phoneChk.innerHTML = '전화번호를 입력하세요.';
        phoneChk.style.color = 'red';
        phone.focus();
        return false;
    }

    //입력 값 전송
    document.update.submit(); //유효성 검사의 포인트
}