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
    public List<Place> getPlaceByMovieCode(String movie_code) {
        return placeService.placeListByMovie_code(movie_code);
    }


    @RequestMapping("/wholemap")
    public void wholeMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String movie_code = "333";
        List<Place> maplist = getPlaceByMovieCode(movie_code);
        request.setAttribute("maplist", maplist);
        request.getRequestDispatcher("/WEB-INF/views/map/wholeMap.jsp").forward(request, response);
    }

    @GetMapping("/wholeMap/navi")
    public void navi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String place_code = request.getParameter("place_code");


        List<Place> list = placeService.getPlaceByPlaceCode(place_code);
        request.getRequestDispatcher("https://map.kakao.com/link/to/").forward(request,response);
    }




    @GetMapping("v1/map")
    public List<Place> getPlaceAll() {
        return placeService.getAllPlace();
    }

    @RequestMapping("/map")
    public void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        List<Place> placeList = getPlaceAll();
        request.setAttribute("placeList", placeList);
        request.getRequestDispatcher("/WEB-INF/views/map/map.jsp").forward(request, response);

    }
}