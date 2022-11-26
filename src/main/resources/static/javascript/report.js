
let category = "";
let placeNo = "";
let reportCode = "";
let content = "";

function showPopup(target){
    window.open(`/report?contentData=${target.id}`, 'popup', "width=300px, height=300px, toolbar=no,left=0, right=0, top=0, bottom=0, ");
}

function closePopup(){
    window.close();
}

function sendReport(){
    let selected = new URL(window.location.href).searchParams.get("contentData").split("/");
    console.log(selected)
    placeNo = selected[0];
    reportCode = selected[1];
    content = $("#content").val();

    if(content==="" || category===null) {
        alert("신고 카테고리와 내용을 입력해주십시오.");

    }else{
        $.ajax({
            method: "POST",
            url: "http://localhost:8084/add/report",
            data: {
                category: category,
                placeNo: placeNo,
                reportCode: reportCode,
                content: content
            }
        });

        alert("신고가 전송되었습니다.");
        closePopup();
    }
}

function changeCategory(target){
    category = target.options[target.selectedIndex].value;
}