package com.example.muvin.service;

import com.example.muvin.domain.place_review.Place_reviewDto;
import com.example.muvin.domain.place_review.Place_reviewRepository;
import com.example.muvin.domain.place_review.Place_review;
import com.mysql.cj.MysqlxSession;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;


@Service
@RequiredArgsConstructor
public class Place_reviewService {


    @Autowired
    private Place_reviewRepository repository;

    //Create
    public void createView(Place_reviewDto reviewDto){
        Place_review review = new Place_review(reviewDto);
        repository.save(review);
    }
    //read
    public List<Place_review> readReviewAll(){
        System.out.println("repo : " + repository);
        return repository.findAll();
    }
    public List<Place_review> readByIdAndType(String type, int id){
        return repository.findByTypeAndId(type, id);
    }

    public Place_review readByNo(long no){
        Place_review result =repository.findMyReview(no);
        return result;
    }

    public List<Place_review> readByNickName(String pr_nickname){
        return repository.findByNickname(pr_nickname);
    }
    public int maxSearch(){
        return repository.searchMaxNo();
    }

    public List<Place_review> readByTitle(String title){
        return repository.findTitle(title);
    }
    public List<Place_review> readByContent(String content){
        return repository.findContent(content);
    }
    //Update
    @Transactional
    public void UpdateByNo(Place_reviewDto reviewDto){
        Place_review review = readByNo(reviewDto.getNo());
        if(review!=null){
            review.setPlace_review(reviewDto);
        }
    }
    @Transactional
    public void DeleteBoard(long no){
        repository.deleteById(no);
    }







}
