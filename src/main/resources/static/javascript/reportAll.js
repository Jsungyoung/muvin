getList();
function getList(){
    $.ajax({
        method : "GET",
        url : "http://localhost:8084/v1/reportAll"
    }).done(function (res){
        res.forEach(e => {
            let place = getPlace(e.placeNo);
            let placeInfo = getPlaceInfo(place.contentId, e.reportCode);

            let no = e.no;
            let content = e.content;
            let areaName = place.areaName;
            let id = placeInfo.id;
            let title = placeInfo.title;
            $('#container').append(`
               <tr>
                    <td>${no}</td>
                    <td>${content}</td>
                    <td><a href="/${id}">${title}</td>
                    <td>${areaName}</td>
                    <td><input type="button" value="삭제" onclick=""></td>
               </tr>`
            );
        })
    })
}
function getPlace(placeNo){
    let data = "";
    $.ajax({
        async: false,
        method: "GET",
        url: "http://localhost:8084/find/place",
        data: {
            code : placeNo
        }
    }).done(function(res) {
        data = {code: res.code, placeName: res.placeName, areaName: res.areaName, contentId: res.movieCode};
    });
    return data;
}

function getPlaceInfo(contentId, type){
    let data = "";
    let url = "https://api.themoviedb.org/3/";
    if(type===1){
        url += "movie/";
    }else{
        url += "tv/";
    }
    url += contentId;
    let setting = "?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko";
    console.log(url + setting);
    $.ajax({
        async : false,
        url: url + setting,
        method: 'GET',
        timeout: 0
    }).done(function(res){
        if(res.title){
            data = {title:res.title, id:"movieView?movie_id="+ contentId};
        }else{
            data = {title:res.name, id:"tvView?drama_id="+contentId};
        }
    });
    return data;
}