package com.example.muvin.service;

import com.example.muvin.domain.place_review.Place_reviewDto;
import com.example.muvin.domain.place_review.Place_reviewRepository;
import com.example.muvin.entity.Place_review;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class Place_reviewService {


    @Autowired
    private Place_reviewRepository repository;


    public Place_review createReview(Place_reviewDto reviewDto){
        Place_review review = new Place_review();
        review.setNo(reviewDto.getNo());
        review.setVisit_date(reviewDto.getVisit_date());
        review.setPk_nickname(reviewDto.getPk_nickname());
        review.setTitle(reviewDto.getTitle());
        review.setContent(reviewDto.getContent());
        review.setScore(reviewDto.getScore());
        return repository.save(review);
    }

    public List readReviewAll(){
        return repository.findAll();
    }

    public Place_review readByNo(long no){
        Place_review result =repository.findMyReview(no);
        return result;
    }

}
