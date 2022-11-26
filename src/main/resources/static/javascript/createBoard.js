function createBoard(){
    // let no = $('#no').val();
    let visit_date = $('#visit_date').val();
    let pr_nickname=$('#pr_nickname').val();
    let title = $('#title').val();
    let content = $('#content').val();
    let score = $('#score').val();

    console.log(visit_date, pr_nickname, title, content, score);
    const obj = {

        "visit_date": visit_date,
        "pr_nickname": pr_nickname,
        "title": title,
        "content": content,
        "score": score
    };
    console.log(typeof obj);
    console.log(obj);
    reqBoard(obj);
}

function reqBoard(obj){
    $.ajax({
        // no=${obj.no}
        url : `/v1/boardWrite?&visit_date=${obj.visit_date}&pr_nickname=${obj.pr_nickname}&title=
        ${obj.title}&content=${obj.content}&score=${obj.score}`,
        method : "POST",
        datatype : "JSON"
         // dataType: 'json',
        // contentType: 'application/json',
        // data : obj
    }).done(function (response) {
        console.log("response" + response);
        alert("글쓰기 성공");
        location.href=`http://localhost:8084/board`;
    }).fail(error => {
        console.log(error);
    });
}

function createBoard2(){

    let visit_date = $('#visit_date').val();
    let pr_nickname=$('#pr_nickname').val();
    let title = $('#title').val();
    let content = $('#content').val();
    let score = $('#score').val();

    let settings = {
        "url": "http://localhost:8084/v1/boardWrite",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json",
            "Cookie": "JSESSIONID=C70DD05F126CB465F2A237F4FAF9FFD3"
        },
        "data": JSON.stringify({
            "pr_nickname": "닉네임",
            "title": "제목다시",
            "content": "내용다시",
            "score": 9.9,
            "type": "movie",
            "visit_date": "2022-11-26",
            "id": 1000
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });
}