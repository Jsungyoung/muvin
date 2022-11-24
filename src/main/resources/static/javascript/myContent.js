
function addWishMovie(){

    const user = $('.add').attr('id');
    console.log(user);
    const id = (new URL(window.location.href).searchParams).get('movie_id');
    console.log(id);

    $.ajax({
        url: "/v1/movie/add",
        method: "POST",
        timeout: 0,
        data: {
            "userId" : user,
            "contentId" : id,
            "contentType" : "movie",
            "type" : "wish"
        }
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