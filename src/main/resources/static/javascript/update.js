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

function update_check() {
    //변수에 담아주기
    let pw = document.getElementById("password");
    let pwCheck = document.getElementById("passwordCheck");
    let name = document.getElementById("name");
    let phone = document.getElementById("phone");

    // 정규식
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    let nameCheck = (/^[가-힣]+$/);
    let phoneCheck = /^(01[016789]-)(\d{3,4}-)(\d{4})$/;

    if(pw.value === "") {
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    }
    if (!pwdCheck.test(pw.value)) {
        alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~20자리 사용해야 합니다.");
        pw.focus();
        return false;
    } else if (/(\w)\1\1/.test(pw.value)) {
        alert('같은 문자를 3번 이상 사용하실 수 없습니다.');
        pw.focus();
        return false;
    } else if (pwCheck.value !== pw.value) {
        alert("비밀번호가 일치하지 않습니다.");
        pwCheck.focus();
        return false;
    } else if (pw.value.search(" ") !== -1) {
        alert("비밀번호에 공백을 넣을 수 없습니다.");
        pw.focus();
        return false;
    } else if (pw.value.search(id.value.substring(0, 3)) > -1) {
        alert("아이디와 3자리 이상 같습니다.");
        pw.focus();
        return false;
    }
    if (name.value === "") {
        alert("이름을 입력하세요.");
        name.focus();
        return false;
    }else if(!nameCheck.test(name.value)){
        alert("한글만 입력해주세요");
        name.focus();
        return false;
    }

    if (phone.value === "") {
        alert("전화번호를 입력하세요.");
        phone.focus();
        return false;
    }else if(!phoneCheck.test(phone.value)){
        alert("올바른 휴대폰 번호를 입력해주세요.");
        phone.focus();
        return false;
    }

    //입력 값 전송
    document.update.submit(); //유효성 검사의 포인트
}