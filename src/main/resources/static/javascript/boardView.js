
function getSearchTitle(){
    let keyword = $('#keyword').val();
    console.log(keyword);
    $.ajax({
        type: 'GET',
        // ${search}
        url : `/v1/board/readTitle?title=${keyword}`,
        // data : $("form[name=search-form]").serialize(),
        success : function(result){
            //테이블 초기화
            $('#board_list > tbody').empty();
            if(result.length>=1){
                result.forEach(function(item){
                    str='<tr>'
                    str += "<td>"+item.no+"</td>";
                    str+="<td><a href='boardView?no="+item.no+"'>"+ item.title + "</a></td>";
                    str+="<td>"+item.pr_nickname+"</td>";
                    str+="<td>"+item.visit_date+"</td>";
                    str+="<td>"+item.score+"</td>";
                    str+="<td>"+item.reg_date+"</td>";
                    str+="</tr>"
                    $('#board_list').append(str);
                })
            }
        }
    })
}

function searchExe(type) {
    if(type === "title") {
        getSearchTitle();
    }
    else if(type === "content") {
        getSearchContent();
    }
}

function getSearchContent(){
    let keyword = $('#keyword').val();
    console.log(keyword);
    $.ajax({
        type: 'GET',
        // ${search}
        url : `/v1/board/readContent?content=${keyword}`,
        // data : $("form[name=search-form]").serialize(),
        success : function(result){
            //테이블 초기화
            $('#board_list > tbody').empty();
            if(result.length>=1){
                result.forEach(function(item){
                    str='<tr>'
                    str += "<td>"+item.no+"</td>";
                    str+="<td><a href='boardView?no="+item.no+"'>"+ item.title + "</a></td>";
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

//
urlParam = new URL(window.location.href).searchParams;
let movieid = urlParam.get('movie_id');
let tvid = urlParam.get('tv_id');

function getSearchTitle2(){


    // let keywords = $('#keywords').val();
    // console.log(keywords);
    getWriteButton();

    $('#board_list ').empty();

    str="<thead>"
    str+="<tr>"
    str+="<th scope='col'>글번호!</th>"
    str+="<th scope='col'>제목</th>"
    str+="<th scope='col'>작성자</th>"
    str+="<th scope='col'>방문일</th>"
    str+="<th scope='col'>별점</th>"
    str+="<th scope='col'>작성일</th>"
    str+="</tr>"
    str+="</thead>"
    $.ajax({
        type: 'GET',
        // ${search}
        url : `/v1/board/TypeAndId`,
        // data : $("form[name=search-form]").serialize(),
        success : function(result){
            //테이블 초기화

            // $('#board_list ').empty();

                result.forEach(function(item){

                    str+='<tbody>';
                    str+='<tr>';
                    str+= "<td>"+item.no+"</td>";
                    str+="<td><a href='boardView?no="+item.no+"'>"+ item.title + "</a></td>";
                    str+="<td>"+item.pr_nickname+"</td>";
                    str+="<td>"+item.visit_date+"</td>";
                    str+="<td>"+item.score+"</td>";
                    str+="<td>"+item.reg_date+"</td>";
                    str+="</tr>";
                    str+="</tbody>";
                })
                    $('#board_list').append(str);

        }
    })
}
function getWriteButton(){
    $('#write_button').empty();
    str = "<button type='button' style='color: black' onClick='location.href=`/boardWriteForm`'>글쓰기</button>";
    $('#write_button').append(str);
}