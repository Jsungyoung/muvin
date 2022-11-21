function delBoard(){
    let no = $('#no').val();
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