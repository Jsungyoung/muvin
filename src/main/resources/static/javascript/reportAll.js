getList();
function getList(){
    $.ajax({
        method : "GET",
        url : "http://localhost:8084/v1/reportAll"
    }).done(function (res){
        res.forEach(e => {
            let no = e.no;
            let content = e.content;
            let reportCode = e.reportCode;

            $('#container').append(`
               <tr>
                    <td>${no}</td>
                    <td>${content}</td>
                    <td><input type="button" value="삭제" onclick=""></td>
               </tr>`
            );
        })
    })
}