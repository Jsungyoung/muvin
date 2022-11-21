function getMovie(movie_id){
    const urlParams = new URL(window.location.href).searchParams;
    const movieid = urlParams.get('movie_id');

    $.ajax({
        url: "https://api.themoviedb.org/3/movie/" + movieid + "?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko",
        method: 'GET',
        timeout: 0
    }).done(function (res) {
        console.log(res);
        const title = res.title;
        const genre = [];
        res.genres.forEach(e => {genre.push(e.name);})
        const runtime = res.runtime;
        const poster_path = res.poster_path;
        const detail = res.overview;
        const releasedate = res.release_date;

        $('.movie-view').append(
            `<div id = "movie-title">${title}</div>
            <div class="movie-info">
                <div class="image-container"><img class="image" src="https://image.tmdb.org/t/p/original/${poster_path}"></div>
                    <table>
                        <tbody class="info-table">
                            <tr>
                                <td>개봉일</td>
                                <td>${releasedate}</td>
                            </tr>
                            <tr>
                                <td>감독</td>
                                <td id="director"></td>
                            </tr>
                            <tr>
                                <td>별점</td>
                                <td>가져오기</td>
                            </tr>
                            <tr>
                                <td>장르</td>
                                <td>${genre}</td>
                            </tr>
                            <tr>
                                <td>상영 시간</td>
                                <td>${runtime}분</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>`
        );



        $.ajax({
            url: "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=CKA71K1PJ7OSNRPAAK9W&query="+title+"&releaseDts="+releasedate+"&createDte="+releasedate,
            method: "GET",
            timeout: 0,
            headers: {
                "Cookie": "JSESSIONID=233DDC54CCE62B6C804553C557BC113F"
            }}).done(function (response) {
            const obj = JSON.parse(response);
            // console.log(obj);
            console.log(obj);
            const details = obj.Data[0].Result[0];
            $('.info-table').append(
                `<tr>
                    <td>국가</td>
                    <td>${details.nation}</td>
                </tr>
                <tr>
                    <td>심의등급</td>
                    <td>${details.rating}</td>
                </tr>`
            );
            const actor = details.actors.actor;
            actor.forEach(e =>
                $('#actors').append(`<p>${e.actorNm}</p>`)
            )
            const director = [];
            details.directors.director.forEach(e =>
                $('#director').append(`${e.directorNm} `)
            )
            const keywords = details.keywords.split(',');
            keywords.forEach(e => $('#keywords').append(`<span class="keyword">${e}</span>`))

        });

        $('#plot').append(
            `<p>${detail}</p>`
        );


    });
}

