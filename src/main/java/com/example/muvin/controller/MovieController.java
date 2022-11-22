package com.example.muvin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {



    @GetMapping("/search")
    public String search(){
        return "movie/search";
    }

    @GetMapping("/movieView")
    public String movieView() {
        return "movie/movieView";
    }
//    나중에 여기서 영화 제목이든 코드든 받아서 넘기는 처리해야 됨...

    @GetMapping("/movieAll")
    public String movieAll(){
        return "movie/movieAll";
    }

    @GetMapping("/placeSearch")
    public String placeSearch(){
        return "movie/placeSearch";
    }


    @GetMapping("/tvView")
    public String tvView() {
        return "movie/tvView";
    }

    @GetMapping("/dramaAll")
    public String dramaAll(){
        return "movie/dramaAll";
    }
}
