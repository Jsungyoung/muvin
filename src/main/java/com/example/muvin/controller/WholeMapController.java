package com.example.muvin.controller;


import com.example.muvin.domain.place.Place;
import com.example.muvin.service.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class WholeMapController {

    @Autowired
    private PlaceService placeService;

    @GetMapping("/v1/wholemap")
    public List<Place> getPlaceByMovieCode(String movie_code) {return placeService.placeListByMovie_code(movie_code);
    }


    @RequestMapping(method = RequestMethod.GET, path="/wholeMap")
    public void wholeMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String movie_code = request.getParameter("idinfo");

        System.out.println(movie_code);
        List<Place> maplist = getPlaceByMovieCode(movie_code);
        request.setAttribute("maplist", maplist);
        request.getRequestDispatcher("/WEB-INF/views/map/wholeMap.jsp").forward(request, response);
    }

    @GetMapping("/wholeMap/navi")
    public void navi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int place_code = Integer.parseInt(request.getParameter("place_code"));


        List<Place> list = placeService.getPlaceByPlaceCode(place_code);
        request.getRequestDispatcher("https://map.kakao.com/link/to/").forward(request,response);
    }



    @GetMapping("v1/map2/")
    public List<Place> getPlaceAllByAreaName(String areaName){
        return placeService.getAllPlaceByAreaName(areaName);
    }

    @GetMapping("v1/map")
    public List<Place> getPlaceAll() {
        System.out.println("getPlaceAll()");
        return placeService.getAllPlace();
    }


    @RequestMapping(method = RequestMethod.GET, path="/map")
    public void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Place> placeList = getPlaceAllByAreaName(request.getParameter("areaName"));
        System.out.println("placeList.size() : " + placeList.size());

        request.setAttribute("placeList", placeList);
        request.getRequestDispatcher("map/map").forward(request, response);

    }
}