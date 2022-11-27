
// function createBoard2(){
//     // let no = $('#no').val();
//     let visit_date = $('#visit_date').val();
//     let pr_nickname=$('#pr_nickname').val();
//     let title = $('#title').val();
//     let content = $('#content').val();
//     let score = $('#score').val();
//
//     console.log(visit_date, pr_nickname, title, content, score);
//     const obj = {
//
//         "visit_date": visit_date,
//         "pr_nickname": pr_nickname,
//         "title": title,
//         "content": content,
//         "score": score
//     };
//     console.log(typeof obj);
//     console.log(obj);
//     reqBoard(obj);
// }
//
// function reqBoard(obj){
//     $.ajax({
//         // no=${obj.no}
//         url : `/v1/boardWrite?&visit_date=${obj.visit_date}&pr_nickname=${obj.pr_nickname}&title=
//         ${obj.title}&content=${obj.content}&score=${obj.score}`,
//         method : "POST",
//         datatype : "JSON"
//         // dataType: 'json',
//         // contentType: 'application/json',
//         // data : obj
//     }).done(function (response) {
//         console.log("response" + response);
//         alert("글쓰기 성공");
//         location.href=`http://localhost:8084/board`;
//     }).fail(error => {
//         console.log(error);
//     });
// }


function createBoard(){


    const urlParams = new URL(window.location.href).searchParams;
    // let id = (String)session.

    let pr_nickname=getNickname();
    let title = $('#title').val();
    let content = $('#content').val();
    let type = urlParams.get('type');
    let score = $('#score').val();
    let visit_date = $('#visit_date').val();
    let id = urlParams.get('id');
    console.log("createBoard submit");

    let settings = {
        url: "http://localhost:8084/v1/boardWrite",
        method: "POST",
        datatype : "JSON",

        headers: {
            "Content-Type": "application/json"

        },
        "data": JSON.stringify({
            "pr_nickname": pr_nickname,
            "title": title,
            "content": content,
            "type": type,
            "score": score,
            "visit_date": visit_date,
            "id": id
        }),
    };
    console.log("post success");
    $.ajax(settings).done(function (response) {
        console.log(response);
        location.href=`http://localhost:8084/`;
    });
}

function getNickname(){

    let id = $("#user").val();
    console.log(id);
    let pr_nickname = null;
    console.log("pr_nickname" + pr_nickname);

    let settings = {
        url: `http://localhost:8084/find/nickname?id=${id}`,
        method: "GET",
        async: false,
    };
    console.log(pr_nickname);
    $.ajax(settings).done(function (response) {
        pr_nickname = response;
        console.log("pr_nickname" + pr_nickname);
        console.log("response" + response);
    });
    return pr_nickname;
}
