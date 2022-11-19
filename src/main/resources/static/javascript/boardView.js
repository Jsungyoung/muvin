function boardView(){

    // let no = .val();
    console.log("번호 값");
    let settings = {
        "url": `http://localhost:8084/v1/board/reviewNo?no=${no}`,
        "method": "GET",
        "timeout": 0,
        "headers": {
            "": ""
        },
    };
    $.ajax(settings).done(function (response) {
        console.log(response);
        location.href=`http://localhost:8084/boardView?no=${no}`
    });

}