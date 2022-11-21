package com.example.muvin.controller;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place.PlaceDto;
import com.example.muvin.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @RequestMapping("/add/place")
    @ResponseBody
    public String addPlace(Place place){
        if(placeService.write(place)){
            return "success";
        }
        return "fail";
    }

}
