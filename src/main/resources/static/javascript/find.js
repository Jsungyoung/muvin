$("#check").click(function () {
    let phoneCheck = /^(01[016789]-)(\d{3,4}-)(\d{4})$/;
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
    }else if(!phoneCheck.test(phone)){
        alert("(-) 입력해주세요.");
        $("#phone").focus();
        return false;
    }
});