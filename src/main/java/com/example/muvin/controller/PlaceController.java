package com.example.muvin.controller;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place.PlaceDto;
import com.example.muvin.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class PlaceController {

    @Autowired
    private PlaceService placeService;

    @RequestMapping("/add_movie/place")
    @ResponseBody
    public Map<String, Object> addMoviePlace(PlaceDto placeDto){
        placeDto.setSelmord(1);
        Place place = new Place(placeDto);

        return placeService.write(place);
    }

    @RequestMapping("/add_tv/place")
    @ResponseBody
    public Map<String, Object> addTvPlace(PlaceDto placeDto){
        placeDto.setSelmord(2);
        Place place = new Place(placeDto);

        return placeService.write(place);
    }

    @GetMapping("/find/place")
    public Place getMyPlace(@RequestParam int code){
        return placeService.getPlaceByCode(code);
    }


    @DeleteMapping("/del/place")
    public void delPlaceByCode(@RequestParam int code){
        placeService.delPlaceByCode(code);
    }
}
