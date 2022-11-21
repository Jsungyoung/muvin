function getDrama(drama_id){
    const urlParams = new URL(window.location.href).searchParams;
    const dramaid = urlParams.get('drama_id');
    console.log(dramaid);

    var settings = {
        "url": "https://api.themoviedb.org/3/tv/{tv_id}?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko",
        "method": "GET",
        "timeout": 0,
    };

    $.ajax({
        url: "https://api.themoviedb.org/3/tv/"+dramaid+"?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko",
        method: "GET",
        timeout: 0
    }).done(function (response) {
        console.log(response);
    });
}