package com.example.muvin.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class RoadViewController {

    @GetMapping("/roadView")
    public String roadView(){return "map/roadView";}

}
