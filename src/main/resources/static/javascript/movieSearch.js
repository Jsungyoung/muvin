function getMovie(movie_id){

    const settings = {
        "url": "https://api.themoviedb.org/3/movie/" + movie_id +"?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko",
        "method": "GET",
        "timeout": 0,
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        const title = title;
        console.log(title);
    });

}