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

    @RequestMapping("/checkNick")
    public void addPlace(Place place){
        placeService.write(place);
    }
}
