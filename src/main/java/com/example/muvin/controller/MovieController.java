package com.example.muvin.controller;

import com.example.muvin.domain.movie.Movie;
import com.example.muvin.domain.movie.MovieDto;
import com.example.muvin.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MovieController {

    @Autowired
    private MovieService service;

    @GetMapping("/movieView")
    public String movieView() {
        return "movie/movieView";
    }

    @GetMapping("/v1/movie/checkContent")
    @ResponseBody
    public boolean checkContent(@RequestParam String userId, @RequestParam String contentId, @RequestParam String contentType, @RequestParam String type) {
        return service.checkContent(userId, contentId, contentType, type);
    }

    @GetMapping("/v1/content/findContent")
    @ResponseBody
    public Movie findContent(@RequestParam String userId, @RequestParam String contentId, @RequestParam String contentType, @RequestParam String type) {
        return service.findContent(userId, contentId, contentType, type);
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

    @PostMapping("/v1/content/add")
    @ResponseBody
    public Movie addContent(@RequestParam String userId, @RequestParam String contentId, @RequestParam String contentType, @RequestParam String type) {
        MovieDto movie = new MovieDto(userId, contentId, contentType, type);
        return service.createMovie(movie);
    }

    @GetMapping("/v1/content/getList")
    @ResponseBody
    public List<Movie> getContent(@RequestParam String userId, @RequestParam String contentType){
        return service.readMovieByUserIdAndContentType(userId, contentType);
    }

//    @DeleteMapping("/v1/content/remove")
//    @ResponseBody
//    public void removeContent(@RequestParam String userId, @RequestParam String contentId, @RequestParam String contentType, @RequestParam String type) {
//        System.out.println(userId);
//        System.out.println(contentId);
//        System.out.println(contentType);
//        System.out.println(type);
//        MovieDto movie = new MovieDto(userId, contentId, contentType, type);
//        service.deleteContent(movie);
//    }

    @DeleteMapping("/v1/content/delete")
    @ResponseBody
    public void deleteContent(@RequestParam String userId, @RequestParam String contentId, @RequestParam String contentType, @RequestParam String type){
        service.deleteByInfo(userId, contentId, contentType, type);
    }

}
