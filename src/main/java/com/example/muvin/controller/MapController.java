package com.example.muvin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@RequiredArgsConstructor
@Controller
public class MapController {

    @GetMapping("/map/map")
    public String main(){
        return "map/map";
    }

}
