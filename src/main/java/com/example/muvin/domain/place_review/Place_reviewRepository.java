package com.example.muvin.domain.place_review;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;
import java.util.List;

public interface Place_reviewRepository extends JpaRepository<Place_review, Long>{


    @Query(value ="SELECT * From place_review WHERE no=?",nativeQuery = true)
    Place_review findMyReview(long no);


}
