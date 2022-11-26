
function imageUpdate() {
    let file = document.getElementById('input_img');
    let form = new FormData();
    form.append("image", file.files[0])

    let settings = {
        "url": "https://api.imgbb.com/1/upload?key=8f9b2cfdf7ec509ca282f747a138047b",
        "method": "POST",
        "timeout": 0,
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        console.log("업로드 완료");
        let jx = JSON.parse(response);
        console.log(jx.data.url);
        imageInfoSave(jx.data.url);
    });

}

function getMaxNum(){
    let number = 0;
    let settings = {
        "url": "http://localhost:8084/v1/board/maxInt",
        "method": "GET",
        "timeout": 0,
        "async": false
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        number = response;
    });
    console.log("number : " + number);
    return number;
}
function imageInfoSave(url){


    let review_no = getMaxNum();
    console.log("no :" + review_no);

    let settings = {
        "url": "http://localhost:8084/v1/image/create",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "Content-Type": "application/json",

        },
        "data": JSON.stringify({
            "review_no": review_no,
            "url": url
        }),
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
    });
}
