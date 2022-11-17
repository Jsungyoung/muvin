//이메일 입력방식 선택
$('#selectEmail').change(function(){
    $("#selectEmail option:selected").each(function () {

        if($(this).val()=== '1'){ //직접입력일 경우
            $("#str_email02").val('');                //값 초기화
            $("#str_email02").attr("disabled",false); //활성화
        }else{ //직접입력이 아닐경우
            $("#str_email02").val($(this).text());   //선택값 입력
            $("#str_email02").attr("disabled",true); //비활성화
        }

        const email1 = $("#str_email01").val();
        const middle = $("#middle").text();
        const email2 = $("#str_email02").val();
        if(email1 !=="" && email2 !==""){
            $("#email").val(email1+middle+email2);
        }
    });
});

function isSame() {
    let pw = document.getElementById('password').value;
    let checkPw = document.getElementById('passwordCheck').value;

    if (pw !== "" && checkPw !== "") {
        if (pw === checkPw) {
            document.getElementById('same').innerHTML = '비밀번호 일치';
            document.getElementById('same').style.color = 'blue';
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

//joinform_check 함수로 유효성 검사
function sign_check() {
    //변수에 담아주기
    let id = document.getElementById("id");
    let pw = document.getElementById("password");
    let pwCheck = document.getElementById("passwordCheck");
    let name = document.getElementById("name");
    let nickname = document.getElementById("nickname");
    let phone = document.getElementById("phone");
    let email1 = document.getElementById("str_email01");
    let email2 = document.getElementById("str_email02");

    if (id.value === "") {
        alert("아이디를 입력하세요.");
        id.focus();
        return false;
    }

    if (pw.value === "") {
        alert("비밀번호를 입력하세요.");
        pw.focus();
        return false;
    }

    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    let nameCheck = (/^[가-힣]+$/);
    let nickCheck = /^([ㄱ-ㅎ가-힣a-z0-9-_]).{2,10}$/;
    let phoneCheck = /^(01[016789]-)(\d{3,4}-)(\d{4})$/;
    let emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (!pwdCheck.test(pw.value)) {
        alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~16자리 사용해야 합니다.");
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
    if (nickname.value === "") {
        alert("닉네임을 입력하세요.");
        nickname.focus();
        return false;
    }else if(!nickCheck.test(nickname.value)){
        alert("닉네임은 특수문자를 제외한 2~10자리여야 합니다.");
        nickname.focus();
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

    if (email1.value === "") {
        alert("이메일 주소를 입력하세요.");
        email1.focus();
        return false;
    }else if(!emailCheck.test(email2.value)){
        alert("올바른 이메일 형식이 아닙니다");
        email2.focus();
        return false;
    }

    //입력 값 전송
    document.signup.submit(); //유효성 검사의 포인트
}