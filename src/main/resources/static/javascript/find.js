$("#check").click(function () {
    let emailCheck =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let id = $("#id").val();
    let email = $("#email").val();
    let phone = $("#phone").val();
    let name = $("#name").val();

    if(name ===""){
        alert("이름을 입력하세요");
        $("#name").focus();
        return false;
    }
    if (phone === "") {
        alert("핸드폰 번호를 입력하세요");
        $("#phone").focus();
        return false;
    }
    if (id === ""){
        alert("아이디를 입력하세요");
        $("#id").focus();
        return false;
    }
    if (email === ""){
        alert("이메일을 입력하세요");
        $("#email").focus();
        return false;
    }else if(!emailCheck.test(email)){
        alert("올바른 형식이 아닙니다.");
        $("#email").focus();
        return false;
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