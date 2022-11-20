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
        url : `/v1/boardWrite?&visit_date=${obj.visit_date}&pr_nickname=${obj.pr_nickname}&title=${obj.title}&content=${obj.content}&score=${obj.score}`,
        method : "POST",
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