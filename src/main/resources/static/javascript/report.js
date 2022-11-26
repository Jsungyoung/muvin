
let category = "";
let placeNo = "";
let reportCode = "";
let content = "";

function showPopup(target){
    window.open(`/report?contentData=${target.id}`, '', "width=300px, height=300px, toolbar=no");
}

function closePopup(){
    window.close();
}

function sendReport(target){
    let selected = target.id.split("/");
    placeNo = selected[0];
    reportCode = selected[1];
    content = $("#content").val();

    console.log(placeNo, reportCode, content, category);
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
    category = target.val();
}