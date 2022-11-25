
let category = "";
let placeNo = "";
let reportCode = "";
let content = "";


function sendReport(){
    placeNo = $("#placeNo").val();
    content = $("#content").val();
    category =
    $.ajax({
        method:"POST",
        url: "http://localhost:8084/add/report",
        data: {
            category: category,
            placeNo: placeNo,
            reportCode: reportCode,
            content: content
        }
    }).done(function(){
        alert("신고가 전송되었습니다.");
    })
}

function changeCategory(target){
    reportCode = target.val();
}