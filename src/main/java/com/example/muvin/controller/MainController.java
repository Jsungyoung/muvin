package com.example.muvin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @GetMapping("/boardWriteForm")
    public String boardWrite(){
        return "boardWriteForm";
    }


}
