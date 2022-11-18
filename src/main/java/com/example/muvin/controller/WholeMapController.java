package com.example.muvin.controller;


import com.example.muvin.domain.place.Place;
import com.example.muvin.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class WholeMapController {

    @Autowired
    private PlaceService placeService;

    @GetMapping
    public List<Place> getPlaceByMovieCode(String movie_code){
        return placeService.placeListByMovie_code(movie_code);
    }



    @RequestMapping("/wholeMap")
    public void wholeMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        List<Place> list = getPlaceByMovieCode("2");
        request.setAttribute("list", list);
        request.getRequestDispatcher("/WEB-INF/views/map/wholeMap.jsp").forward(request, response);
        }

    @GetMapping("/wholeMap/navi")
    public String navi(){
        String command =
                "curl 'https://naveropenapi.apigw.ntruss.com/map-direction-15/v1/driving?start={출발지}&goal={목적지}&option={탐색옵션}'" ;
        ProcessBuilder processBuilder = new ProcessBuilder(command.split(" "));
        return "map/navi";
    }

    @GetMapping("/wholeMap/roadView")
    public String roadView(){
        return "map/roadView";
    }


    @GetMapping("v1/map")
    public List<Place> getPlaceAll(){return placeService.getAllPlace();}

    @RequestMapping("/map")
    public void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Place> placeList = getPlaceAll();
        request.setAttribute("placeList", placeList);
        request.getRequestDispatcher("/WEB-INF/views/map/map.jsp").forward(request, response);

    }


}
