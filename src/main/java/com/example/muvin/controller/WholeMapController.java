package com.example.muvin.controller;


import com.example.muvin.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class WholeMapController {

    @Autowired
    private PlaceService placeService;

    @GetMapping("/wholeMap")
    public String wholeMap(Model model) {
        return "map/wholeMap";}


}
