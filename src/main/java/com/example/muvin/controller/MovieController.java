package com.example.muvin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {

    @GetMapping("/movieView")
    public String movieView() {
        return "movie/movieView";
    }

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

    @GetMapping("/search")
    public String search() {
        return "movie/search";
    }

    @GetMapping("/myMovieList")
    public String myMovieList() {
        return "movie/myMovieList";
    }
}
