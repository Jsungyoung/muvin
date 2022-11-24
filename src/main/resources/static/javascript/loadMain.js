function loadMainMovie(){



    // 영진위 일일 박스오피스
    // const date = new Date();
    // const day = "" + date.getFullYear() + (date.getMonth()+1) + (date.getDate()-1);
    // console.log(day);
    // $.ajax({
    //     url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=2e727d1f0bd177ba8acc6a63c5c4288c&targetDt="+day,
    //     method: "GET",
    //     timeout: 0
    // }).done(function (res) {
    //     console.log(res);
    //     const list = res.boxOfficeResult.dailyBoxOfficeList;
    //     for(let i=0; i<10; i++){
    //         const poster_path = list[i].poster_path;
    //         const title = list[i].title;
    //         const movie_id = list[i].id;
    //
    //         $('.popular').append(
    //             `<div class="movie" onclick="location.href='movieView?movie_id=${movie_id}';">
    //                 <div><img class="poster-img" src="https://image.tmdb.org/t/p/original/${poster_path}"></div>
	// 			</div>`
    //         );
    //     }
    //     getPoster(res);
    // });




    // tmdb 상위 랭킹
    $.ajax({
        url: "https://api.themoviedb.org/3/movie/top_rated?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&page=1&region=KR",
        method: "GET",
        timeout: 0
    }).done(function (response) {
        console.log(response);
        const list = response.results;
        for(let i=0; i<10; i++){
            const poster_path = list[i].poster_path;
            const title = list[i].title;
            const movie_id = list[i].id;

            $('.rated').append(
                `<div class="movie" onclick="location.href='movieView?movie_id=${movie_id}';">
                    <div><img class="poster-img" src="https://image.tmdb.org/t/p/original/${poster_path}"></div>
				</div>`
            );
        }


        // list.forEach(e => {
        //     const poster_path = e.poster_path;
        //     const title = e.title;
        //     const audAcc = e.popularity;
        //     const regdate = e.release_date;
        //     const content = e.overview;
        //     const movie_id = e.id;
        //
        //     $('.popular').append(
        //         `<div class="movie" onclick="location.href='movieView?movie_id=${movie_id}';">
        //             <div><img class="poster-img" src="https://image.tmdb.org/t/p/original/${poster_path}"></div>
		// 		</div>`
        //     );
        // });
    });

    // tmdb 인기순
    $.ajax({
        url: "https://api.themoviedb.org/3/discover/movie?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&sort_by=popularity.desc&include_adult=false&page=1&region=KR",
        method: "GET",
        timeout: 0
    }).done(function (response) {
        console.log(response);
        const list = response.results;
        for(let i=0; i<10; i++){
            const poster_path = list[i].poster_path;
            const title = list[i].title;
            const movie_id = list[i].id;

            $('.popular').append(
                `<div class="movie" onclick="location.href='movieView?movie_id=${movie_id}';">
                    <div><img class="poster-img" src="https://image.tmdb.org/t/p/original/${poster_path}"></div>
				</div>`
            );
        }
    });
}