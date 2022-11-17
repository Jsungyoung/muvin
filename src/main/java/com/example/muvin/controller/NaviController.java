package com.example.muvin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class NaviController {

    @GetMapping("/navi")
    public String navi(){return "map/navi";}
}
