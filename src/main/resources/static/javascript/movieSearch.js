function getMovie(movie_id){
    const urlParams = new URL(window.location.href).searchParams;
    const movieid = urlParams.get('movie_id');
    console.log(movieid);
    const user = document.getElementById('user').value;
    console.log(user);

    checkContent();

    $.ajax({
        url: "https://api.themoviedb.org/3/movie/" + movieid + "?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&append_to_response=recommendations",
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
        const releasedate = res.release_date+"";
        const rating = (res.vote_average+"").substring(0,3);

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
                                <td>${rating}점</td>
                            </tr>
                            <tr>
                                <td>장르</td>
                                <td>${genre}</td>
                            </tr>
                            <tr>
                                <td>상영 시간</td>
                                <td>${runtime}분</td>
                            </tr>
                            <tr colspan="2">
                                <td><button value="+찜하기"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>`
        );

        const recommend = res.recommendations.results;
        recommend.forEach(e => {
            const rec_poster = e.poster_path;
            const rec_title = e.title;
            const rec_id = e.id;
            $('#related').append(
                `<div class="recommend" onclick="location.href='movieView?movie_id=${rec_id}';">
                    <div class="img_container"><img class="image" src="https://image.tmdb.org/t/p/original/${rec_poster}"/></div>
                    <div class="rec_title">${rec_title}</div>
                </div>`
            )
        })

        const date = releasedate.substring(0,4) + releasedate.substring(5,7) + releasedate.substring(8,10);
        console.log(date);

        $.ajax({
            url: "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&ServiceKey=CKA71K1PJ7OSNRPAAK9W&query="+title+"&releaseDts="+date+"&createDte="+date,
            method: "GET",
            timeout: 0,
            headers: {
                "Cookie": "JSESSIONID=233DDC54CCE62B6C804553C557BC113F"
            }}).done(function (response) {
            const obj = JSON.parse(response);
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
            if(keywords !== null)
                keywords.forEach(e => $('#keywords').append(`<span class="keyword">${e}</span>`))
        });

        $('#plot').append(
            `<p>${detail}</p>`
        );
    });
}

function getPosterById(movie_id){
    $.ajax({
        url: "https://api.themoviedb.org/3/movie/" + movieid + "?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko",
        method: 'GET',
        timeout: 0
    }).done(function (res) {
        console.log(res);
        const poster_path = res.poster_path;
        return poster_path;
    });
    return null;
}