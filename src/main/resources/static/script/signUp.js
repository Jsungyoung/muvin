function joinform_check() {
    //변수에 담아주기
    let id = document.getElementById("id");
    let pw = document.getElementById("password");
    let pwCheck = document.getElementById("passwordCheck");
    let name = document.getElementById("name");
    let nickname = document.getElementById("nickname");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");

    if (id.value == "") {
        alert("아이디를 입력하세요.");
        id.focus();
        return false;
    }

    if (pw.value == "") {
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    }

    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

    if (!pwdCheck.test(pw.value)) {
        alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~16자리 입력해주세요.");
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
    } else if (pw.value.search(" ") != -1) {
        alert("비밀번호에 공백을 넣을 수 없습니다.");
        pw.focus();
        return false;
    } else if (pw.value.search(id.value.substring(0, 3)) > -1) {
        alert("아이디와 3자리 이상 같습니다.");
        pw.focus();
        return false;
    }
    if (name.value == "") {
        alert("이름을 입력하세요.");
        name.focus();
        return false;
    }
    if (nickname.value == "") {
        alert("닉네임을 입력하세요.");
        nickname.focus();
        return false;
    }
    if (phone.value == "") {
        alert("전화번호를 입력하세요.");
        phone.focus();
        return false;
    }

    if (email.value == "") {
        alert("이메일 주소를 입력하세요.");
        email.focus();
        return false;
    }
}