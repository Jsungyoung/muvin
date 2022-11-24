
    // ID 중복검사
    $("#id").keyup(function () {
        let id = $("#id").val();
        id = id.trim();

            $.ajax({
                type: "post",
                url: "/checkId",
                datatype: "text",
                data: {"id": id},
                success: function (result) {
                    if (result === 1) {
                        $("#myid").val("N");
                        $("#myid").text("중복된 아이디입니다.");
                        $("#myid").css('color','red');
                    } else {
                        $("#myid").val("Y");
                        $("#myid").text("사용 가능한 아이디입니다.");
                        $("#myid").css('color','green');
                    }
                }
            });
    });

    // 닉네임
    $("#nickname").keyup(function () {
        let nickCheck = (/^[ㄱ-ㅎ가-힣a-z0-9-_]+$/);
        let nick = $("#nickname").val();
        nick = nick.trim();

        if(!nickCheck.test(nick)){
            $("#myNick").text("특수문자를 넣을 수 없습니다.");
            $("#myNick").css('color','red');
            $("#nickname").focus();
            return false;
        } else {

            $.ajax({
                type: "post",
                url: "/checkNick",
                datatype: "text",
                data: {"nickname": nick},
                success: function (result) {
                    if (result === 1) {
                        $("#myNick").val("N");
                        $("#myNick").text("중복된 닉네임입니다.");
                        $("#myNick").css('color','red');
                    } else {
                        $("#myNick").val("Y");
                        $("#myNick").text("사용 가능한 닉네임입니다.");
                        $("#myNick").css('color','green');
                    }
                }
            });
        }
    });

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

$("#id").keyup(function(event){
    if (!(event.keyCode >=37 && event.keyCode<=40)) {
        let inputVal = $(this).val();
        let check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        if(check.test(inputVal)){
            $(this).val("");
        }
    }
});

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

//joinform_check 함수로 유효성 검사
function sign_check() {
    //변수에 담아주기
    let id = document.getElementById("id");
    let pw = document.getElementById("password");
    let pwCheck = document.getElementById("passwordCheck");
    let name = document.getElementById("name");
    let nickname = document.getElementById("nickname");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");
    let mailCheck = document.getElementById("mail-Check-Btn");
    let warn = document.getElementById("mail-check-warn");
    let myId = document.getElementById("myid");
    let myNick = document.getElementById("myNick");
    let space = document.getElementById("space");
    let same = document.getElementById("same");
    let nameChk = document.getElementById("nameChk");
    let phoneChk = document.getElementById("phoneChk");

    // 정규식
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    let nameCheck = (/^[가-힣]+$/);
    let nickCheck = (/^[ㄱ-ㅎ가-힣a-z0-9-_]+$/);
    let emailCheck =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (id.value === "") {
        myId.innerHTML = '아이디를 입력하세요.';
        myId.style.color = 'red';
        id.focus();
        return false;
    }else if(myId.value === "N"){
        myId.innerHTML = '중복된 아이디입니다. 다시 확인해주세요.';
        myId.style.color = 'red';
        id.focus();
        return false;
    }

    if (pw.value === "") {
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
    if (nickname.value === "") {
        myNick.innerHTML = '닉네임을 입력하세요.';
        myNick.style.color = 'red';
        nickname.focus();
        return false;
    }else if(!nickCheck.test(nickname.value)){
        myNick.innerHTML = '닉네임은 특수문자를 넣을 수 없습니다.';
        myNick.style.color = 'red';
        nickname.focus();
        return false;
    }else if(myNick.value === "N"){
        myNick.innerHTML = '중복된 닉네임입니다. 다시 확인해주세요.';
        myNick.style.color = 'red';
        nickname.focus();
        return false;
    }
    if (phone.value === "") {
        phoneChk.innerHTML = '전화번호를 입력하세요.';
        phoneChk.style.color = 'red';
        phone.focus();
        return false;
    }

    if (email.value === "") {
        warn.innerHTML = '이메일 주소를 입력하세요.';
        warn.style.color = 'red';
        email.focus();
        return false;
    }else if(!emailCheck.test(email.value)){
        warn.innerHTML = '올바른 이메일 형식이 아닙니다.';
        warn.style.color = 'red';
        email.focus();
        return false;
    }
    if(mailCheck.value === "N"){
        warn.innerHTML = '이메일 인증을 해주세요.';
        warn.style.color = 'red';
        return false;
    }else if(warn.value ==="N"){
        warn.innerHTML = '인증번호가 틀렸습니다.';
        warn.style.color = 'red';
        warn.focus();
        return false;
    }
    //입력 값 전송
    document.signup.submit();
}

$('#mail-Check-Btn').click(function() {
    let mailCheck = document.getElementById("mail-check-warn");
    const email = $('#email').val();
    console.log('완성된 이메일 : ' + email);
    const checkInput = $('#mail-check-input')

    if($('#email').val() === ""){
        mailCheck.innerHTML = '이메일을 입력해주세요';
        mailCheck.style.color = 'red';
        $('#email').focus();
        return false;
    }else {

    $.ajax({
        type : 'get',
        url : '/mailCheck?email='+email, //
        success : function (data) {
            console.log("data : " +  data);
            checkInput.attr('disabled',false);
            code =data;
            alert('인증번호가 전송되었습니다.')
            $("#mail-Check-Btn").val("Y");
        }
    }); // end ajax
    }
}); // end send eamil

// 인증번호 비교
// blur -> focus가 벗어나는 경우 발생
$('#mail-check-input').blur(function () {
    const inputCode = $(this).val();
    const $resultMsg = $('#mail-check-warn');

    if(inputCode === code){
        $resultMsg.html('인증번호가 일치합니다.');
        $resultMsg.css('color','green');
        $('#mail-check-warn').val("Y");
        $('#mail-Check-Btn').attr('disabled',true);
        $('#str_email01').attr('readonly',true);
        $('#str_email02').attr('readonly',true);
        $('#str_email02').attr('onFocus', 'this.initialSelect = this.selectedIndex');
        $('#str_email02').attr('onChange', 'this.selectedIndex = this.initialSelect');
    }else{
        $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
        $resultMsg.css('color','red');
        $("#mail-check-warn").val("N");
    }
});
if(sessionStorage.getItem("data")!=null) {
    kakaoOnLoad();
}

function kakaoOnLoad(){
    $("#mail-Check-Btn").val("Y");
    $("#mail-check-warn").val("Y");
    $("#checkId").val("Y");
    $("#myid").val("Y");

    let str = ""+sessionStorage.getItem("data");
    sessionStorage.clear();
    let userInfo = JSON.parse(str);
    let id = $('#id');
    let pw = $('#password');
    let pwCheck = $('#passwordCheck');
    let nickname = $('#nickname');
    let emailId = $('#str_email01');
    let emailAddress = $('#str_email02');
    let email = $('#email');
    id.val(userInfo.id);
    id.attr("readonly", true);
    let pwCode = ""+pwGenerator();
    pw.val(pwCode);
    pw.attr("readonly", true);
    pwCheck.val(pwCode);
    pwCheck.attr("readonly", true);
    nickname.val(""+userInfo.nickname);
    let emailInfo = userInfo.email.split("@");
    console.log(email);
    emailId.val(""+emailInfo[0]);
    emailId.attr("readonly", true);
    emailAddress.val(""+emailInfo[1]);
    emailAddress.attr("readonly", true);
    email.val(emailInfo[0]+"@"+emailInfo[1]);
}

function pwGenerator(){
    const str = ["1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g"
        ,"h","i","j","k","l","n","m","o","p","q","r","s","t","u","v","w","x","y","z",
        "A","B","C","D","E","F","G","H","I","J","K","L","N","M","O","P","Q","R","S",
        "T","U","V","W","X","Y","Z","!","@","#","$","%","^","&","*","-","+","="];
    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,30}$/;
    let pw = "";
    while(!pwdCheck.test(pw)) {
        pw = "";
        for (let i = 0; i < 20; i++) {
            let idx = Math.floor(Math.random() * str.length);
            pw += str[idx];
        }
        console.log(pw);
        console.log(pwdCheck.test(pw));
    }
    return pw;
}
