function delBoard(){
    let no = $('#no').val();
    delImage(no);
    let settings = {
        "url": `/v1/delete/board?no=${no}`,
        "method": "DELETE"

    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        alert("삭제 완료");
        location.href=`http://localhost:8084/board`;
    }).fail(error => {
        console.log(error);
    });
}
function delImage(no){

    let settings = {
        "url": `http://localhost:8084/v1/image/delete?review_no=${no}`,
        "method": "DELETE",

    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });
}