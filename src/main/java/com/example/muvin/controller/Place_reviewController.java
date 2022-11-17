package com.example.muvin.controller;

import lombok.RequiredArgsConstructor;

import com.example.muvin.domain.place_review.Place_reviewDto;
import com.example.muvin.domain.place_review.Place_review;
import com.example.muvin.service.Place_reviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class Place_reviewController {

    @Autowired
    private Place_reviewService service;


    @PostMapping("v1/boardWrite")
    public void createReview(@RequestBody Place_reviewDto placeDto){
        service.createReview(placeDto);
    }

    @GetMapping("v1/board/reviewAll")
    public List<Place_review> getReviewAll(){
        return service.readReviewAll();
    }

    @RequestMapping("/board")
    public void board(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         List<Place_review> list = getReviewAll();
         request.setAttribute("list", list);

        // request.getRequestDispatcher("board").forward(request, response);
        request.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(request, response);
    }

    @RequestMapping("/boardWriteForm")
    public void boardWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/boardWriteForm.jsp").forward(request,response);
    }

    @GetMapping("v1/board/reviewNo")
    public Place_review readReviewByNo(long no){
        return service.readByNo(no);
    }


}
