package com.example.muvin.controller;

import com.example.muvin.domain.movie.Movie;
import com.example.muvin.domain.movie.MovieDto;
import com.example.muvin.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MovieController {

    @Autowired
    private MovieService service;

    @GetMapping("/movieView")
    public String movieView() {
//        boolean checkWish = String
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

    @GetMapping("/myTvList")
    public String myTvList() {
        return "movie/myTvList";
    }

    @PostMapping("/v1/movie/add")
    @ResponseBody
    public void addMovie(@RequestParam String userId, @RequestParam String contentId, @RequestParam String contentType, @RequestParam String type) {
        MovieDto movie = new MovieDto(userId, contentId, contentType, type);
        service.createMovie(movie);
    }
}
