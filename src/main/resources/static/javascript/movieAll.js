var page = 1;

function getAllMovie(){
    var settings = {
        "url": "https://api.themoviedb.org/3/movie/top_rated?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&region=KR&page="+page,
        "method": "GET",
        "timeout": 0,
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        const list = response.results;
        list.forEach(e => {
            const poster_path = e.poster_path;
            const title = e.title;
            const releasedate = e.release_date;

            $('.movie_all').append(
                `<div class="movie" onclick="movieView">
                    <img class="poster_img" src="https://image.tmdb.org/t/p/original/${poster_path}"></img>
                </div>`
            );
        });
    });
}

function getMovieByGenre(genre_id){
    var settings = {
        "url": "https://api.themoviedb.org/3/discover/movie?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&include_adult=false&watch_region=KR&page="+page+"&region=KR&with_genres="+genre_id,
        "method": "GET",
        "timeout": 0,
    };

    $.ajax(settings).done(function (response) {
        console.log(response);
        $('.movie_all').empty();
        const list = response.results;
        list.forEach(e => {
            const poster_path = e.poster_path;
            const title = e.title;
            const releasedate = e.release_date;

            $('.movie_all').append(
                `<div class="movie" onclick="movieView">
                    <img class="poster_img" src="https://image.tmdb.org/t/p/original/${poster_path}"></img>
                </div>`
            );
        });

    });
}

$(window).scroll(function() {

    if ( $(window).scrollTop() == $(document).height() - $(window).height() ) {
        page ++;
        getMovieByGenre();
    }

});