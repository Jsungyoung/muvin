function updateBoard(){
    let no = $('#no').val();
    let visit_date = $('#visit_date').val();
    let title = $('#title').val();
    let content = $('#content').val();
    let score = $('#score').val();
    console.log(no, visit_date, title, content, score);

    const obj = {
        "no" : no,
        "visit_date" : visit_date,
        "title" : title,
        "content" : content,
        "score" : score
    };
    reqUpdate(obj);
}
function reqUpdate(obj){
    $.ajax({
        url : `/v1/update/board`,

        method : "POST",
    }).done(function (response){
        console.log("response" + response);
        alert("수정 완료");
        location.href=`http://localhost:8084/board`;
    }).fail(error => {
        console.log(error);
    });
}
// function updateBoard(){
//     let no = $('#no').val();
//     let visit_date = $('#visit_date').val();
//     let title = $('#title').val();
//     let content = $('#content').val();
//     let score = $('#score').val();
//     console.log(no, visit_date, title, content, score);
//
//     // const obj = {
//     //     "no" : no,
//     //     "visit_date" : visit_date,
//     //     "title" : title,
//     //     "content" : content,
//     //     "score" : score
//     // };
//     // reqUpdate(obj);
//     let settings = {
//         "url": "/v1/write/board",
//         "method": "POST",
//         "timeout": 0,
//         "headers": {
//             "Content-Type": "application/json"
//         },
//         "data": JSON.stringify({
//                 "no" : no,
//                 "visit_date" : visit_date,
//                 "title" : title,
//                 "content" : content,
//                 "score" : score
//         }),
//     };
//     $.ajax(settings).done(function (response) {
//         console.log(response);
//         alert("글쓰기 성공");
//         location.href="/";
//     });fail(function(error){
//         alert("글쓰기 실패");
//         console.log(error);
//     })
//
// }
