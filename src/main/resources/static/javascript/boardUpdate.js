// function updateBoard(){
//     let no = $('#no').val();
//     let visit_date = $('#visit_date').val();
//     let title = $('#title').val();
//     let content = $('#content').val();
//     let score = $('#score').val();
//     console.log(no, visit_date, title, content, score);
//
//     const obj = {
//         "no" : no,
//         "visit_date" : visit_date,
//         "title" : title,
//         "content" : content,
//         "score" : score
//     };
//     reqUpdate(obj);
// }
// function reqUpdate(obj){
//     $.ajax({
//         url : "http://localhost:8084/v1/update/board",
//             // "/v1/update/board",
//
//         method : "POST",
//     }).done(function (response){
//         console.log("response" + response);
//         alert("수정 완료");
//         location.href="http://localhost:8084/board";
//     }).fail(error => {
//         console.log(error);
//     });
// }
function updateBoard(){
    let no = $('#no').val();
    let visit_date = $('#visit_date').val();
    let title = $('#title').val();
    let content = $('#content').val();
    let score = $('#score').val();
    console.log(no, visit_date, title, content, score);
    let settings = {
        "url": "/v1/update/board",
        "method": "POST",
        "timeout": 0,
        "contentType" : "application/json",
        "data": JSON.stringify({
                "no" : no,
                "visit_date" : visit_date,
                "title" : title,
                "content" : content,
                "score" : score
        }),
    };
    $.ajax(settings).done(function (response) {
        console.log(response);
        alert("수정완료");
        location.href="/board";
    }).fail(error => {
        console.log(error);
    });
}
