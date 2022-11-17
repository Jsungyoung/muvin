package com.example.muvin.controller;

import lombok.RequiredArgsConstructor;

import com.example.muvin.domain.place_review.Place_reviewDto;
import com.example.muvin.entity.Place_review;
import com.example.muvin.service.Place_reviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class Place_reviewController {

    @Autowired
    private Place_reviewService service;


    @PostMapping("/board/write")
    public Place_review createReview(@RequestBody Place_reviewDto placeDto){
        Place_review result = service.createReview(placeDto);
        return result;
    }
    @GetMapping("v1/board/reviewAll")
    public List<Place_review> getReviewAll(){
        return service.readReviewAll();
    }

    @GetMapping("v1/board/reviewNo")
    public Place_review readReviewByNo(long no){
        return service.readByNo(no);
    }


}
