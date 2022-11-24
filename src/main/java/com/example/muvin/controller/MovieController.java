package com.example.muvin.controller;

import com.example.muvin.domain.movie.Movie;
import com.example.muvin.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MovieController {

    @Autowired
    private MovieService service;

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

    @PostMapping("/find/movie")
    @ResponseBody
    public Movie getMovie(@RequestParam int contentId,int selmord){
        String contentType="";
        if(selmord==1){
            contentType="movie";
        }else{
            contentType="tv";
        }
        return service.readMovieByCodeAndContentType(contentId, contentType);
    }
}
