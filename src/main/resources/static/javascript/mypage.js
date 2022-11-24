
getMyPlace();
function getMyPlace(){
    $.ajax({
        method: "GET",
        url: "http://localhost:8084/find/my_place"
    }).done(function(res) {
        const list = res;
        list.forEach(e => {
            $.ajax({
                method: "GET",
                url: "http://localhost:8084/find/place_info",
                data: {
                    placeNo : e.placeNo
                }
            }).done(function(res) {
                console.log(res)
            })
        })
    })

}