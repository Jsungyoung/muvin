
function addWishMovie(){

    const user = $('.add').attr('id');
    console.log(user);
    const id = (new URL(window.location.href).searchParams).get('movie_id');
    console.log(id);

    $.ajax({
        url: "/v1/movie/add?userId="+user+"&contentId="+id+"&contentType=movie&type=wish",
        method: "POST",
        dataType: 'json',
        timeout: 0,

    }).success(function(res){
        console.log(res);
    })
}


function loadMyMovie(){

    $.ajax({
        url: "",
        method:"",

    })

}