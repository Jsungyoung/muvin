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

function addWish(){

    const user = document.getElementById('user').value;
    const type = window.location.href.split("?")[1].split("_")[0];
    const typeid = type + "_id";
    const id = (new URL(window.location.href).searchParams).get(typeid);

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
            `<button class="remove" onclick="removeWish()">v 담았어요</button>`
        );
    })
}

function removeWish(){
    const user = document.getElementById('user').value;
    const type = window.location.href.split("?")[1].split("_")[0];
    const typeid = type + "_id";
    const id = (new URL(window.location.href).searchParams).get(typeid);

    console.log(user);
    console.log(type);
    console.log(id);

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
            `<button class="add" onclick="addWish()">+ 담을래요</button>`
        );
    })
}

function removeWishTv(){

}


function loadMyMovie(){

    $.ajax({
        url: "",
        method:"",

    })

}

function loadMyTv(){

}