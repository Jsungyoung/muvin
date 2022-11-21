let page = 1;


const genre = document.getElementsByClassName("genre_name");

const nonClick = document.querySelectorAll(".non_click_genre");

function handleClick(event) {
    // div에서 모든 "click" 클래스 제거
    nonClick.forEach((e) => {
        e.classList.remove("click_genre");
    });
    // 클릭한 div만 "click"클래스 추가
    event.target.classList.add("click_genre");
    return event.target.classList.id;
}

nonClick.forEach((e) => {
    e.addEventListener("click", handleClick);
});

function getGenre(){
    $(document).ready(function(){
        $(".genre_name non_click_genre").attr("class","변경 할 클래스명");
    });
}


// function getGenre(event) {
//     console.log(event.target);
//     console.log(this);
//     console.log(event.target.classList);
//
//     if (event.target.classList[1] === "clicked") {
//         event.target.classList.remove("clicked");
//     } else {
//         for (var i = 0; i < div2.length; i++) {
//             genre[i].classList.remove("clicked");
//         }
//
//         event.target.classList.add("clicked");
//     }
// }

function init() {
    for (var i = 0; i < genre.length; i++) {
        genre[i].addEventListener("click", getGenre());
    }
}

init();



function getAllMovie(){
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

    const genre = getGenre();

    $.ajax({
        url: "https://api.themoviedb.org/3/discover/movie?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&include_adult=false&watch_region=KR&page="+page+"&region=KR&with_genres="+genre_id,
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