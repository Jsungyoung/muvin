package com.example.muvin.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class WholeMapController {

    @GetMapping("/wholeMap")
    public String wholeMap(){return "map/wholeMap";}
}
