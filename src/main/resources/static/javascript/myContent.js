function findMyContent(user, contentId, c_type, type){
    $.ajax({
        url : "/v1/content/findContent",
        method : "get",
        data : {
            "userId" : user,
            "contentId" : contentId,
            "contentType" : c_type,
            "type" : type
        }
    }).done(function(res){

    })
}

const user = document.getElementById('user').value;
const type = window.location.href.split("?")[1].split("_")[0];
const typeid = type + "_id";
const id = (new URL(window.location.href).searchParams).get(typeid);

function checkContent(){
    $.ajax({
        url: "/v1/movie/checkContent",
        method: "get",
        data: {
            "userId" : user,
            "contentId" : id,
            "contentType" : type,
            "type" : "wish"
        }
    }).done(function(res){
        console.log(res);
        if(res === true) {
            $('.mylist').append(
                `<span class="add" onclick="removeWish()"><i class="fa-solid fa-heart"></i> 담았어요</span>`
            );
        } else{
            $('.mylist').append(
                `<span class="remove" onclick="addWish()"><i class="fa-regular fa-heart"></i> 담을래요</span>`
            );
        }
    })
}

function addWish(){
    $.ajax({
        url: "/v1/content/add",
        method: "POST",
        timeout: 0,
        data: {
            "userId" : user,
            "contentId" : id,
            "contentType" : type,
            "type" : "wish"
        }
    }).success(function(res){
        console.log(res);
        $('.mylist').empty();
        $('.mylist').append(
            `<span class="remove" onclick="removeWish()"><i class="fa-solid fa-heart"></i> 담았어요</span>`
        );
    })
}

function removeWish(){
    $.ajax({
        url: "/v1/content/delete",
        method: "DELETE",
        timeout: 0,
        data: {
            "userId" : user,
            "contentId" : id,
            "contentType" : type,
            "type" : "wish"
        }
    }).success(function(res){
        $('.mylist').empty();
        $('.mylist').append(
            `<span class="add" onclick="addWish()"><i class="fa-regular fa-heart"></i> 담을래요</span>`
        );
    })
}

function removeWishTv(){

}


function loadMyContent(){
    const type = window.location.href.split("y")[1].split("L")[0];
    $.ajax({
        url: "/v1/content/getList",
        method:"GET",
        data : {
            "userId" : user,
            "contentType" : type
        }
    }).done(function(response){
        console.log(response);
        response.forEach(e => {
            const c_id = e.contentId;
            $.ajax({
                url: "https://api.themoviedb.org/3/"+type+"/"+c_id+"?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko",
                method: "GET",
                timeout: 0
            }).done(function (res) {
                console.log(res);
                const poster_path = res.poster_path;
                let title = "";
                if(type == "movie"){
                    title = res.title;
                } else {
                    title = res.name;
                }
                $('#wish').append(
                    `<div><div class="content" onclick="location.href='${type}View?${type}_id=${c_id}';">
                    <img class="poster_img" src="https://image.tmdb.org/t/p/original/${poster_path}"/>
                    </div><div>${title}</div></div>`
                );
            })
        })
    })

}

function loadMyTv(){

}