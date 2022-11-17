package com.example.muvin.service;

import com.example.muvin.domain.place_review.Place_reviewDto;
import com.example.muvin.domain.place_review.Place_reviewRepository;
import com.example.muvin.domain.place_review.Place_review;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
@RequiredArgsConstructor
public class Place_reviewService {


    @Autowired
    private Place_reviewRepository repository;


    //Create
    public Place_review createReview(Place_reviewDto reviewDto){
        Place_review review = new Place_review(reviewDto);
        return repository.save(review);
    }



    //read
    public List<Place_review> readReviewAll(){
        System.out.println("repo : " + repository);
        return repository.findAll();
    }

    public Place_review readByNo(long no){
        Place_review result =repository.findMyReview(no);
        return result;
    }

}
