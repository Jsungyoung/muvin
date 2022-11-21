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
function getSearchList(){
    $.ajax({
        type: 'GET',
        url : "/getSearchList",
        data : $("form[name=search-form]").serialize(),
        success : function(result){
            //테이블 초기화
            $('#board_list > tbody').empty();
            if(result.length>=1){
                result.forEach(function(item){
                    str='<tr>'
                    str += "<td>"+item.no+"</td>";
                    str+="<td><a href='boardView?no="+item.no+"'>"+ item.no + "</a></td>";
                    str+="<td>"+item.pr_nickname+"</td>";
                    str+="<td>"+item.visit_date+"</td>";
                    str+="<td>"+item.score+"</td>";
                    str+="<td></td>";
                    str+="</tr>"
                    $('#board_list').append(str);
                })
            }
        }
    })
}