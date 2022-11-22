function findContent(){

    const title = document.getElementById('query').value;

    console.log(title);
    $.ajax({
        url: "https://api.themoviedb.org/3/search/multi?api_key=1ed33ea0d82bd16f75e379e2025d9f9f&language=ko&page=1&include_adult=false&region=KR&query="+title,
        method: "GET",
        timeout: 0
    }).done(function (response) {
        console.log(response);
        $('.content_all').empty();
        const list = response.results;
        list.forEach(e => {
            const poster_path = e.poster_path;
            const title = e.title;
            const releasedate = e.release_date;
            const id = e.id;
            const media_type = e.media_type;

            $('.content_all').append(
                `<div class="content" onclick="location.href='${media_type}View?${media_type}_id=${id}';">
                    <img class="poster_img" src="https://image.tmdb.org/t/p/original/${poster_path}"></img>
                </div>`
            );
        });
    });
}