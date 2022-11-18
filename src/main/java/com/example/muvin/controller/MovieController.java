package com.example.muvin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {

    @GetMapping("/movieView")
    public String movieView() {
        return "movie/movieView";
    }
//    나중에 여기서 영화 제목이든 코드든 받아서 넘기는 처리해야 됨...

    @GetMapping("/movieAll")
    public String movieAll(){
        return "movie/movieAll";
    }
}
