let page = 1;

const nation = document.getElementsByClassName('nation_name');
const nonClickNation = document.querySelectorAll('.nation_name');

function handleNation(event){
    nonClickNation.forEach((e) => {
        e.classList.remove("click_nation");
    });
    event.target.classList.add("click_nation");
    getMovieByGenre();
}

nonClickNation.forEach((e) => {
    e.addEventListener("click", e => {
        handleNation(e) ;
    } );
});


const genre = document.getElementsByClassName("genre_name");
const nonClickGenre = document.querySelectorAll(".genre_name");

function handleGenre(event) {
    nonClickGenre.forEach((e) => {
        e.classList.remove("click_genre");
    });
    event.target.classList.add("click_genre");
    getMovieByGenre();
}

nonClickGenre.forEach((e) => {
    e.addEventListener("click", e => {
        handleGenre(e) ;
    } );
});

function init() {
    for (var i = 0; i < genre.length; i++) {
        genre[i].addEventListener("click", e => {
            handleGenre(e) ;
        });
    }
    for (var i = 0; i < nation.length; i++) {
        nation[i].addEventListener("click", e => {
            handleNation(e) ;
        });
    }
}



function getAllMovie(){

    const classVal=$(".class").val();

    $.ajax({
        url: "https://api.themoviedb.org/3/movie/top_rated?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&region=KR&page="+page,
        method: "GET",
        timeout: 0
    }).done(function (response) {
        console.log(response);
        const list = response.results;
        list.forEach(e => {
            const poster_path = e.poster_path;
            const title = e.title;
            const releasedate = e.release_date;
            const movie_id = e.id;

            $('.content_all').append(
                `<div class="content" onclick="location.href='movieView?movie_id=${movie_id}';">
                    <img class="poster_img" src="https://image.tmdb.org/t/p/original/${poster_path}"></img>
                </div>`
            );
        });
    });
}

function getMovieByGenre(){
    const genre = $('.click_genre').attr('id');
    const nation = $('.click_nation').attr('id');
    console.log(genre);
    console.log(nation);

    $.ajax({
        url: "https://api.themoviedb.org/3/discover/movie?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&page="+page+"&include_adult=false&page=1&region=KR&with_genres="+genre + "&with_original_language="+nation,
        method: "GET",
        timeout: 0,
    }).done(function (response) {
        console.log(response);
        $('.content_all').empty();
        const list = response.results;
        list.forEach(e => {
            const poster_path = e.poster_path;
            const title = e.title;
            const releasedate = e.release_date;
            const movie_id = e.id;

            $('.content_all').append(
                `<div class="content" onclick="location.href='movieView?movie_id=${movie_id}';">
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