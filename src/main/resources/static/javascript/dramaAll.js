let page = 1;

function getDramaByGenre(genre_id){
    $.ajax({
        url: "https://api.themoviedb.org/3/discover/tv?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&page=1&without_genres=16,10763,10764,10767&timezone=Asia%2FSeoul&include_null_first_air_dates=false&watch_region=KR&page="+page+"&with_genres="+genre_id,
        method: "GET",
        timeout: 0
    }).done(function (response) {
        console.log(response);
        $('.content_all').empty();
        const list = response.results;
        list.forEach(e => {
            const poster_path = e.poster_path;
            const title = e.name;
            const releasedate = e.first_air_date;
            const drama_id = e.id;

            $('.content_all').append(
                `<div class="content" onclick="location.href='dramaView?drama_id=${drama_id}';">
                    <img class="poster_img" src="https://image.tmdb.org/t/p/original/${poster_path}"></img>
                </div>`
            );
        });
    });
}