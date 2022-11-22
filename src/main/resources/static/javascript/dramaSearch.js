function getDrama(tv_id){
    const urlParams = new URL(window.location.href).searchParams;
    const dramaid = urlParams.get('tv_id');
    console.log(dramaid);

    $.ajax({
        url: "https://api.themoviedb.org/3/tv/"+dramaid+"?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&include_null_first_air_dates=false&language=ko",
        method: "GET",
        timeout: 0
    }).done(function (res) {
        console.log(res);
        const title = res.name;
        const poster_path = res.poster_path;
        const detail = res.overview;
        const genre=[];
        res.genres.forEach(e => {genre.push(getGenre(e.id));})
        console.log(genre[0]);
        const releasedate = res.first_air_date;
        const season = res.number_of_seasons;
        const epi = res.number_of_episodes;
        const directors = res.created_by;
        const rating = (res.vote_average+"").substring(0,3);
        console.log(translate("test"));
        // const nation = translate(res.origin_country);
        const seasons = [];
        res.seasons.forEach(e => {
            $('#season').append(
                `<div>
                    <p>${e.name}</p>
                    <p>방영일: ${e.air_date}</p>
                </div>`
            );
        })


        $('.drama-view').append(
            `<div id = "drama-title">${title}</div>
            <div class="drama-info">
                <div class="image-container"><img class="image" src="https://image.tmdb.org/t/p/original/${poster_path}"></div>
                    <table>
                        <tbody class="info-table">
                            <tr>
                                <td>첫 방영일</td>
                                <td>${releasedate}</td>
                            </tr>
<!--                            <tr>-->
<!--                                <td>감독</td>-->
<!--                                <td id="director"></td>-->
<!--                            </tr>-->
                            <tr>
                                <td>별점</td>
                                <td>${rating}점</td>
                            </tr>
                            <tr>
                                <td>장르</td>
                                <td>${genre}</td>
                            </tr>
<!--                            <tr>-->
<!--                                <td>국가</td>-->
<!--                                <td></td>-->
<!--                            </tr>-->
                            <tr>
                                <td>총 에피소드</td>
                                <td>${season}시즌 ${epi}편</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>`
        );

        // directors.forEach(e => {
        //     const director = e.name;
        //     $('director').
        // })

        $('#plot').append(
            `<p>${detail}</p>`
        );
    });
}

function getGenre(genre){
    if(genre === 10759)
        return "액션/모험";
    else if(genre === 35)
        return "코미디";
    else if(genre === 80)
        return "범죄";
    else if(genre === 99)
        return "다큐멘터리";
    else if(genre === 18)
        return "드라마";
    else if(genre === 10751)
        return "가족";
    else if(genre === 10762)
        return "어린이용";
    else if(genre === 9648)
        return "미스터리";
    else if(genre === 10765)
        return "SF/판타지";
    else if(genre === 10766)
        return "연속극";
    else if(genre == 10768)
        return "전쟁/정치";
    else
        return "";
}

function translate(text){
    $.ajax(
        {
        url: "https://proxy.cors.sh/https://openapi.naver.com/v1/papago/n2mt?source=en&target=ko&text="+text,
        method: "POST",
        timeout: 0,
            headers: {
            ContentType: "application/x-www-form-urlencoded; charset=UTF-8",
            "X-Naver-Client-Id": "8EC16e7lKtU2dC65mKOb",
            "X-Naver-Client-Secret": "A7XMMs4A58"
        }

    }
    ).done(function (response) {
        const result = response.message.result.translatedText;
        return result;
    });
}