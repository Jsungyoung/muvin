package com.example.muvin.controller;

import com.example.muvin.domain.place.Place;
import com.example.muvin.domain.place_current.PlaceCurrent;
import com.example.muvin.domain.place_current.PlaceCurrentDto;
import com.example.muvin.domain.place_current.PlaceCurrentRepository;
import com.example.muvin.service.PlaceCurrentService;
import com.example.muvin.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class PlaceCurrentController {

    @Autowired
    private PlaceCurrentService service;

    @PostMapping("/add/place_current")
    public void addPlaceCurrent(int placeNo, HttpServletRequest req){
        HttpSession session = req.getSession();
        String userId = (String)session.getAttribute("log");
        PlaceCurrentDto placeCurrentDto = new PlaceCurrentDto();
        placeCurrentDto.setUserId(userId);
        placeCurrentDto.setPlaceNo(placeNo);
        System.out.println("userId : " + userId + "/ placeNo : " + placeNo);
        PlaceCurrent placeCurrent = new PlaceCurrent(placeCurrentDto);
        service.addPlaceCurrent(placeCurrent);
    }

    @GetMapping("/find/my_place")
    @ResponseBody
    public List<PlaceCurrent> getMyPlaceList(HttpServletRequest request){
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("log");
        List<PlaceCurrent> placeList = service.findMyPlaceAll(userId);
        return placeList;
    }
}
