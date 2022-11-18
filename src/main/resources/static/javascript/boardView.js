function boardView(){

    let no = $('#no').val;
    $.ajax({

        url : `/v1/board/reviewNo?no=${no}`,
        method : "GET",

    }).done(function (response){
        console.log(response);
    }).fail(error =>{
        console.log(error);
    });

}