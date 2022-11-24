
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
    });
}